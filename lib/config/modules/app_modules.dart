import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/pages/auth/login_page.dart';
import 'package:tasks/pages/home/home_page.dart';

class AppModules extends Module {

  /*
  @override
  void binds(i) {}
  */

 @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
    r.child('/login', child: (context) => LoginPage());

  }
}