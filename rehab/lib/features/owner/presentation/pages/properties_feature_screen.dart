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
        appBar: AppBar(title: const Text('المفضلة')),
        body: BlocBuilder<OwnerCubit, OwnerState>(
          builder: (context, state) {
            if (state is OwnerSuccessState) {
              if (state.homes.isEmpty) {
                return const Center(child: Text('ليس لديك عقارات بعد'));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.homes.length,
                separatorBuilder: (context, index) => Gap(12),
                itemBuilder: (context, index) {
                  final home = state.homes[index];

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(18),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            home.imageUrl,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 90,
                                height: 90,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          ),
                        ),

                        Gap(12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titleForLocale(
                                  context,
                                  home.titleEn,
                                  home.titleAr,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),

                              Gap(6),

                              Text(
                                titleForLocale(
                                  context,
                                  home.cityEn,
                                  home.cityAr,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),

                              Gap(8),

                              Text(
                                '${home.price.toStringAsFixed(0)} ريال / شهر',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),

                        const Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is OwnerErrorState) {
              return Center(child: Text(state.message));
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
