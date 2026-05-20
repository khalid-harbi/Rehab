import 'package:rehab/core/exports/app_exports.dart';
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
                  final home = state.homes[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        home.imageUrls[0],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),

                      //TODO: make it multi language
                      title: Text(home.titleAr),
                      subtitle: Text(home.descriptionAr),
                      trailing: Text('${home.price} ريال'),
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
