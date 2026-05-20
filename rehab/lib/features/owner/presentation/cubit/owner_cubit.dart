import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/owner/domain/use_cases/owner_use_case.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';

@injectable
class OwnerCubit extends Cubit<OwnerState> {
  final OwnerUseCase _ownerUseCase;

  OwnerCubit(this._ownerUseCase) : super(OwnerInitialState());
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

  Future<void> togglePropertyAvailabilityMethod(int propertyId, bool currentStatus) async {
    if (state is! OwnerSuccessState) return;

    final currentState = state as OwnerSuccessState;
    final updatedStatus = !currentStatus;

    // 1. Optimistic Update: Instantly flip the switch in UI
    final updatedHomes = currentState.homes.map((home) {
      if (home.id == propertyId) {
        // Assuming your HomeEntity has a copyWith method
        return home.copyWith(isAvailable: updatedStatus); 
      }
      return home;
    }).toList();

    emit(currentState.copyWith(homes: updatedHomes));

    // 2. Persist backend changes via Supabase
    final result = await _ownerUseCase.togglePropertyAvailability(propertyId, updatedStatus);

    result.when(
      (success) {
        // Do nothing, UI already matches database state perfectly
      },
      (error) {
        // 3. Rollback: If database fails, flip it back to original status and report error
        final rolledBackHomes = currentState.homes.map((home) {
          if (home.id == propertyId) {
            return home.copyWith(isAvailable: currentStatus);
          }
          return home;
        }).toList();
        
        emit(currentState.copyWith(homes: rolledBackHomes));
        emit(OwnerErrorState(message: "Failed to update status: ${error.message}"));
      },
    );
  }
}
