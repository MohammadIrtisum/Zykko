class AuthFormState {
  final String name;
  final String userName; // Added userName
  final String email;
  final String password;
  final String? nameError;
  final String? userNameError; // Optionally, add userNameError
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  final bool isPasswordHidden;

  AuthFormState({
    this.name = '',
    this.userName = '', // Initialize userName
    this.email = '',
    this.password = '',
    this.nameError,
    this.userNameError, // Optionally, add userNameError
    this.emailError,
    this.passwordError,
    this.isLoading = false,
    this.isPasswordHidden = true,
  });

  bool get isFormValid =>
      emailError == null &&
      passwordError == null &&
      (name.isEmpty || nameError == null) &&
      (userName.isEmpty || userNameError == null); // Validate userName

  AuthFormState copyWith({
    String? name,
    String? userName, // Add userName
    String? email,
    String? password,
    String? nameError,
    String? userNameError, // Add userNameError
    String? emailError,
    String? passwordError,
    bool? isLoading,
    bool? isPasswordHidden,
  }) {
    return AuthFormState(
      name: name ?? this.name,
      userName: userName ?? this.userName, // Copy userName
      email: email ?? this.email,
      password: password ?? this.password,
      nameError: nameError ?? this.nameError,
      userNameError: userNameError ?? this.userNameError, // Copy userNameError
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
    );
  }
}