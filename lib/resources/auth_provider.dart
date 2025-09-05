// import 'package:flutter/rendering.dart';
// import 'package:meassage_app/Models/auth_form_state.dart';
// import 'package:riverpod/riverpod.dart';

// class AuthFormNotifier extends StateNotifier<AuthFormState> {
//   AuthFormNotifier() : super(AuthFormState());

//   void togglePasswordVisibility() {
//     state = state.copyWith(isPasswordHidden: !state.isPasswordHidden);
//   }

//   // void updateEmail(String email) {
//   //   String? emailError;
//   //   if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
//   //     emailError = "Invalid email format";
//   //   }
//   //   state = state.copyWith(email: email, emailError: emailError);
//   // }

//   // void updatePassword(String password) {
//   //   String? passwordError;
//   //   if (password.isEmpty || password.length < 6) {
//   //     passwordError = "Password must be at least 6 characters";
//   //   }
//   //   state = state.copyWith(password: password, passwordError: passwordError);
//   // }

//   // void updateName(String name) {
//   //   String? nameError;
//   //   if (name.isEmpty) {
//   //     nameError = "Username cannot be empty";
//   //   }
//   //   state = state.copyWith(name: name, nameError: nameError);
//   // }

//   void updateEmail(String value) {
//   state = state.copyWith(
//     email: value,
//     emailError: _validateEmail(value),
//   );
// }

// String? _validateEmail(String email) {
//   // if (email.isEmpty) return "Enter an email";
//   if (!email.contains("@") || !email.contains(".")) {
//     return "Enter a valid email address";
//   } else {
//     return ""; // no error
//   }
// }

// void updatePassword(String value) {
//   state = state.copyWith(
//     password: value,
//     passwordError: _validatePassword(value),
//   );
// }

// String? _validatePassword(String password) {
//   // if (password.isEmpty) return "Enter a password";
//   if (password.length < 6) return "Password must be at least 6 characters";
//   return "";
// }

// void updateName(String value) {
//   state = state.copyWith(
//     name: value,
//     nameError: _validateName(value),
//   );
// }

// String? _validateName(String name) {
//   // if (name.isEmpty) return "Enter a username";
//   return name.length < 3 ? "Username too short" : '';
  
// }

//   void setLoading(bool isLoading) {
//     state = state.copyWith(isLoading: isLoading);
//   }
// }

// // Define the provider outside the class
// final authFormProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>((ref) {
//   return AuthFormNotifier();
// });

import 'package:meassage_app/Models/auth_form_state.dart';
import 'package:riverpod/riverpod.dart';

class AuthFormNotifier extends StateNotifier<AuthFormState> {
  AuthFormNotifier() : super(AuthFormState());

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordHidden: !state.isPasswordHidden);
  }

  void updateEmail(String email) {
    String? emailError;
    if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      emailError = "Invalid email format";
    }
    state = state.copyWith(email: email, emailError: emailError);
  }

  void updatePassword(String password) {
    String? passwordError;
    if (password.isEmpty || password.length < 6) {
      passwordError = "Password must be at least 6 characters";
    }
    state = state.copyWith(password: password, passwordError: passwordError);
  }

  void updateName(String name) {
    String? nameError;
    if (name.isEmpty) {
      nameError = "Username cannot be empty";
    }
    state = state.copyWith(name: name, nameError: nameError);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}

// Define the provider outside the class
final authFormProvider = StateNotifierProvider<AuthFormNotifier, AuthFormState>((ref) {
  return AuthFormNotifier();
});

