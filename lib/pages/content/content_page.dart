import 'package:auth/pages/content/managers/i_content_page_manager.dart';
import 'package:auth/pages/content/translation/content_page_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentPage extends ConsumerWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(contentPageManagerProvider);
    final userState = ref.watch(userStateProvider);

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                      height: ScreenUtil().orientation == Orientation.landscape
                          ? 10.h
                          : 80.h),
                  // Аватар пользователя
                  Container(
                    width: ScreenUtil().orientation == Orientation.landscape
                        ? 120.h
                        : 120.w,
                    height: ScreenUtil().orientation == Orientation.landscape
                        ? 120.h
                        : 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[100],
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.w,
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: ScreenUtil().orientation == Orientation.landscape
                          ? 60.h
                          : 60.w,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Приветствие
                  Text(
                    ContentPageTranslation.hi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.spMin,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // ID пользователя
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      children: [
                        Text(
                          ContentPageTranslation.yourId,
                          style: TextStyle(
                            fontSize: 16.spMin,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          userState.id.toString(),
                          style: TextStyle(
                            fontSize: 20.spMin,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            // Кнопка выхода
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton.icon(
                onPressed: () => _showLogoutConfirmation(context, manager),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                icon: Icon(Icons.logout),
                label: Text(
                  ContentPageTranslation.logoutButton,
                  style: TextStyle(fontSize: 18.spMin),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(
      BuildContext context, IContentPageManager manager) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(ContentPageTranslation.confirmLogoutTitle),
        content: Text(ContentPageTranslation.confirmLogout),
        actions: [
          TextButton(
            onPressed: () => manager.back(),
            child: Text(ContentPageTranslation.cancel),
          ),
          TextButton(
            onPressed: () => manager.logout(),
            child: Text(
              ContentPageTranslation.logoutButton,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
