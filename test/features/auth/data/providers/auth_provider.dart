import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:x_clone/features/auth/data/states/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('AuthStateNotifier', ()
  {
    late AuthStateNotifier authNotifier;
    late AuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      authNotifier = AuthStateNotifier(mockAuthRepository, AuthState());
    });

    test('initial state is correct', () {
      expect(authNotifier.state, AuthState());
    });

    group('checkAuthStatus', () {
      test('sets user and isLogin to true if authenticated', () async {
        // Arrange
        when(mockAuthRepository.getToken()).thenReturn('mockToken');
        when(mockAuthRepository.getUserData()).thenReturn(
            User(userId: '1', username: 'mockUser'));

        // Act
        await authNotifier.checkAuthStatus();

        // Assert
        expect(authNotifier.state.isLogin, true);
        expect(authNotifier.state.user, isNotNull);
      });

      test('does not set user and isLogin if not authenticated', () async {
        // Arrange
        when(mockAuthRepository.getToken()).thenReturn(null);

        // Act
        await authNotifier.checkAuthStatus();

        // Assert
        expect(authNotifier.state.isLogin, false);
        expect(authNotifier.state.user, isNull);
      });
    });

    // Similar tests for register, updateUser, confirmEmail, resetPassword, forgetPassword, etc.

    group('logout', () {
      test('clears user and sets isLogin to false on logout', () async {
        // Arrange
        when(mockAuthRepository.deleteAuthStorage()).thenReturn(true);
        when(mockAuthRepository.deleteTokenCachedData()).thenReturn(true);

        // Act
        await authNotifier.logout();

        // Assert
        expect(authNotifier.state.isLogin, false);
        expect(authNotifier.state.user, isNull);
      });
    });
  });
}
