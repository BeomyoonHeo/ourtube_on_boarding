import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_screen.dart';
import 'package:ourtube_onboarding_by_milo/presentation/screen/splash/splash_view_model.dart';

class SplashScreen extends BaseScreen<SplashViewModel> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: Image.asset('assets/images/splash_logo.png'),
      ),
    );
  }
}
