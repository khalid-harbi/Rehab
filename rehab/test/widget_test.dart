import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rehab/core/theme/app_theme.dart';
import 'package:rehab/features/add_ad/presentation/widgets/custom_text_field.dart';
import 'package:rehab/features/owner/presentation/widgets/owner_state_card.dart';

/// يغلّف الودجت بثيم التطبيق الحقيقي، مع إمكانية فرض حجم ضيق
/// لكشف تجاوزات التخطيط.
Widget _host(Widget child, {ThemeData? theme, double width = 400}) {
  return MaterialApp(
    theme: theme ?? AppTheme.lightTheme,
    home: Scaffold(
      body: Center(
        child: SizedBox(width: width, child: child),
      ),
    ),
  );
}

void main() {
  group('OwnerStatCard — بطاقة أرقام لوحة المالك', () {
    testWidgets('تعرض القيمة والعنوان', (tester) async {
      await tester.pumpWidget(
        _host(
          const OwnerStatCard(
            label: 'الحجوزات المدفوعة',
            value: '12',
            icon: Icons.check_circle_outline,
          ),
        ),
      );

      expect(find.text('12'), findsOneWidget);
      expect(find.text('الحجوزات المدفوعة'), findsOneWidget);
    });

    testWidgets('لا تُظهر سهمًا ما لم تكن قابلة للضغط', (tester) async {
      // الخلل الأصلي: سهم ظاهر في البطاقة بلا أي وظيفة عند الضغط.
      await tester.pumpWidget(
        _host(
          const OwnerStatCard(
            label: 'عقاراتي',
            value: '3',
            icon: Icons.apartment_outlined,
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_left_rounded), findsNothing);
      expect(find.byIcon(Icons.chevron_right_rounded), findsNothing);
    });

    testWidgets('تُظهر سهمًا وتستجيب للضغط عند تمرير onTap', (tester) async {
      var taps = 0;

      await tester.pumpWidget(
        _host(
          OwnerStatCard(
            label: 'عقاراتي',
            value: '3',
            icon: Icons.apartment_outlined,
            onTap: () => taps++,
          ),
        ),
      );

      // المضيف LTR افتراضيًا، والسهم يتبع الاتجاه.
      expect(find.byIcon(Icons.chevron_left_rounded), findsOneWidget);

      await tester.tap(find.byType(OwnerStatCard));
      await tester.pump();

      expect(taps, 1);
    });

    testWidgets('لا تتجاوز حدودها بعنوان طويل في عمود ضيق', (tester) async {
      // الارتفاع كان ثابتًا (150) مع maxLines:1، فينكسر التخطيط
      // عند تكبير خط النظام أو طول العنوان.
      await tester.pumpWidget(
        _host(
          const OwnerStatCard(
            label: 'متوسط الدخل لكل حجز مدفوع خلال هذا الشهر والذي قبله',
            value: '12500 ريال',
            icon: Icons.monetization_on_outlined,
          ),
          width: 150,
        ),
      );

      expect(tester.takeException(), isNull);
    });

    testWidgets('تعمل في الوضع الداكن', (tester) async {
      await tester.pumpWidget(
        _host(
          const OwnerStatCard(
            label: 'عقاراتي',
            value: '3',
            icon: Icons.apartment_outlined,
          ),
          theme: AppTheme.darkTheme,
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.text('3'), findsOneWidget);
    });
  });

  group('CustomTextField — حقل نموذج إضافة الإعلان', () {
    testWidgets('يمنع الإرسال والحقل المطلوب فارغ', (tester) async {
      // الخلل الأصلي: النموذج كان يقبل الإرسال بعنوان فارغ وسعر صفر.
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        _host(
          Form(
            key: formKey,
            child: CustomTextField(
              label: 'عنوان الإعلان',
              hint: 'مثال: شقة في حي النرجس',
              isRequired: true,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'هذا الحقل مطلوب' : null,
            ),
          ),
        ),
      );

      expect(formKey.currentState!.validate(), isFalse);
      await tester.pump();
      expect(find.text('هذا الحقل مطلوب'), findsOneWidget);
    });

    testWidgets('يقبل الإرسال بعد تعبئة الحقل', (tester) async {
      final formKey = GlobalKey<FormState>();
      final controller = TextEditingController();

      await tester.pumpWidget(
        _host(
          Form(
            key: formKey,
            child: CustomTextField(
              label: 'عنوان الإعلان',
              hint: 'مثال: شقة في حي النرجس',
              controller: controller,
              isRequired: true,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'هذا الحقل مطلوب' : null,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'شقة في حي النرجس');
      expect(formKey.currentState!.validate(), isTrue);
    });

    testWidgets('يضع نجمة على الحقل المطلوب دون غيره', (tester) async {
      await tester.pumpWidget(
        _host(
          const Column(
            children: [
              CustomTextField(label: 'المدينة', hint: '', isRequired: true),
              CustomTextField(label: 'خط العرض', hint: ''),
            ],
          ),
        ),
      );

      // النص مركّب (Text.rich) فيُقرأ نصّه المسطّح
      String plain(String label) => tester
          .widgetList<Text>(find.byType(Text))
          .map((t) => t.textSpan?.toPlainText() ?? t.data ?? '')
          .firstWhere((t) => t.startsWith(label));

      expect(plain('المدينة'), 'المدينة *');
      expect(plain('خط العرض'), 'خط العرض');
    });

    testWidgets('يرث ألوانه من الثيم الداكن', (tester) async {
      // الخلل الأصلي: fillColor: Colors.white مكتوب يدويًا،
      // فيبقى الحقل أبيض في الوضع الداكن.
      await tester.pumpWidget(
        _host(
          const CustomTextField(label: 'المدينة', hint: 'مثال: الرياض'),
          theme: AppTheme.darkTheme,
        ),
      );

      expect(tester.takeException(), isNull);

      // TextFormField يدمج inputDecorationTheme في الـ decoration الداخلي،
      // فالمطلوب أن يأتي اللون من ثيم الوضع الداكن لا أن يكون أبيض مفروضًا.
      final field = tester.widget<TextField>(find.byType(TextField));
      expect(field.decoration!.fillColor, isNot(Colors.white));
      expect(
        field.decoration!.fillColor,
        AppTheme.darkTheme.inputDecorationTheme.fillColor,
      );
    });
  });
}
