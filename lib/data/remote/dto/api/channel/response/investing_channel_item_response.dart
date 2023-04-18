import 'package:json_annotation/json_annotation.dart';

part 'investing_channel_item_response.g.dart';

@JsonSerializable(createToJson: false)
class InvestingChannelItemResponseFromData {
  @JsonKey(name: 'data')
  final InvestingChannelItemResponse data;
  const InvestingChannelItemResponseFromData({required this.data});

  factory InvestingChannelItemResponseFromData.fromJson(
          Map<String, dynamic> json) =>
      _$InvestingChannelItemResponseFromDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class InvestingChannelItemResponse {
  @JsonKey(name: 'channelIndex')
  final int channelIndex;
  @JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;
  @JsonKey(name: 'channelTitle')
  final String channelTitle;
  @JsonKey(name: 'totalViewCountYearAgo')
  final String totalViewCountYearAgo;
  @JsonKey(name: 'totalViewCount')
  final String totalViewCount;
  @JsonKey(name: 'subscriberCountYearAgo')
  final int subscriberCountYearAgo;
  @JsonKey(name: 'subscriberCount')
  final int subscriberCount;
  @JsonKey(name: 'differenceSubscriberCount')
  final double? differenceSubscriberCount;
  @JsonKey(name: 'differenceTotalViewCount')
  final double? differenceTotalViewCount;
  @JsonKey(name: 'adRevenueOfChannel')
  final double adRevenueOfChannel;
  @JsonKey(name: 'rateAdRevenueOfChannel')
  final double rateAdRevenueOfChannel;
  @JsonKey(name: 'investment')
  final String investment;
  @JsonKey(name: 'worthOfChannel')
  final double worthOfChannel;
  @JsonKey(name: 'worthOfChannelBefore')
  final String worthOfChannelBefore;
  @JsonKey(name: 'differenceWorthOfChannel')
  final double differenceWorthOfChannel;
  @JsonKey(name: 'rateDifferenceWorthOfChannel')
  final double rateDifferenceWorthOfChannel;
  final double totalRevenue;
  final double rateTotalRevenue;
  const InvestingChannelItemResponse({
    required this.totalRevenue,
    required this.rateTotalRevenue,
    required this.adRevenueOfChannel,
    required this.rateAdRevenueOfChannel,
    required this.investment,
    required this.worthOfChannel,
    required this.worthOfChannelBefore,
    required this.differenceWorthOfChannel,
    required this.rateDifferenceWorthOfChannel,
    required this.channelIndex,
    required this.thumbnailUrl,
    required this.channelTitle,
    required this.totalViewCountYearAgo,
    required this.totalViewCount,
    required this.subscriberCountYearAgo,
    required this.subscriberCount,
    required this.differenceSubscriberCount,
    required this.differenceTotalViewCount,
  });

  factory InvestingChannelItemResponse.fromJson(Map<String, dynamic> json) =>
      _$InvestingChannelItemResponseFromJson(json);
}
