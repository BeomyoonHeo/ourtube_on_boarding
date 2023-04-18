import 'package:ourtube_onboarding_by_milo/data/remote/datasource/channel_data_source.dart';
import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/channel/response/channel_scrolling_response.dart';
import 'package:ourtube_onboarding_by_milo/data/repository/channel_repository.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  ChannelRepositoryImpl(this._channelDataSource);
  final ChannelDataSource _channelDataSource;

  @override
  Future<List<Channel>> getRandomChannels(String category) async {
    Map<String, dynamic> bodyValue = {
      'category': [category]
    };

    final response = await _channelDataSource.loadRandomChannelList(bodyValue);
    final List<Channel> randomChannelList = response
        .map((channelItemResponse) => Channel.fromResponse(channelItemResponse))
        .toList();
    return randomChannelList;
  }

  @override
  Future<Map<String, dynamic>> getSearchingChannels(
      String keyword, int? lastKey) async {
    final ChannelScrollingResponse scrollingResponse =
        await _channelDataSource.loadSearchingChannelList(keyword, lastKey);
    final List<Channel> channelList =
        scrollingResponse.channelList.map((channelItemResponse) {
      return Channel.fromResponse(channelItemResponse);
    }).toList();
    final int? responseLastKey = scrollingResponse.result['lastKey'];
    final Map<String, dynamic> channelResponseMap = {
      'channelList': channelList,
      'lastKey': responseLastKey
    };
    return channelResponseMap;
  }

  @override
  Future<InvestingChannel> getInvestingChannel(
      int channelIndex, int amount) async {
    return InvestingChannel.fromResponse(
        await _channelDataSource.loadExpectedRevenue(channelIndex, amount));
  }
}
