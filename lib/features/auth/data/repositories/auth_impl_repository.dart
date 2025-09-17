
import 'package:hhproject/features/auth/data/datasources/auth_datasources.dart';
import 'package:hhproject/features/auth/data/models/User_model.dart';
import 'package:hhproject/features/auth/domain/entities/user_entity.dart';
import 'package:hhproject/features/auth/domain/repositories/auth_repository.dart';
class AuthImplRepository implements AuthRepository {
  final AuthDatasources authDatasources;
  AuthImplRepository(this.authDatasources);

  @override
  Future<UserEntity> login(String email, String password) async {
  final model = await authDatasources.loginrequest(email, password);
  return model.toEntity();
}

  @override
  Future<UserEntity> register(String email, String password)async{
    final model = await authDatasources.registerrequest(email, password);
    return model.toEntity();
  }

  @override
  Future<void> logout() async {
    await authDatasources.logoutrequest();
  }
}