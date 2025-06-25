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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Switch.adaptive(
              value: manager.getTranslationType() == TranslationType.ru,
              onChanged: (value) => manager.changeTranslation(
                  value ? TranslationType.ru : TranslationType.en),
              thumbIcon: WidgetStateProperty.all(
                const Icon(Icons.translate),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                          height:
                              ScreenUtil().orientation == Orientation.landscape
                                  ? 10.h
                                  : 40.h),
                      Text(
                        LoginPageTranslation.title,
                        style: TextStyle(
                          fontSize: 24.spMin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        LoginPageTranslation.welcome,
                        style: TextStyle(
                          fontSize: 18.spMin,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        LoginPageTranslation.enterEmail,
                        style: TextStyle(
                          fontSize: 16.spMin,
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
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed:
                        pageDataState.isLoading ? null : () => manager.login(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      disabledBackgroundColor: Colors.grey,
                    ),
                    child: pageDataState.isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            LoginPageTranslation.loginButton,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.spMin,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ));
  }
}
