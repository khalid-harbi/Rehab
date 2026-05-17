import 'package:moyasar/moyasar.dart';
import 'package:uuid/uuid.dart';

import '../config/env/env.dart';

class Payment {
  PaymentConfig initial({required double amount, String? description}) {
    final paymentConfig = PaymentConfig(
      publishableApiKey:
          Env.paymentKey, // Your publishable API key from Moyasar dashboard

      amount: (amount * 100).toInt(),
      description: description ?? "nothing",
      metadata: {'size': '250g'},
      givenID: Uuid().v4(),
    );
    return paymentConfig;
  }

  Future<void> onPaymentResult(Object result) async {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          // handle success.
          break;
        case PaymentStatus.failed:
          // handle failure.
          break;
        default:
      }
    }
  }
}
