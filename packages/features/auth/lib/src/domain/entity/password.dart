final class Password {
  final String value;

  const Password({required this.value});

  bool get isValid => _passwordRegex.hasMatch(value);

  static bool validate(String value) => _passwordRegex.hasMatch(value);

  static final _passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z0-9_+\-!@.$%^&*()]{8,64}$');
}
