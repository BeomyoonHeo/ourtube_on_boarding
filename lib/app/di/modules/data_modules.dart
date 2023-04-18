import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/datasource/channel_data_source.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/datasource/channel_data_source_impl.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/datasource/user_data_source.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/datasource/user_data_source_impl.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/channel_api.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/user/user_api.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/channel_repository.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/channel_repository_impl.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/user_repository.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/user_repository_impl.dart';

abstract class DataModules {
  DataModules._();

  static void getDependencies() {
    /*
    lazyPut을 통하여 해당 view가 호출 되었을 때 Get이 해당 화면의 State에 필요한 api, datasource, repository를 메모리에 띄워준다.
     */

    //User Api
    Get.lazyPut(() => UserApi());
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));
    Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(Get.find()));

    //Channel Api
    Get.lazyPut(() => ChannelApi(Dio()), fenix: true);
    Get.lazyPut<ChannelRepository>(() => ChannelRepositoryImpl(Get.find()));
    Get.lazyPut<ChannelDataSource>(() => ChannelDataSourceImpl(Get.find()));
  }
}
