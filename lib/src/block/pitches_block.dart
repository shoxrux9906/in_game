import 'package:in_game/src/inGameRepository/in_game_repository.dart';
import 'package:in_game/src/models/api/pitches_model.dart';
import 'package:rxdart/rxdart.dart';

final pitchesBlock = PitchesBlock();

class PitchesBlock {
  static final _fetchPitches = PublishSubject<PitchesModel>();

  PitchesModel? result;

  Stream<PitchesModel> get getPitches => _fetchPitches.stream;

  getPitchesInfo() async {
    var response = await InGameRepository.getPitchesApi();
    if (response.success) {
      result = await PitchesModel.fromJson(response.result);
      _fetchPitches.sink.add(result!);
    }
  }
}
