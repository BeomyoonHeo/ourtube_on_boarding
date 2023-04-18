import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'FLUTTER_API_KEY_FOR_ANDROID')
  static const flutterApiKeyForAndroid = _Env.flutterApiKeyForAndroid;
  @EnviedField(varName: 'FLUTTER_APP_ID_FOR_ANDROID')
  static const flutterAppIdForAndroid = _Env.flutterAppIdForAndroid;
  @EnviedField(varName: 'FLUTTER_API_KEY_FOR_IOS')
  static const flutterApiKeyForIos = _Env.flutterApiKeyForIos;
  @EnviedField(varName: 'FLUTTER_APP_ID_FOR_IOS')
  static const flutterAppIdForIos = _Env.flutterAppIdForIos;
  @EnviedField(varName: 'FLUTTER_IOS_CLIENT_ID')
  static const flutterIosClientId = _Env.flutterIosClientId;
  @EnviedField(varName: 'FLUTTER_MESSAGE_SANDER_ID')
  static const flutterMessageSanderId = _Env.flutterMessageSanderId;
}
