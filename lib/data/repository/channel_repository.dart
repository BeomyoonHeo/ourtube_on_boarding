import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

abstract class ChannelRepository {
  Future<List<Channel>> getRandomChannels(String category);
  Future<Map<String, dynamic>> getSearchingChannels(
      String keyword, int? lastKey);
  Future<InvestingChannel> getInvestingChannel(int channelIndex, int amount);
}
