import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/auth/data/repositories/auth_repository.dart';


void main() {
  group('AuthRepositoryImpl', () {
    final AuthRepository authRepository = AuthRepositoryImpl();

    test('updateUsername should return true on success', () async {
      // Arrange
      const newUsername = 'new_username';

      // Act
      final bool? result = await authRepository.updateUsername(newUsername: newUsername);

      // Assert
      expect(result, true);
    });

    test('updateEmail should return true on success', () async {
      // Arrange
      const newEmail = 'new_email@example.com';

      // Act
      final bool? result = await authRepository.updateEmail(newEmail: newEmail);

      // Assert
      expect(result, true);
    });

    test('updatePassword should return true on success', () async {
      // Arrange
      const currentPassword = 'current_password';
      const newPassword = 'new_password';
      const newPasswordConfirm = 'new_password';

      // Act
      final bool? result = await authRepository.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirm: newPasswordConfirm,
      );

      // Assert
      expect(result, true);
    });

    test('fetchUserData should return User on success', () async {
      // Act
      final User? user = await authRepository.fetchUserData();

      // Assert
      expect(user, isA<User>());
    });

    test('login should return User on successful login', () async {
          // Arrange
          const email = 'test@example.com';
          const password = 'test_password';

          // Act
          final User? user = await authRepository.login(email: email, password: password);

          // Assert
          expect(user, isA<User>());
        });

        test('register should return User on successful registration', () async {
          // Arrange
          const username = 'test_user';
          const email = 'test@example.com';
          const name = 'Test User';
          const password = 'test_password';
          const birthDate = '2000-01-01';
          const reCaptchaText = 'test_captcha';

          // Act
          final User? user = await authRepository.register(
            username: username,
            email: email,
            name: name,
            password: password,
            birthDate: birthDate,
            reCaptchaText: reCaptchaText,
          );

          // Assert
          expect(user, isA<User>());
        });

        test('confirmEmail should return User on successful email confirmation', () async {
          // Arrange
          const otp = '123456';
          const email = 'test@example.com';
          const isSignUp = true;

          // Act
          final User? user = await authRepository.confirmEmail(
            otp: otp,
            email: email,
            isSignUp: isSignUp,
          );

          // Assert
          expect(user, isA<User>());
        });

        test('resendOtp should return a success message on successful resend', () async {
          // Arrange
          const email = 'test@example.com';

          // Act
          final String? result = await authRepository.resendOtp(email: email);

          // Assert
          expect(result, isA<String>());
        });

        test('resetPassword should return true on successful password reset', () async {
          // Arrange
          const password = 'new_password';
          const passwordConfirm = 'new_password';
          const email = 'test@example.com';

          // Act
          final bool? result = await authRepository.resetPassword(
            password: password,
            passwordConfirm: passwordConfirm,
            email: email,
          );

          // Assert
          expect(result, true);
        });

        test('forgetPassword should return true on successful password forget', () async {
          // Arrange
          const email = 'test@example.com';

          // Act
          final bool? result = await authRepository.forgetPassword(email: email);

          // Assert
          expect(result, true);
        });
  });
}
