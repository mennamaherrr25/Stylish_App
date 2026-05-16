import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_button.dart';
import 'package:stylish_app/core/widgets/custom_text_field.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/auth/widgets/auth_footer.dart';
import 'package:stylish_app/features/auth/widgets/auth_intro.dart';
import 'package:stylish_app/features/auth/widgets/divider_with_text.dart';
import 'package:stylish_app/features/auth/widgets/login_form_section.dart';
import 'package:stylish_app/features/auth/widgets/social_icon_buttons_row.dart';
import 'package:stylish_app/generated/l10n.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 32.r, right: 32.r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthIntro(text: 'Forgot\npassword?'),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: AppColors.greyText,
                    ),
                    hint: CustomTextWidget(
                      text: 'Enter your email address',
                      style: AppTextStyles.medium12.copyWith(
                        color: AppColors.greyText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6.r, top: 18.h),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '*',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' We will send you a message to set or reset your new password',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 42.h),
                  CustomButton(text: S.of(context).submit, onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
