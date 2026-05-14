import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_button.dart';
import 'package:stylish_app/core/widgets/custom_text_button.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/auth/widgets/auth_footer.dart';
import 'package:stylish_app/features/auth/widgets/auth_intro.dart';
import 'package:stylish_app/features/auth/widgets/divider_with_text.dart';
import 'package:stylish_app/features/auth/widgets/login_form_field.dart';
import 'package:stylish_app/features/auth/widgets/social_icon_buttons_row.dart';
import 'package:stylish_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  AuthIntro(text: 'Welcome\nBack!'),
                  LoginFormFields(),

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
                  CustomButton(text: S.of(context).login),
                  DividerWithText(),
                  SocialIconButtonsRow(),
                  AuthFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}












