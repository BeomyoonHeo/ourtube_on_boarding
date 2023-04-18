import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_item_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_scrolling_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/investing_channel_item_response.dart';

abstract class ChannelDataSource {
  Future<List<ChannelItemResponse>> loadRandomChannelList(
      Map<String, dynamic> category);

  Future<ChannelScrollingResponse> loadSearchingChannelList(
      String keyword, int? lastKey);

  Future<InvestingChannelItemResponse> loadExpectedRevenue(
      int channelIndex, int investment);
}
