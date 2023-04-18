import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/datasource/user_data_source.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/user/response/user_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/user/user_api.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

/*
UserDataSource의 구현체로 Api를 의존한다.
userCollectionData를 통해 fireStore의 해당 유저 컬렉션 정보를 CRUD한다.
 */
class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl(this.userApi);

  final UserApi userApi;
  DocumentReference<Map<String, dynamic>>? userCollectionData;

  @override
  Stream<UserResponse> loadUser(String number) {
    //userCollectionData 초기화 진행
    userCollectionData = userApi.fireStore.collection('user').doc(number);

    final Stream<DocumentSnapshot<Map<String, dynamic>>> response =
        userCollectionData!.snapshots();

    final userResponse =
        response.map((snapshots) => UserResponse.fromJson(snapshots.data()!));
    return userResponse;
  }

  @override
  Future<void> updateUserAmount(int amount) async {
    await userCollectionData!.update({'amount': amount});
  }

  @override
  Future<UserResponse> loadUserAmount() async {
    DocumentSnapshot<Map<String, dynamic>> userData =
        await userCollectionData!.get();
    return UserResponse.fromJson(userData.data()!);
  }

  @override
  Future<void> updateUserInvestingChannel(Map<String, dynamic> json) async {
    List<InvestingChannel> userChannelList =
        await loadUserInvestingChannelList();
    await userCollectionData!.update({
      'channels': [json, ...userChannelList.map((e) => e.toJson())]
    });
  }

  @override
  Future<List<InvestingChannel>> loadUserInvestingChannelList() async {
    final DocumentSnapshot<Map<String, dynamic>> response =
        await userCollectionData!.get();
    final List<InvestingChannel> investingChannelList =
        UserResponse.fromJson(response.data()!).channels ?? [];
    return investingChannelList;
  }

  @override
  Future<void> userInitialize() async {
    Map<String, dynamic> userData = {
      'name': '마일로',
      'channels': [],
      'amount': 10000000
    };
    await userCollectionData!.set(userData);
  }
}
