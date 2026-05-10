import 'package:flutter/material.dart';
import 'package:rehab/features/auth/sub/login/presentation/pages/login_feature_widget.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/pages/sign_up_feature_widget.dart';

class AuthFeatureScreen extends StatelessWidget {
  const AuthFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                isScrollable: true,
                labelColor: Theme.of(context).colorScheme.primary,

                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                dividerColor: Colors.transparent,
                indicatorPadding: const EdgeInsets.only(right: 10),
                indicatorColor: Theme.of(context).colorScheme.primary,
                tabs: const [
                  Tab(text: 'Sign Up  '),
                  Tab(text: 'Login '),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: const [SignUpFeatureScreen(), LoginFeatureScreen()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
