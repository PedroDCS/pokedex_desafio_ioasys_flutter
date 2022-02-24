import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../commons/adapters/http_client/dio/dio_adapter.dart';
import '../commons/adapters/http_client/dio/interceptors/dio_interceptor.dart';
import '../commons/adapters/http_client/http_client_adapter.dart';
import 'modules/pokedex/pokedex_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Bind.factory<IHttpClientAdapter>((i) => DioAdapter(dio: i(), interceptors: [i<CustomInterceptors>()])),
    //Bind.factory<CustomInterceptors>((i) => CustomInterceptors()),
    //Bind.factory((i) => Dio(i())),
    //Bind.factory<BaseOptions>((i) => BaseOptions(baseUrl: 'https://api.hgbrasil.com')),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/pokedex', module: PokedexModule()),
      ];
}
