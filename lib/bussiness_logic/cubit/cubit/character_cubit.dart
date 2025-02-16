import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_api/data/api/api_service.dart';
import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:equatable/equatable.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  Future<void> getCharactersList() async {
    emit(CharacterLoadingState());

    var response = await ApiService.get(endPoint: 'characters');

    response.fold((fail) {
      emit(CharacterErrorState(errMessage: fail.errMessage));
    }, (jsonData) {
      try {
        List<CharacterModel> characterListItem =
            jsonData.map((item) => CharacterModel.fromJson(item)).toList();
        emit(CharacterSuccessState(charactersList: characterListItem));
      } catch (e, stacktrace) {
        log("Parsing Error: $e");
        log("Stacktrace: $stacktrace");
        emit(CharacterErrorState(errMessage: "Data parsing error: $e"));
      }
        });
  }
}