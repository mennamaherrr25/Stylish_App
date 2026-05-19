import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/functions/show_dialog.dart';

import 'package:stylish_app/core/routing/app_routes.dart';

import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_states.dart';

import 'package:stylish_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:stylish_app/features/auth/presentation/widgets/auth_intro.dart';
import 'package:stylish_app/features/auth/presentation/widgets/divider_with_text.dart';
import 'package:stylish_app/features/auth/presentation/widgets/signup_form_section.dart';
import 'package:stylish_app/features/auth/presentation/widgets/social_icon_buttons_row.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        // success
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully')),
          );

          context.go(AppRoutes.login);
        }

        // error
        if (state is SignupFailure) {
          showErrorDialog(context, state.error);

       
         
        }
      },

      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),

          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.r),

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AuthIntro(text: 'Create an\naccount'),

                      // form
                      SignUpFormSection(),

                      SizedBox(height: 24.h),

                      // loading
                      if (state is SignupLoading)
                        const CircularProgressIndicator(),

                      DividerWithText(),

                      SocialIconButtonsRow(),

                      AuthFooter(
                        text: 'I Already Have an Account',

                        textButton: 'Login',

                        onPressed: () {
                          context.go(AppRoutes.login);
                        },
                      ),

                      SizedBox(height: 26.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:stylish_app/core/routing/app_routes.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/auth_footer.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/auth_intro.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/divider_with_text.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/signup_form_section.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/social_icon_buttons_row.dart';

// class SignUpView extends StatelessWidget {
//   const SignUpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(left: 32.r, right: 32.r),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   AuthIntro(text: 'Create an\naccount'),
//                   SignUpFormSection(),
//                   DividerWithText(),
//                   SocialIconButtonsRow(),
//                   AuthFooter(
//                     text: 'I Already Have an Account',
//                     textButton: 'Login',
//                     onPressed: () => context.go(AppRoutes.login),
//                   ),
//                   SizedBox(height: 26.h),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
