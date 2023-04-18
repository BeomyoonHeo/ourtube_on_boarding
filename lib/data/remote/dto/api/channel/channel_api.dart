import 'package:dio/dio.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_item_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_scrolling_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/investing_channel_item_response.dart';
import 'package:retrofit/retrofit.dart';

part 'channel_api.g.dart';

@RestApi(baseUrl: 'https://pub.yourstock.co.kr/storage/v1/')
abstract class ChannelApi {
  factory ChannelApi(Dio dio, {String? baseUrl}) =>
      _ChannelApi(dio, baseUrl: baseUrl);

  @POST('channels/get/random')
  Future<List<ChannelItemResponse>> getRandomChannel(
      @Body() Map<String, dynamic> category);

  @GET('channels/search')
  Future<ChannelScrollingResponse> getSearchingChannel(
      @Query('title') String keyword, @Query('lastKey') int? lastKey);

  @GET('expected-revenue')
  Future<InvestingChannelItemResponseFromData> getExpectedRevenue(
      @Query('channelIndex') int channelIndex,
      @Query('investment') int investment);
}
