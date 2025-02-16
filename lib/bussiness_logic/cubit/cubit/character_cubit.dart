import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_api/data/api/api_service.dart';
import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:breaking_bad_api/presentation/utils/constants/app_constatns.dart';
import 'package:hive/hive.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  Future<void> getCharactersList() async {
    var box = Hive.box<CharacterModel>(AppConstatns.characterBox);

    emit(CharacterLoadingState());
    if (box.isEmpty) {
      var response = await ApiService.get(endPoint: 'characters');

      response.fold((fail) {
        emit(CharacterErrorState(errMessage: fail.errMessage));
      }, (jsonData) {
        List<CharacterModel> characterListItem = [];

        for (var item in jsonData) {
          characterListItem.add(CharacterModel.fromJson(item));
        }
        box.addAll(characterListItem);

        emit(CharacterSuccessState(charactersList: characterListItem));
      });
    } else {
      emit(CharacterSuccessState(charactersList: box.values.toList()));
    }
  }
}
