import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/pages/favorites/controller/favorites_controller.dart';
import 'presentation/pages/favorites/favorites_page.dart';
import 'presentation/pages/pokemon_details/pokemon_details_page.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/home/controllers/home_controller.dart';

//extends ModularState<HomePageSplash, HomeController>
class PokedexModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController()),
        Bind.factory((i) => FavoritesController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/favorites',
          transition: TransitionType.fadeIn,
          child: (context, args) => const FavoritesPage(),
        ),
        ChildRoute(
          '/pokemon',
          transition: TransitionType.fadeIn,
          child: (context, args) => PokemonDetailsPage(
            pokemon: args.data[0],
            router: args.data[1],
          ),
        ),
      ];
}
