import 'package:flutter_modular/flutter_modular.dart';
import 'package:tasks/features/auth/ui/pages/login_page.dart';
import 'package:tasks/features/home/ui/pages/home_page.dart';

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