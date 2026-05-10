import 'package:moyasar/moyasar.dart';
import 'package:uuid/uuid.dart';

import '../config/env/env.dart';

class Payment {
  // converted to named parameters { }
  PaymentConfig initial({required double amount, String? description}) {
    final paymentConfig = PaymentConfig(
      publishableApiKey:
          Env.paymentKey, // Your publishable API key from Moyasar dashboard
      //before:
      // amount: int.parse((amount * 100).toInt()), // SAR 200.01

      // another solution:
      // amount: int.parse((amount * 100).toString()), // SAR 200.01

      //after: no need to int.parse
      amount: (amount * 100).toInt(),
      description: description ?? "nothing",
      metadata: {'size': '250g'},
      givenID: Uuid().v4(),
    );
    return paymentConfig;
  }

  // change it to future and add type to result

  // before:
  // Function<void> onPaymentResult(result) async
  // after
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
