import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:erp_client/shared/utils/authed_route_params.dart';
import 'package:erp_client/shared/utils/route_params.dart';
import 'package:erp_client/shared/widgets/show_snackbar.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late Future<Map<String, dynamic>> _futureConfig;
  Future<Map<String, dynamic>> loadConfig() async {
    final configStr = await rootBundle.loadString('assets/configs/server.json');
    final Map<String, dynamic> config = jsonDecode(configStr);
    return config;
  }

  Future signIn(
      Map<String, dynamic> config, String email, String password) async {
    final response = await http.post(
      Uri.parse(config['server_address'] + config['login_route']),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': email, // only needed by laravel
        'email': email,
        'password': password,
      }),
    );

    setState(() {
      _isSubmitting = false;
    });

    if (response.statusCode == 200) {
      // Successful request
      final Map<String, dynamic> responseMap = jsonDecode(response.body);
      final String token = config['backend'] == "laravel"
          ? responseMap['token']
          : responseMap['key'];
      print("${response.statusCode} : ${response.body}");

      Navigator.pushNamed(
        context,
        '/splash',
        arguments: AuthedRouteParams(token, config),
      );
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      // 400 for drf, 401 for laravel
      ShowSnackbar.danger(context, "Invalid credentials");
    } else {
      print("${response.statusCode} : ${response.body}");
    }
  }

  @override
  void initState() {
    super.initState();
    _futureConfig = loadConfig();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _futureConfig,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Form(
            key: _formKey,
            child: Container(
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'E-mail',
                        labelText: 'E-mail*',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your e-mail";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        labelText: 'Password*',
                      ),
                      obscureText: true,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Fields marked with * sign are required',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_isSubmitting) {
                            return;
                          }

                          if (_formKey.currentState!.validate()) {
                            // Yay, valid
                            setState(() {
                              _isSubmitting = true;
                            });

                            signIn(
                              snapshot.data!,
                              _emailController.text,
                              _passwordController.text,
                            );

                            ShowSnackbar.primary(context, "Signing in");
                          }
                        },
                        child: _isSubmitting
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text('Sign In'),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Center(
                      child: TextButton(
                        child: Text('Forgot password'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(20.0),
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          // TODO: add forgot pass route
                          return;
                          // Navigator.pushNamed(
                          //   context,
                          //   '/forgot-password',
                          //   arguments: RouteParams(snapshot.data!),
                          // );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
