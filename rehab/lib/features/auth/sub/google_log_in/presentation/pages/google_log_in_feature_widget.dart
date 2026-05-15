import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/core/constants/app_icons.dart';
import 'package:rehab/features/auth/sub/google_log_in/presentation/cubit/google_log_in_cubit.dart';
import 'package:sizer/sizer.dart';


class GoogleLogInFeatureWidget extends StatelessWidget {
  const GoogleLogInFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleLogInCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<GoogleLogInCubit>();
          return Column(children: [
               FilledButton.icon(
                    onPressed: () => cubit.getGoogleLogInMethod(),
                    label: Text('Sign with Google'),
                    icon: AnyImageView(
                      imagePath: 'assets/icons/app_logo.jpg',
                      height: 3.sh,
                    ),
                  ),
              ],
            );
        },
      ),
    );
  }
}
