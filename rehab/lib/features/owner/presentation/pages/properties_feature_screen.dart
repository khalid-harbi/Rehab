import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/utils/localization_helper.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';

class PropertiesFeatureScreen extends StatelessWidget {
  const PropertiesFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<OwnerCubit>()..getOwnerPropertiesMethod(),
      child: Scaffold(
        appBar: AppBar(title: const Text('عقارات')),
        body: BlocBuilder<OwnerCubit, OwnerState>(
          builder: (context, state) {
            if (state is OwnerSuccessState) {
              if (state.homes.isEmpty) {
                return const Center(child: Text('ليس لديك عقارات بعد'));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.homes.length,
                separatorBuilder: (_, __) => Gap(12),
                itemBuilder: (context, index) {
                  final home = state.homes[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  home.imageUrls[0],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Gap(14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      titleForLocale(
                                        context,
                                        home.titleEn,
                                        home.titleAr,
                                      ),
                                      style: const TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: .ellipsis,
                                    ),
                                    Gap(4),
                                    Text(
                                      titleForLocale(
                                        context,
                                        home.descriptionEn,
                                        home.descriptionAr,
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 13,
                                      ),
                                      maxLines: 2,
                                      overflow: .ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Gap(12),
                              Text(
                                '${home.price.toInt()} ريال/\n شهريًا',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(color: Colors.grey[200], height: 1),
                          ),
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                home.isAvailable
                                    ? 'متاح للحجز الآن'
                                    : 'غير متاح للحجز حاليًا',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: home.isAvailable
                                      ? Colors.green[700]
                                      : Colors.red[700],
                                ),
                              ),
                              SizedBox(
                                height: 28,
                                child: Transform.scale(
                                  scale: 0.9,
                                  child: Switch(
                                    value: home.isAvailable,
                                    activeThumbColor: AppColors.primary,
                                    onChanged: (bool value) {
                                      context
                                          .read<OwnerCubit>()
                                          .togglePropertyAvailabilityMethod(
                                            home.id,
                                            home.isAvailable,
                                          );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is OwnerErrorState) {
              return Center(child: Text(state.message));
            }

            return const Center(child: LoadingWidget());
          },
        ),
      ),
    );
  }
}
