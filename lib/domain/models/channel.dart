import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_item_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/investing_channel_item_response.dart';

class Channel {
  final int channelIndex;
  final String thumbnailUrl;
  final String channelTitle;
  final String totalViewCountYearAgo;
  final String totalViewCount;
  final int subscriberCountYearAgo;
  final int subscriberCount;
  final double differenceSubscriberCount;
  final double differenceTotalViewCount;

  const Channel({
    required this.channelIndex,
    required this.totalViewCountYearAgo,
    required this.subscriberCountYearAgo,
    required this.thumbnailUrl,
    required this.channelTitle,
    required this.totalViewCount,
    required this.subscriberCount,
    required this.differenceSubscriberCount,
    required this.differenceTotalViewCount,
  });

  factory Channel.fromResponse(ChannelItemResponse channelItemResponse) =>
      Channel(
        channelIndex: channelItemResponse.channelIndex,
        thumbnailUrl: channelItemResponse.thumbnailUrl,
        channelTitle: channelItemResponse.channelTitle,
        totalViewCount: channelItemResponse.totalViewCount,
        subscriberCount: channelItemResponse.subscriberCount,
        totalViewCountYearAgo: channelItemResponse.totalViewCountYearAgo,
        subscriberCountYearAgo: channelItemResponse.subscriberCountYearAgo,
        differenceSubscriberCount:
            channelItemResponse.differenceSubscriberCount ?? 0,
        differenceTotalViewCount:
            channelItemResponse.differenceTotalViewCount ?? 0,
      );
}

// 기존 채널 모델에서 투자중인 유저가 투자를 진행했을 때 해당 객체 생성 및 파이어베이스 컬랙션에 등록
class InvestingChannel extends Channel {
  InvestingChannel({
    required super.channelIndex,
    required super.totalViewCountYearAgo,
    required super.subscriberCountYearAgo,
    required super.thumbnailUrl,
    required super.channelTitle,
    required super.totalViewCount,
    required super.subscriberCount,
    required super.differenceSubscriberCount,
    required super.differenceTotalViewCount,
    required this.rateAdRevenueOfChannel,
    required this.adRevenueOfChannel,
    required this.differenceWorthOfChannel,
    required this.investment,
    required this.rateDifferenceWorthOfChannel,
    required this.worthOfChannel,
    required this.worthOfChannelBefore,
    required this.rateTotalRevenue,
    required this.totalRevenue,
  });

  final double adRevenueOfChannel;
  final double rateAdRevenueOfChannel;
  final String investment;
  final double worthOfChannel;
  final String worthOfChannelBefore;
  final double differenceWorthOfChannel;
  final double rateDifferenceWorthOfChannel;
  final double totalRevenue;
  final double rateTotalRevenue;

  factory InvestingChannel.fromJson(Map<String, dynamic> channel) =>
      InvestingChannel(
        channelIndex: channel['channelIndex'],
        thumbnailUrl: channel['thumbnailUrl'],
        channelTitle: channel['channelTitle'],
        totalViewCount: channel['totalViewCount'],
        subscriberCount: channel['subscriberCount'],
        totalViewCountYearAgo: channel['totalViewCountYearAgo'],
        subscriberCountYearAgo: channel['subscriberCountYearAgo'],
        differenceSubscriberCount: channel['differenceSubscriberCount'],
        differenceTotalViewCount: channel['differenceTotalViewCount'],
        worthOfChannelBefore: channel['worthOfChannelBefore'],
        worthOfChannel: channel['worthOfChannel'],
        rateDifferenceWorthOfChannel: channel['rateDifferenceWorthOfChannel'],
        rateAdRevenueOfChannel: channel['rateAdRevenueOfChannel'],
        investment: channel['investment'],
        differenceWorthOfChannel: channel['differenceWorthOfChannel'],
        adRevenueOfChannel: channel['adRevenueOfChannel'],
        rateTotalRevenue: channel['rateTotalRevenue'],
        totalRevenue: channel['totalRevenue'],
      );

  factory InvestingChannel.fromResponse(
          InvestingChannelItemResponse response) =>
      InvestingChannel(
        channelIndex: response.channelIndex,
        thumbnailUrl: response.thumbnailUrl,
        channelTitle: response.channelTitle,
        totalViewCount: response.totalViewCount,
        subscriberCount: response.subscriberCount,
        totalViewCountYearAgo: response.totalViewCountYearAgo,
        subscriberCountYearAgo: response.subscriberCountYearAgo,
        differenceSubscriberCount: response.differenceSubscriberCount ?? 0,
        differenceTotalViewCount: response.differenceTotalViewCount ?? 0,
        worthOfChannelBefore: response.worthOfChannelBefore,
        worthOfChannel: response.worthOfChannel,
        rateDifferenceWorthOfChannel: response.rateDifferenceWorthOfChannel,
        rateAdRevenueOfChannel: response.rateAdRevenueOfChannel,
        investment: response.investment,
        differenceWorthOfChannel: response.differenceWorthOfChannel,
        adRevenueOfChannel: response.adRevenueOfChannel,
        totalRevenue: response.totalRevenue,
        rateTotalRevenue: response.rateTotalRevenue,
      );

  Map<String, dynamic> toJson() => {
        'channelIndex': channelIndex,
        'thumbnailUrl': thumbnailUrl,
        'channelTitle': channelTitle,
        'totalViewCount': totalViewCount,
        'subscriberCount': subscriberCount,
        'totalViewCountYearAgo': totalViewCountYearAgo,
        'subscriberCountYearAgo': subscriberCountYearAgo,
        'differenceSubscriberCount': differenceSubscriberCount,
        'differenceTotalViewCount': differenceTotalViewCount,
        'worthOfChannelBefore': worthOfChannelBefore,
        'worthOfChannel': worthOfChannel,
        'rateDifferenceWorthOfChannel': rateDifferenceWorthOfChannel,
        'rateAdRevenueOfChannel': rateAdRevenueOfChannel,
        'investment': investment,
        'differenceWorthOfChannel': differenceWorthOfChannel,
        'adRevenueOfChannel': adRevenueOfChannel,
        'totalRevenue': totalRevenue,
        'rateTotalRevenue': rateTotalRevenue,
      };
}

// 투자중인 채널의 광고수익금 + 채널가치를 더한 총 수익
extension InvestmentInfo on InvestingChannel {
  int totalProfit() {
    return (totalRevenue).round();
  }
}
