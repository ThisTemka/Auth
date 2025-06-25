import 'package:auth/pages/content/managers/i_content_page_manager.dart';
import 'package:auth/pages/content/translation/content_page_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentPage extends ConsumerWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(contentPageManagerProvider);
    final userState = ref.watch(userStateProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
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
            const SizedBox(height: 70),
            // Аватар пользователя
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100],
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            // Приветствие
            Text(
              ContentPageTranslation.hi,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            // ID пользователя
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  Text(
                    ContentPageTranslation.yourId,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userState.id.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Кнопка выхода
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () => _showLogoutConfirmation(context, manager),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: Text(
                  ContentPageTranslation.logoutButton,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
