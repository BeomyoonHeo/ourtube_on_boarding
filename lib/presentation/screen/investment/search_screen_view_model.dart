import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/channel_repository.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

class SearchScreenViewModel extends BaseViewModel {
  SearchScreenViewModel(
      {required this.repository, required this.moveInvestmentProgress});

  final ChannelRepository repository;

  final Function moveInvestmentProgress;

  final RxList<Channel> channels = <Channel>[].obs;

  final PagingController<int, Channel> pagingController =
      PagingController(firstPageKey: 0);

  final textController = TextEditingController();

  final RxString keyword = ''.obs;

  final Rxn<int> selectedIndex = Rxn();

  final RxBool isSelectedBtnItem = false.obs;

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) {
      search(keyword.value, page);
    });
    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    textController.dispose();
    super.dispose();
  }

  void onTapedGridViewItem(int index) {
    if (selectedIndex.value == index && isSelectedBtnItem.isTrue) {
      selectedIndex.value = null;
      isSelectedBtnItem(false);
    } else {
      selectedIndex.value = index;
      isSelectedBtnItem(true);
    }
  }

  void onSubmitted(String keyword) {
    searchingInitialize();
    this.keyword(keyword);
    search(keyword, pagingController.nextPageKey);
  }

  Future<void> search(String keyword, int? lastKey) async {
    repository.getSearchingChannels(keyword, lastKey).then((map) {
      bool isLast = map['lastKey'] == null || map['lastKey'] == 0;

      channels([...channels, ...map['channelList']]);

      if (!isLast) {
        pagingController.appendPage(map['channelList'], map['lastKey']);
      } else {
        pagingController.nextPageKey = map['lastKey'];
        pagingController.appendLastPage(map['channelList']);
      }
    });
  }

  void searchingInitialize() {
    channels.value = [];
    pagingController.itemList = [];
    isSelectedBtnItem(false);
    selectedIndex.value = null;
  }
}
