import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

class UserResponse {
  final String name;
  final int amount;
  final List<InvestingChannel> channels;

  const UserResponse(
      {required this.name, required this.amount, required this.channels});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final List<InvestingChannel> channels = [];
    if (json['channels'] != null) {
      for (var channel in json['channels']) {
        channels.add(InvestingChannel.fromJson(channel));
      }
    }
    return UserResponse(
        name: json['name'] ?? '',
        amount: json['amount'] ?? 0,
        channels: channels);
  }
}
