import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

@immutable
abstract class BaseView<T extends BaseViewModel> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  T get vm => controller;
}
