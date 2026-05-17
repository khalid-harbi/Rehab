import 'package:moyasar/moyasar.dart';
import 'package:uuid/uuid.dart';
import '../config/env/env.dart';

class Payment {
  PaymentConfig initial({
    required double amount,
    required String description,
  }) {
    return PaymentConfig(
      publishableApiKey: Env.paymentKey,
      amount: (amount * 100).toInt(),
      description: description,
      metadata: {
        'type': 'booking',
        'app': 'rehab',
      },
      givenID: const Uuid().v4(),
    );
  }

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