import 'package:erp_client/shared/utils/route_params.dart';

class AuthedRouteParams extends RouteParams {
  final String token;

  AuthedRouteParams(this.token, Map<String, dynamic> config) : super(config);
}
