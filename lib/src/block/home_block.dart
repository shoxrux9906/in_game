import 'package:in_game/src/inGameRepository/in_game_repository.dart';
import 'package:in_game/src/models/api/club_model.dart';
import 'package:in_game/src/models/api/game_end_model.dart';
import 'package:in_game/src/models/api/profile_model.dart';
import 'package:in_game/src/utils/cache.dart';
import 'package:rxdart/rxdart.dart';

final homeBlock = HomeBlock();

class HomeBlock {
  static final _fetchMe = PublishSubject<ProfileModel>();
  static final _fetchClub = PublishSubject<FootBalClubModel>();
  static final _fetchGameEnd = PublishSubject<GameEndModel>();

  ProfileModel? result1;
  FootBalClubModel? result2;
  GameEndModel? result3;

  Stream<ProfileModel> get getProfile => _fetchMe.stream;

  Stream<FootBalClubModel> get getClub => _fetchClub.stream;

  Stream<GameEndModel> get getGameEnd => _fetchGameEnd.stream;

  getMe() async {
    var response = await InGameRepository.getUserApi();
    if (response.success) {
      result1 = ProfileModel.fromJson(response.result);
      // Cache.saveData(result1!);
      _fetchMe.sink.add(result1!);
    }
  }

  getClubInfo() async {
    var response = await InGameRepository.getClubApi();
    if (response.success) {
      result2 = FootBalClubModel.fromJson(response.result);
      _fetchClub.sink.add(result2!);
    }
  }

  getGameEndInfo() async {
    var response = await InGameRepository.getGameEndApi();
    if(response.success){
      result3 = GameEndModel.fromJson(response.result);
      _fetchGameEnd.sink.add(result3!);
    }
  }

  dispose() {
    _fetchMe.close();
    _fetchClub.close();
    _fetchGameEnd.close();
  }
}
