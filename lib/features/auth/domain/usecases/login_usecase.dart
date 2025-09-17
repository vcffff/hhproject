
import 'package:hhproject/features/auth/domain/entities/user_entity.dart';
import 'package:hhproject/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase(this.authRepository);
  Future<UserEntity> call(String name, String password) async {
    return  authRepository.login(name, password);
  }
}
