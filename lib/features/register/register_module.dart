import 'package:find_pet/features/register/data/datasources/register_datasource.dart';
import 'package:find_pet/features/register/data/repositories/register_repository_impl.dart';
import 'package:find_pet/features/register/domain/usecases/register_usecase.dart';
import 'package:find_pet/features/register/presentation/bloc/register_bloc.dart';
import 'package:find_pet/features/register/presentation/pages/email_confirmation_page.dart';
import 'package:find_pet/features/register/presentation/pages/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => RegisterDatasourceImpl(client: i())),
        Bind.singleton((i) => RegisterRepositoryImpl(remoteDatasource: i())),
        Bind.singleton((i) => RegisterUseCase(repository: i())),
        Bind.factory((i) => RegisterBloc(usecase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const RegisterPage(),
        ),
        ChildRoute<dynamic>(
          '/email-confirmation/',
          child: (context, args) => const EmailConfirmationPage(),
        )
      ];
}
