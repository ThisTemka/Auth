import 'package:auth/pages/confirm/managers/common/i_confirm_page_manager.dart';
import 'package:auth/pages/confirm/managers/resend/i_confirm_page_resend_manager.dart';
import 'package:auth/pages/confirm/states/data/i_confirm_page_data_state.dart';
import 'package:auth/pages/confirm/states/input/i_confirm_page_input_state.dart';
import 'package:auth/pages/confirm/states/timer/i_confirm_page_timer_state.dart';
import 'package:auth/pages/confirm/translation/confirm_page_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPage extends ConsumerStatefulWidget {
  const ConfirmPage({super.key});

  @override
  ConsumerState<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends ConsumerState<ConfirmPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sendManager = ref.read(confirmPageResendManagerProvider);
      sendManager.waitResendCode();
    });
    super.initState();
  }

  @override
  void deactivate() {
    ref.read(confirmPageTimerStateProvider).dispose();
    ref.read(confirmPageInputStateProvider).dispose();

    ref.invalidate(confirmPageTimerStateProvider);
    ref.invalidate(confirmPageDataStateProvider);
    ref.invalidate(confirmPageInputStateProvider);
    ref.invalidate(confirmPageManagerProvider);
    ref.invalidate(confirmPageResendManagerProvider);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final manager = ref.read(confirmPageManagerProvider);
    final resendManager = ref.read(confirmPageResendManagerProvider);

    final pageDataState = ref.watch(confirmPageDataStateProvider);
    final pageInputState = ref.watch(confirmPageInputStateProvider);
    final pageTimerState = ref.watch(confirmPageTimerStateProvider);

    final userState = ref.watch(userStateProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => manager.back(),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                ConfirmPageTranslation.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: ConfirmPageTranslation.enterCode(userState.email!),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(
                      text: userState.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    child: TextField(
                      focusNode: pageInputState.focusNodes[index],
                      controller: pageInputState.controllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        error: pageDataState.error != null
                            ? const SizedBox.shrink()
                            : null,
                      ),
                      onChanged: (value) => manager.inputCode(index, value),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              if (pageDataState.error != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    pageDataState.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 30),
              Center(
                child: pageDataState.resendEnabled
                    ? TextButton(
                        onPressed: () => resendManager.waitResendCode(),
                        child: Text(
                          ConfirmPageTranslation.resendCode,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : Text(
                        ConfirmPageTranslation.resendCodeIn(
                            pageTimerState.countdown),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
              ),
              const Spacer(),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => manager.verifyCode(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    ConfirmPageTranslation.verify,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
