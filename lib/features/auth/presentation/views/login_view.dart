import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:stylish_app/core/routing/app_routes.dart';

import 'package:stylish_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:stylish_app/features/auth/presentation/cubit/login/login_states.dart';

import 'package:stylish_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:stylish_app/features/auth/presentation/widgets/auth_intro.dart';
import 'package:stylish_app/features/auth/presentation/widgets/divider_with_text.dart';
import 'package:stylish_app/features/auth/presentation/widgets/login_form_section.dart';
import 'package:stylish_app/features/auth/presentation/widgets/social_icon_buttons_row.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.go(AppRoutes.getstarted);
              }

              if (state is LoginFailure) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Login Failed"),
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(left: 32.r, right: 32.r),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AuthIntro(text: 'Welcome\nBack!'),

                      const LoginFormSectoin(),

                      const SizedBox(height: 20),

                      if (state is LoginLoading)
                        const CircularProgressIndicator(),

                      const DividerWithText(),

                      const SocialIconButtonsRow(),
                      AuthFooter(
                        text: 'Create An Account?',
                        textButton: 'Sign Up',
                        onPressed: () => context.go(AppRoutes.home)
                        //context.go(AppRoutes.signup),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:stylish_app/core/routing/app_routes.dart';
// import 'package:stylish_app/features/auth/presentation/cubit/login/login_cubit.dart';
// import 'package:stylish_app/features/auth/presentation/cubit/login/login_states.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/auth_footer.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/auth_intro.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/divider_with_text.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/login_form_section.dart';
// import 'package:stylish_app/features/auth/presentation/widgets/social_icon_buttons_row.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: SafeArea(
//           child: BlocConsumer<LoginCubit, LoginStates>(
//             listener: (context, state) {
            
//             },
//             builder: (context, state) {
//               return Container();
//             },
          
//             child: Padding(
//               padding: EdgeInsets.only(left: 32.r, right: 32.r),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     AuthIntro(text: 'Welcome\nBack!'),
//                     LoginFormSectoin(),
            
                  
//                     DividerWithText(),
//                     SocialIconButtonsRow(),
//                     AuthFooter(
//                       text: 'Create An Account?',
//                       textButton: 'Sign Up',
//                       onPressed: () => context.go(AppRoutes.signup),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
