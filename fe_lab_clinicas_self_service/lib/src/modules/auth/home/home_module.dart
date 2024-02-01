
import 'package:fe_lab_clinicas_self_service/src/modules/auth/home/home_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule{
  @override
  String get moduleRouteName => '/home';

  @override
  // TODO: implement pages
  Map<String, WidgetBuilder> get pages => {
    '/': (context) => const HomePage()
  };
  
}