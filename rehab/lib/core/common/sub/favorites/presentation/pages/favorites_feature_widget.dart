import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/utils/localization_helper.dart';

class FavoritesFeatureWidget extends StatelessWidget {
  const FavoritesFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<FavoritesCubit>()..getFavoriteHomesMethod(),
      child: Scaffold(
        appBar: AppBar(title: const Text('الإعجابات')),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesHomesSuccessState) {
              if (state.homes.isEmpty) {
                return const Center(child: Text('لا توجد إعجابات حالياً'));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.homes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
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

                        const SizedBox(width: 12),

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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 6),

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

                              const SizedBox(height: 8),

                              Text(
                                '${home.price.toStringAsFixed(0)} ريال / شهر',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
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

            if (state is FavoritesErrorState) {
              return Center(child: Text(state.message));
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}