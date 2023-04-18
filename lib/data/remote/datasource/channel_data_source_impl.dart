import 'package:ourtube_onboarding_by_milo/data/remote/datasource/channel_data_source.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/channel_api.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_item_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_scrolling_response.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/investing_channel_item_response.dart';

class ChannelDataSourceImpl implements ChannelDataSource {
  const ChannelDataSourceImpl(this._channelApi);

  final ChannelApi _channelApi;

  @override
  Future<List<ChannelItemResponse>> loadRandomChannelList(
      Map<String, dynamic> category) async {
    return await _channelApi.getRandomChannel(category);
  }

  @override
  Future<ChannelScrollingResponse> loadSearchingChannelList(
      String keyword, int? lastKey) async {
    return await _channelApi.getSearchingChannel(keyword, lastKey);
  }

  @override
  Future<InvestingChannelItemResponse> loadExpectedRevenue(
      int channelIndex, int investment) async {
    final response =
        await _channelApi.getExpectedRevenue(channelIndex, investment);
    return response.data;
  }
}
