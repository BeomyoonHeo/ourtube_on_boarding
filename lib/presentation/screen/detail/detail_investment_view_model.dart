import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourtube_onboarding_by_milo/domain/enums/profits_type.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/sector.dart';
import 'package:ourtube_onboarding_by_milo/presentation/common/base/base_view_model.dart';

class DetailInvestmentViewModel extends BaseViewModel {
  DetailInvestmentViewModel({required this.investingChannels});

  late final TabController tabController;
  final RxList<InvestingChannel> investingChannels;
  final RxInt investingAmount = 0.obs;
  final RxInt allTotalProfit = 0.obs;
  final RxInt totalChannelValue = 0.obs;
  final RxInt totalAdvertisingProfit = 0.obs;
  final RxList<Sector> sectors = <Sector>[].obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    for (var channel in investingChannels) {
      investingAmount(investingAmount.value + int.parse(channel.investment));
      allTotalProfit(allTotalProfit.value + channel.totalRevenue.round());
      totalChannelValue(
          totalChannelValue.value + channel.differenceWorthOfChannel.round());
      totalAdvertisingProfit(
          totalAdvertisingProfit.value + channel.adRevenueOfChannel.round());
    }

    if (totalAdvertisingProfit.value + totalChannelValue.value != 0) {
      double advertisingProfitsRatio = (totalAdvertisingProfit.value /
              (totalAdvertisingProfit.value + totalChannelValue.value)) *
          100;

      double channelValueRatio = (totalChannelValue.value /
              (totalAdvertisingProfit.value + totalChannelValue.value)) *
          100;

      sectors.add(Sector(
          profitType: ProfitType.fromString('advertisingProfits'),
          value: advertisingProfitsRatio));
      sectors.add(Sector(
          profitType: ProfitType.fromString('channelValue'),
          value: channelValueRatio));
    }

    super.onInit();
  }
}
