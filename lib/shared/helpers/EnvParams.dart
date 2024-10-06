import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvParams {
  EnvParams._();

  static String get _platform => Platform.isAndroid ? 'ANDROID' : 'IOS';

  static String get appId => dotenv.get('APP_ID_$_platform');

  static String get appsflyerKey => dotenv.get('APPSFLYER_KEY');

  static String get baseUrl => dotenv.get('BASE_URL');

  static String get referer => dotenv.get('REFERER');

  static String get secret_key => dotenv.get('SECRET_KEY');
}
