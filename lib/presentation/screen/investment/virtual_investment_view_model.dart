import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/app/routes/app_routes.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/channel_repository.dart';
import 'package:ourtube_onboarding_by_milo/domain/enums/channel_category.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

class VirtualInvestmentViewModel extends BaseViewModel {
  VirtualInvestmentViewModel({required this.repository, required this.amount});

  //Dependency Injection
  final ChannelRepository repository;
  final RxInt amount;

  //랜덤으로 유저에게 추천해주는 리스트
  final RxList<Channel> recommendedRandomChannel = <Channel>[].obs;

  //채널 카테고리 관련 State
  final RxString category = ''.obs;
  final RxString beforeKeyword = ''.obs;
  final RxMap<ChannelCategory, RxBool> categoryList =
      <ChannelCategory, RxBool>{}.obs;

  //그리드뷰 버튼 관련 State
  final Rxn<int> selectedIndex = Rxn();
  final RxBool isSelectedBtnItem = false.obs;

  @override
  void onInit() async {
    categoryList.addAll({
      ChannelCategory.all: true.obs,
      ChannelCategory.game: false.obs,
      ChannelCategory.technology: false.obs,
      ChannelCategory.film: false.obs,
      ChannelCategory.military: false.obs,
      ChannelCategory.politics: false.obs,
      ChannelCategory.society: false.obs,
      ChannelCategory.sports: false.obs,
      ChannelCategory.pet: false.obs,
      ChannelCategory.entertainment: false.obs,
      ChannelCategory.hobby: false.obs,
      ChannelCategory.religion: false.obs,
      ChannelCategory.humour: false.obs,
    });
    await recommendingChannel();
    super.onInit();
  }

  Future<void> recommendingChannel() async {
    recommendedRandomChannel.value =
        await repository.getRandomChannels(category.value);
    isSelectedBtnItem(false);
    selectedIndex.value = null;
  }

  /*
  카테고리 버튼을 클릭 했을때 2가지 분기
  1. 기존 카테고리에서 다른 카테고리를 클릭했을때 -> 기존 카테고리 off, 누른 카테고리 on
  2. 기존 눌러져 있는 카테고리를 한번 더 눌렀을때 -> 토글작용 / 기존카테고리 off, 전체카테고리로 on
   */
  void onPressedCategoryBtn(String selectedCategory) {
    category(selectedCategory);

    _offBtn(categoryList[ChannelCategory.fromString(beforeKeyword.value)]!);

    if (beforeKeyword.value == category.value) {
      beforeKeyword('');
      category('');
      _onBtn(categoryList[ChannelCategory.fromString(beforeKeyword.value)]!);
    } else {
      beforeKeyword.value = category.value;
      _onBtn(categoryList[ChannelCategory.fromString(category.value)]!);
    }
  }

  void _onBtn(RxBool controller) {
    controller(true);
  }

  void _offBtn(RxBool controller) {
    controller(false);
  }

  /*
  그리드 뷰 아이템을 클릭했을 때 2가지 분기
  1. 버튼 클릭 시 해당 버튼 pressed 작용 / 다른 버튼 클릭 시 이전 버튼 pressed 해제 및 누른 버튼 pressed 작용
  2. 해당 버튼이 이미 pressed 상태라면 toggle작용
   */
  void onTapedGridViewItem(int index) {
    if (selectedIndex.value == index && isSelectedBtnItem.isTrue) {
      selectedIndex.value = null;
      isSelectedBtnItem(false);
    } else {
      selectedIndex.value = index;
      isSelectedBtnItem(true);
    }
  }

  void moveSearchScreen() {
    Get.toNamed(AppRoutes.searchScreen, arguments: {
      'moveInvestmentProgress': moveInvestmentProgress,
    });
  }

  void moveInvestmentProgress(
      RxList<Channel>? channels, Rxn<int> selectedIndex) {
    Get.toNamed(AppRoutes.investmentProgressScreen, arguments: {
      'channel': channels![selectedIndex.value as int].obs,
      'amount': amount.value,
      'channelIndex': channels[selectedIndex.value as int].channelIndex,
      'inputAmount': TextEditingController(),
    });
  }
}
