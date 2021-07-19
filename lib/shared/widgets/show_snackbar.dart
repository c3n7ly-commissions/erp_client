import 'package:flutter/material.dart';
import 'package:erp_client/shared/utils/http_status_strings.dart';

class ShowSnackbar {
  static void primary(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue[500],
      ),
    );
  }

  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Text(
              "Success: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(message),
          ],
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void warning(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Text(
              "Warning: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(message),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }

  static void danger(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Text(
              "Error: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(message),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void dangerResponse(BuildContext context, int statusCode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Error: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${statusCode} ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(HttpStatusString.getStatusString(statusCode)),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
