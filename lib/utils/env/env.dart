import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'FLUTTER_API_KEY_FOR_ANDROID')
  static const flutterApiKeyForAndroid = _Env.flutterApiKeyForAndroid;
  @EnviedField(varName: 'FLUTTER_API_KEY_FOR_IOS')
  static const flutterApiKeyForIos = _Env.flutterApiKeyForIos;
}
