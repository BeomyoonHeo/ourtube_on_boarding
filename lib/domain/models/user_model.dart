import 'package:ourtube_onboarding_by_milo/data/remote/dto/api/user/response/user_response.dart';
import 'package:ourtube_onboarding_by_milo/domain/models/channel.dart';

class UserModel {
  final String name;
  final int amount;
  final List<InvestingChannel> channels;
  UserModel({required this.name, required this.amount, required this.channels});

  static Stream<UserModel> fromResponseToStream(
          Stream<UserResponse> userResponse) =>
      userResponse.map((streamResponse) => UserModel(
          name: streamResponse.name,
          amount: streamResponse.amount,
          channels: streamResponse.channels));
}

extension AsStream on UserModel {
  Stream<UserModel> asStream() => Stream.value(this);
}
