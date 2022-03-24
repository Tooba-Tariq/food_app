import 'package:dartz/dartz.dart';
import 'package:food_app/features/login/domain/entities/user.dart';
import 'package:food_app/features/login/domain/repositories/user_repositories.dart';
import 'package:food_app/features/login/domain/usecases/check_user_credentials.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserLoginRepository extends Mock implements UserRepository {}

void main() {
  late CheckUserCredentials usecase;
  late MockUserLoginRepository mockUserLoginRepository;
  late User tUser;
  setUp(() {
    mockUserLoginRepository = MockUserLoginRepository();
    usecase = CheckUserCredentials(mockUserLoginRepository);
    tUser = User(
      username: 'username',
      password: 'password',
    );
  });

  test('should check user credentials from repository', () async {
    when(
      mockUserLoginRepository.checkUserCredentials(tUser),
    ).thenAnswer((_) async => const Right(true));

    final result = await usecase(Params(tUser));

    expect(result, const Right(true));
    verify(mockUserLoginRepository.checkUserCredentials(tUser));
    verifyNoMoreInteractions(mockUserLoginRepository);
  });
}
