import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/services/app_device_utils.dart';
import 'package:rehab/features/profile/presentation/widgets/info_tile_widget.dart';

class AppInfoScreen extends HookWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => AppDeviceUtils.getAllDetails());
    final snapshot = useFuture(future);

    if (!snapshot.hasData) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    final data = snapshot.data!;

    return Scaffold(
      appBar: AppBar(title: const Text("About App")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: data.entries.map((entry) {
          return InfoTileWidget(
            title: entry.key,
            value: entry.value?.toString() ?? "-",
          );
        }).toList(),
      ),
    );
  }
}
