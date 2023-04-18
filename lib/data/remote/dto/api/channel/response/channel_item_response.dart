import 'package:json_annotation/json_annotation.dart';

part 'channel_item_response.g.dart';

@JsonSerializable(createToJson: false)
class ChannelItemResponse {
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
  const ChannelItemResponse({
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

  factory ChannelItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelItemResponseFromJson(json);
}
