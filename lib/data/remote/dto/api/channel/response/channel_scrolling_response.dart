import 'package:json_annotation/json_annotation.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_item_response.dart';

part 'channel_scrolling_response.g.dart';

@JsonSerializable(createToJson: false)
class ChannelScrollingResponse {
  @JsonKey(name: 'data')
  Map<String, dynamic> result;

  @JsonKey(name: 'channelList')
  final List<ChannelItemResponse> channelList;

  @JsonKey(name: 'lastKey')
  final int? lastKey;

  ChannelScrollingResponse(
      {required this.result, required this.channelList, required this.lastKey});

  factory ChannelScrollingResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelScrollingResponseFromJson(json);
}
