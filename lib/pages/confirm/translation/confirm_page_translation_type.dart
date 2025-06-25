enum ConfirmPageTranslationType {
  verification('verification'),
  enterCode('enterCode'),
  resendCode('resendCode'),
  resendCodeIn('resendCodeIn'),
  verify('verify');

  final String key;

  const ConfirmPageTranslationType(this.key);
}
