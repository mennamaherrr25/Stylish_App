import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/utils/app_validations.dart';
import 'package:stylish_app/core/widgets/custom_button.dart';
import 'package:stylish_app/core/widgets/custom_text_field.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:stylish_app/generated/l10n.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final emailfocusNode = FocusNode();
  final passfocusNode = FocusNode();
  final confirmPassfocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    emailfocusNode.dispose();
    passfocusNode.dispose();
    confirmPassfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) => AppValidators.validateEmail(value),
            autofocus: true,
            controller: emailController,
            focusNode: emailfocusNode,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(passfocusNode);
            },
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.person, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Username or Email',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),
          SizedBox(height: 26.h),
          CustomTextFormField(
            obscureText: true,
            validator: (value) => AppValidators.validatePassword(value),
            controller: passwordController,
            focusNode: passfocusNode,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(confirmPassfocusNode);
            },
            textInputAction: TextInputAction.next,
            suffixIcon: Icon(Icons.visibility, color: AppColors.greyText),
            prefixIcon: Icon(Icons.lock, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Password',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),
          SizedBox(height: 26.h),
          CustomTextFormField(
            obscureText: true,
            validator: (value) => AppValidators.validateConfirmPassword(
              value,
              passwordController.text,
            ),
            controller: confirmpasswordController,
            focusNode: confirmPassfocusNode,
            textInputAction: TextInputAction.done,
            suffixIcon: Icon(Icons.visibility, color: AppColors.greyText),
            prefixIcon: Icon(Icons.lock, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Confirm Password',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.r, top: 10.h),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'By clicking the ',
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  TextSpan(
                    text: 'Register',
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' button, you agree to the public offer',
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 42.h),

          CustomButton(
            text: S.of(context).register,

            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<SignupCubit>().signup(
                  name: 'Menna',

                  email: emailController.text.trim(),

                  password: passwordController.text.trim(),

                  role: 'customer',

                  avatar: 'https://picsum.photos/800',
                );
              }
            },
          ),
          // CustomButton(
          //   text: S.of(context).register,
          //   onPressed: () {
          //     if (formKey.currentState!.validate()) {
          //       context.go(AppRoutes.login);
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
