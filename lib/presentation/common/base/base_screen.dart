import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

/*GetView를 통해 find메서드가 필요한 view를 Stateless를 상속 받는 대신에 GetView를 상속받아서
제네릭을 통해 GetxController를 상속받은 State를 가지고 있는 ViewModel을 호출하여 상태관리를 할 수 있다.
 */
abstract class BaseScreen<T extends BaseViewModel> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  //접근제어자를 어노테이션으로 정의 상속받은 클래스만 해당 필드 호출 가능
  @protected
  T get vm => controller;
}
