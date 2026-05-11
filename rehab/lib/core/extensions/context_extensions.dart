import 'package:flutter/material.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/features/auth/sub/logout/presentation/cubit/logout_cubit.dart';
import 'package:moyasar/moyasar.dart';
import 'package:rehab/core/services/payment.dart';
import 'package:sizer/sizer.dart';
import 'package:rehab/core/widgets/loading_widget.dart';

extension ContextExtensions on BuildContext {
  // Snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  void showLoading() {
    LoadingWidgetOverlay().show(this);
  }

  void hideLoading() {
    LoadingWidgetOverlay().hide();
  }

  void showLogoutDialog(BuildContext context, LogoutCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "تسجيل الخروج",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("إلغاء", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.getLogoutMethod();
            },
            child: const Text(
              "تسجيل الخروج",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet({required Widget widget, double? height, Color? color}) {
    showModalBottomSheet(
      context: this,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      clipBehavior: .hardEdge,
      builder: (context) => Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        height: height ?? 75.h,
        width: 100.w,
        color: color,
        child: widget,
      ),
    );
  }

  void showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, 
          top: 20,
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "الدفع الآمن",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CreditCard(
                config: Payment().initial(amount: 21.0),
                onPaymentResult: Payment().onPaymentResult,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
