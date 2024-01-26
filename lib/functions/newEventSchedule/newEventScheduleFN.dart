import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';

class newEventInSchedule with ChangeNotifier {
  final _credentials = ServiceAccountCredentials.fromJson({
    "private_key_id": '',
    "private_key": '',
    "client_email": '',
    "client_id": '',
    "type": "service_account"
  });
}
