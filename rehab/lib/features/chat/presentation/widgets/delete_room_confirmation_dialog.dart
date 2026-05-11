import 'package:flutter/material.dart';

Future<bool?> showDeleteRoomConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text("حذف المحادثة"),
      content: const Text("سيتم إخفاء المحادثة من قائمتك فقط."),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text("إلغاء"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialogContext, true),
          child: const Text("حذف"),
        ),
      ],
    ),
  );
}
