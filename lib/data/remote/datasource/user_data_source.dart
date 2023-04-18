import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/user/response/user_response.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

/*
fireStore의 유저 Entity를 가져오기 위한 추상클래스 선언
Api를 통해 CRUD 메서드를 구축할 수 있다.
 */
abstract class UserDataSource {
  Stream<UserResponse> loadUser(String number);
  Future<UserResponse> loadUserAmount();
  Future<void> updateUserAmount(int amount);
  Future<void> updateUserInvestingChannel(Map<String, dynamic> json);
  Future<List<InvestingChannel>> loadUserInvestingChannelList();
  Future<void> userInitialize();
}
