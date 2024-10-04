import 'package:flutter_samples/models/user_model.dart';

int calculateRank(UserModel user, List<UserModel> leaderboard) {
  int rank = 1;
  for (int i = 0; i < leaderboard.length; i++) {
    if (leaderboard[i].points > user.points) {
      rank++;
    }
  }

  return rank;
}
