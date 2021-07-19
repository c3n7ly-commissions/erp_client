import 'package:flutter/material.dart';
import 'package:erp_client/shared/utils/authed_route_params.dart';
import 'package:erp_client/shared/widgets/drawer.dart';

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
      appBar: AppBar(
        title: Text('Qubes'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: Tooltip(
              message: 'Log out',
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.power_settings_new_rounded),
              ),
            ),
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Text('Yay'),
      ),
    );
  }
}
