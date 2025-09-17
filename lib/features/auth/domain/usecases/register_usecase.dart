
import 'package:hhproject/features/auth/domain/entities/user_entity.dart';
import 'package:hhproject/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
    final AuthRepository authRepository;
  RegisterUsecase(this.authRepository);
  Future<UserEntity> call(String name, String password) async {
    return authRepository.register(name, password);
  }
}