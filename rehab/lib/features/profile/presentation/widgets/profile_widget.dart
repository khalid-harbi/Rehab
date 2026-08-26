import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.action,
    this.onTap,
  });
  final Widget icon;
  final String title;
  final Widget? action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon,
        title: Text(title.tr()),
        trailing: action ?? Icon(Icons.arrow_forward_ios),
        onTap: onTap,
        tileColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
