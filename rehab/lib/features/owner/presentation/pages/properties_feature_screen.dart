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
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final booking = state.homes[index];
                  final home = state.homes[index];
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(8),
                        ),
                        child: Image.network(
                          home.imageUrls[0],
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),

                      title: Text(
                        titleForLocale(context, home.titleEn, home.titleAr),
                        style: TextStyle(fontWeight: .bold),
                      ),
                      subtitle: Text(
                        titleForLocale(
                          context,
                          home.descriptionEn,
                          home.descriptionAr,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${home.price} ريال',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            height: 24,
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

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
