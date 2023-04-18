import 'package:ourtube_onboarding_by_milo/data/remote/datasource/user_data_source.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/user/response/user_response.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/user_repository.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/user_model.dart';

/*
UserRepository의 구현체로 datasource를 의존한다. 의존 코드는 GetX가 알아서 관리해준다.
 */
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.userDataSource);

  final UserDataSource userDataSource;

  @override
  Stream<UserModel> getUser(String number) {
    final userResponse = userDataSource.loadUser(number);
    return UserModel.fromResponseToStream(userResponse);
  }

  @override
  Future<int> getUserAmount() async {
    final UserResponse response = await userDataSource.loadUserAmount();
    return response.amount ?? 0;
  }

  @override
  Future<void> investmentChannel(
      int amount, InvestingChannel investingChannel) async {
    await userDataSource.updateUserAmount(await getUserAmount() - amount);
    await userDataSource.updateUserInvestingChannel(investingChannel.toJson());
  }

  @override
  Future<List<InvestingChannel>> getUserInvestingChannelList() async {
    return await userDataSource.loadUserInvestingChannelList();
  }

  @override
  Future<void> userInitialize() async {
    await userDataSource.userInitialize();
  }
}
