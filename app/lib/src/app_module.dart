import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/home/home_module.dart';

class AppModule extends Module{
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ModuleRoute('/home', module: HomeModule()),
    ChildRoute('/config', child: (context, args) => const ConfigurationPage())
  ];
}