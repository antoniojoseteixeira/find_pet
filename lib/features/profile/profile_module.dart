import 'package:find_pet/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:find_pet/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.factory((i) => ProfileBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const ProfilePage(),
        )
      ];
}
