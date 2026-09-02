import 'package:easy_localization/easy_localization.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';
import 'package:rehab/features/owner/domain/use_cases/owner_use_case.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';

@injectable
class OwnerCubit extends Cubit<OwnerState> {
  final OwnerUseCase _ownerUseCase;

  OwnerCubit(this._ownerUseCase) : super(OwnerInitialState());

  /// تحميل اللوحة كاملةً: الأرقام وأحدث العقارات في إصدار واحد للحالة.
  ///
  /// الطريقتان المنفصلتان أدناه كانت كل واحدة تمسح نتيجة الأخرى
  /// (`OwnerSuccessState` جديدة بحقل واحد فقط)، فما كان ممكنًا عرض
  /// الأرقام والعقارات في شاشة واحدة.
  Future<void> loadDashboard() async {
    emit(OwnerLoadingState());

    OwnerEntity? owner;
    List<HomeEntity> homes = const [];
    String? errorMessage;

    final statsResult = await _ownerUseCase.getOwner();
    statsResult.when((success) => owner = success, (error) {
      errorMessage = error.message;
    });

    final propertiesResult = await _ownerUseCase.getOwnerProperties();
    propertiesResult.when((success) => homes = success, (error) {
      errorMessage ??= error.message;
    });

    // الأرقام هي عمود اللوحة؛ بدونها لا معنى لعرضها. أما فشل جلب العقارات
    // وحده فتبقى معه الأرقام ظاهرة وقسم العقارات فارغًا.
    if (owner == null) {
      emit(OwnerErrorState(message: errorMessage ?? 'somethingWentWrong'.tr()));
      return;
    }

    emit(OwnerSuccessState(owner: owner, homes: homes));
  }

  Future<void> getOwnerMethod() async {
    emit(OwnerLoadingState());
    final result = await _ownerUseCase.getOwner();

    result.when(
      (success) {
        emit(OwnerSuccessState(owner: success));
      },
      (error) {
        emit(OwnerErrorState(message: error.message));
      },
    );
  }

  Future<void> getOwnerPropertiesMethod() async {
    emit(OwnerLoadingState());

    final result = await _ownerUseCase.getOwnerProperties();

    result.when(
      (success) {
        emit(OwnerSuccessState(homes: success));
      },
      (error) {
        emit(OwnerErrorState(message: error.message));
      },
    );
  }

  Future<void> togglePropertyAvailabilityMethod(
    int propertyId,
    bool currentStatus,
  ) async {
    if (state is! OwnerSuccessState) return;

    final currentState = state as OwnerSuccessState;
    final updatedStatus = !currentStatus;

    // 1. تحديث متفائل: المفتاح ينقلب في الواجهة فورًا.
    final updatedHomes = currentState.homes.map((home) {
      if (home.id == propertyId) {
        return home.copyWith(isAvailable: updatedStatus);
      }
      return home;
    }).toList();

    emit(currentState.copyWith(homes: updatedHomes));

    final result = await _ownerUseCase.togglePropertyAvailability(
      propertyId,
      updatedStatus,
    );

    result.when(
      (success) {
        // لا شيء — الواجهة تطابق قاعدة البيانات أصلًا.
      },
      (error) {
        // 2. تراجع: إعادة الحالة السابقة عند فشل الحفظ.
        //
        // كان الكود يُصدر بعدها OwnerErrorState فتنهار الشاشة كلها إلى رسالة
        // خطأ لمجرد فشل مفتاح واحد. الآن نكتفي بالتراجع، والشاشة تعرض
        // الرسالة عبر listener فوق الحالة نفسها.
        final rolledBackHomes = currentState.homes.map((home) {
          if (home.id == propertyId) {
            return home.copyWith(isAvailable: currentStatus);
          }
          return home;
        }).toList();

        emit(
          currentState.copyWith(
            homes: rolledBackHomes,
            toggleError: error.message,
          ),
        );
      },
    );
  }

  /// حذف إعلان.
  ///
  /// يُزال من القائمة فورًا ثم يُحذف فعليًا؛ وإن فشل الحذف يعود مكانه
  /// بدل أن تبقى المالكة أمام قائمة تكذب عليها.
  Future<void> deletePropertyMethod(int propertyId) async {
    if (state is! OwnerSuccessState) return;

    final currentState = state as OwnerSuccessState;

    emit(
      currentState.copyWith(
        homes: currentState.homes
            .where((home) => home.id != propertyId)
            .toList(),
      ),
    );

    final result = await _ownerUseCase.deleteProperty(propertyId);

    result.when((success) {}, (error) {
      emit(
        currentState.copyWith(
          homes: currentState.homes,
          toggleError: error.message,
        ),
      );
    });
  }

  /// إعادة تحميل ما تعرضه الشاشة الحالية.
  ///
  /// اللوحة تحتاج الأرقام والعقارات معًا، وصفحة «عقاراتي» تحتاج العقارات
  /// وحدها. تُميَّز الحالتان بوجود `owner` في الحالة، فتستدعي كل شاشة
  /// التحديث الصحيح بلا أن تمرّر شيئًا.
  Future<void> refresh() {
    final current = state;

    if (current is OwnerSuccessState && current.owner != null) {
      return loadDashboard();
    }

    return getOwnerPropertiesMethod();
  }
}
