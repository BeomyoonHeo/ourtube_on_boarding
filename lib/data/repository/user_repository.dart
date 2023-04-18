import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/user_model.dart';

/*
추상클래스로 Base Class를 생성하여 해당 클래스로 접근을 막고 구현체를 통해 해당 클래스의 필드와 메서드를 강제한다.
기존클래스를 수정, 변경하는 것 보다, 확장하는 개념으로 추상클래스를 사용한다.
 */
abstract class UserRepository {
  Stream<UserModel> getUser(String number);
  Future<int> getUserAmount();
  Future<void> investmentChannel(int amount, InvestingChannel investingChannel);
  Future<List<InvestingChannel>> getUserInvestingChannelList();
  Future<void> userInitialize();
}
