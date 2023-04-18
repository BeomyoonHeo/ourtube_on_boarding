import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/di/app_bindings.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_pages.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_routes.dart';
import 'package:ourtube_onboarding_by_milo/firebase_options.dart';

void main() async {
  /*위젯을 정적 바인딩 해준다. -> 플랫폼채널과의 위젯 안정성을 보장하기 위해
  why? Firebase.initializeApp 메서드는 firebase를 초기화 할 때 네이티브 코드를 호출하는데
  이때 네이티브 코드를 호출하는 메서드가(플랫폼 채널과 통신을 진행하는 async) 비동기로 작동한다.
   -> 그 때 플러터는 이 네이티브 코드를 비동기로 작동하는 동안 위젯의 안정성을 보장하기 위해서
   위젯들을 정적으로 바인딩을 진행한다.
   */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
    );
  }
}
