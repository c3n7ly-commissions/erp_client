import 'package:flutter/material.dart';
import 'package:erp_client/shared/utils/authed_route_params.dart';
import 'package:erp_client/shared/widgets/drawer.dart';
import 'package:erp_client/shared/widgets/appbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as AuthedRouteParams;
    print("Token: " + args.token);

    return Scaffold(
      appBar: AppBarBuilder.generate(),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Yay'),
      ),
    );
  }
}
