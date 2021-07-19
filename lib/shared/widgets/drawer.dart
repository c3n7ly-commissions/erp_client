import 'package:flutter/material.dart';
import 'package:erp_client/shared/utils/authed_route_params.dart';

class NavigationDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    @override
    final args =
        ModalRoute.of(context)!.settings.arguments as AuthedRouteParams;
    print("Drawer: " + args.token);
    return Drawer(
      child: new ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueGrey[400],
              child: Text(
                'J',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.business),
            title: Text('Company'),
            children: <Widget>[
              ListTile(
                title: Text('Create Company'),
                onTap: () {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   '/create-company',
                  //   arguments: args,
                  // );
                },
              ),
              ListTile(
                title: Text('Manage Company'),
                onTap: () {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   '/company-listing',
                  //   arguments: args,
                  // );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.money),
            title: Text('Lenders'),
            children: <Widget>[
              ListTile(
                title: Text('Create Lender'),
                onTap: () {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   '/create-lender',
                  //   arguments: args,
                  // );
                },
              ),
              ListTile(
                title: Text('Manage Lenders'),
                onTap: () {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   '/lender-listing',
                  //   arguments: args,
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
