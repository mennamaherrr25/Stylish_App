import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/utils/app_validations.dart';
import 'package:stylish_app/core/widgets/custom_button.dart';
import 'package:stylish_app/core/widgets/custom_text_button.dart';
import 'package:stylish_app/core/widgets/custom_text_field.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/generated/l10n.dart';

import 'package:stylish_app/features/auth/presentation/cubit/login/login_cubit.dart';

class LoginFormSectoin extends StatefulWidget {
  const LoginFormSectoin({super.key});

  @override
  State<LoginFormSectoin> createState() => _LoginFormSectoinState();
}

class _LoginFormSectoinState extends State<LoginFormSectoin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            autofocus: true,
            textInputAction: TextInputAction.next,
            validator: (value) => AppValidators.validateEmail(value),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(passFocusNode);
            },
            prefixIcon: const Icon(Icons.person, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Email',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),

          SizedBox(height: 26.h),

          CustomTextFormField(
            controller: passwordController,
            focusNode: passFocusNode,
            textInputAction: TextInputAction.done,
            validator: (value) => AppValidators.validatePassword(value),
            prefixIcon: const Icon(Icons.lock, color: AppColors.greyText),
            suffixIcon: const Icon(Icons.visibility, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Password',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                onPressed: () {},
                widget: CustomTextWidget(
                  text: 'Forgot Password?',
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 42.h),

          CustomButton(
            text: S.of(context).login,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  // name: 'Menna',
                  // role: 'customer',
                  // avatar: 'https://i.pravatar.cc/150?img=3',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:stylish_app/core/routing/app_routes.dart';
// import 'package:stylish_app/core/theme/app_colors.dart';
// import 'package:stylish_app/core/theme/app_text_styles.dart';
// import 'package:stylish_app/core/utils/app_validations.dart';
// import 'package:stylish_app/core/widgets/custom_button.dart';
// import 'package:stylish_app/core/widgets/custom_text_button.dart';
// import 'package:stylish_app/core/widgets/custom_text_field.dart';
// import 'package:stylish_app/core/widgets/custom_text_widget.dart';
// import 'package:stylish_app/generated/l10n.dart';

// class LoginFormSectoin extends StatefulWidget {
//   const LoginFormSectoin({super.key});

//   @override
//   State<LoginFormSectoin> createState() => _LoginFormSectoinState();
// }

// class _LoginFormSectoinState extends State<LoginFormSectoin> {
//   final GlobalKey<FormState> formKey = GlobalKey();

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final emailfocusNode = FocusNode();
//   final passfocusNode = FocusNode();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     emailfocusNode.dispose();
//     passfocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           CustomTextFormField(
//             validator: (value) => AppValidators.validateEmail(value),
//             autofocus: true,
//             controller: emailController,
//             focusNode: emailfocusNode,
//             onFieldSubmitted: (_) {
//               FocusScope.of(context).requestFocus(passfocusNode);
//             },
//             textInputAction: TextInputAction.next,
//             prefixIcon: Icon(Icons.person, color: AppColors.greyText),
//             hint: CustomTextWidget(
//               text: 'Username or Email',
//               style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
//             ),
//           ),
//           SizedBox(height: 26.h),
//           CustomTextFormField(
//             validator: (value) => AppValidators.validatePassword(value),
//             controller: passwordController,
//             focusNode: passfocusNode,
//             textInputAction: TextInputAction.done,
//             suffixIcon: Icon(Icons.visibility, color: AppColors.greyText),
//             prefixIcon: Icon(Icons.lock, color: AppColors.greyText),
//             hint: CustomTextWidget(
//               text: 'Password',
//               style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CustomTextButton(
//                 onPressed: () => context.push(AppRoutes.forgotPassword),
//                 widget: CustomTextWidget(
//                   text: 'Forgot Password?',
//                   style: AppTextStyles.regular12.copyWith(
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 42.h),
//           CustomButton(
//             text: S.of(context).login,
//             onPressed: () {
//               if (formKey.currentState!.validate()) {
//                 context.go(AppRoutes.getstarted);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
