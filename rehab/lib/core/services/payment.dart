import 'package:moyasar/moyasar.dart';
import 'package:uuid/uuid.dart';
import '../config/env/env.dart';

class Payment {
  // <<<<<<< HEAD
  //   PaymentConfig initial({required double amount, String? description}) {
  //     final paymentConfig = PaymentConfig(
  //       publishableApiKey:
  //           Env.paymentKey, // Your publishable API key from Moyasar dashboard

  // =======
  PaymentConfig initial({required double amount, required String description}) {
    return PaymentConfig(
      publishableApiKey: Env.paymentKey,
      amount: (amount * 100).toInt(),
      description: description,
      metadata: {'type': 'booking', 'app': 'rehab'},
      givenID: const Uuid().v4(),
    );
  }

  // <<<<<<< HEAD
  //   Future<void> onPaymentResult(Object result) async {
  // =======
  Future<bool> onPaymentResult(Object result) async {
    if (result is PaymentResponse) {
      if (result.status == PaymentStatus.paid) {
        return true;
      }

      if (result.status == PaymentStatus.failed) {
        return false;
      }
    }

    return false;
  }
}
