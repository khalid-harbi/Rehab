import 'package:rehab/core/exports/app_exports.dart';

class InfoTileWidget extends StatelessWidget {
  final String title;
  final String value;

  const InfoTileWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(
          title.replaceAll('_', ' ').toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
