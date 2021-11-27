import 'package:in_game/src/inGameRepository/in_game_repository.dart';
import 'package:in_game/src/models/api/profile_model.dart';
import 'package:rxdart/rxdart.dart';

final playersBlock = PalayerBlock();

class PalayerBlock {
  static final _fetchUsers = PublishSubject<ProfileModel>();
  ProfileModel? result;

  Stream<ProfileModel> get getUserProfile => _fetchUsers.stream;

  getUsers() async {
    var response = await InGameRepository.getUserApi();

    if (response.success) {
      result = ProfileModel.fromJson(response.result);
      _fetchUsers.sink.add(result!);
    }
  }

  dispose() {
    _fetchUsers.close();
  }
}
