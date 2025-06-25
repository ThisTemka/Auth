import 'package:auth/pages/login/managers/i_login_page_manager.dart';
import 'package:auth/pages/login/states/data/i_login_page_data_state.dart';
import 'package:auth/pages/login/states/input/i_login_page_input_state.dart';
import 'package:auth/pages/login/translation/login_page_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void dispose() {
    ref.invalidate(loginPageInputStateProvider);
    ref.invalidate(loginPageDataStateProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final manager = ref.read(loginPageManagerProvider);
    final pageDataState = ref.watch(loginPageDataStateProvider);
    final pageInputState = ref.watch(loginPageInputStateProvider);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: Switch.adaptive(
                value: manager.getTranslationType() == TranslationType.ru,
                onChanged: (value) => manager.changeTranslation(
                    value ? TranslationType.ru : TranslationType.en),
                thumbIcon: WidgetStateProperty.all(
                  const Icon(Icons.translate),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              LoginPageTranslation.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              LoginPageTranslation.welcome,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              LoginPageTranslation.enterEmail,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: pageInputState.inputEmailController,
              onChanged: (value) => manager.inputEmail(value),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: LoginPageTranslation.enterEmailHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                errorText: pageDataState.error,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => manager.login(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                ),
                child: Text(
                  LoginPageTranslation.loginButton,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
