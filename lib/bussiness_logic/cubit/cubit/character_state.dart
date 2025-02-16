part of 'character_cubit.dart';

abstract class CharacterState  {
  const CharacterState();
}


class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterSuccessState extends CharacterState {
  final List<CharacterModel> charactersList;

  const CharacterSuccessState({required this.charactersList});

}

class CharacterErrorState extends CharacterState {
  final String errMessage;

  const CharacterErrorState({required this.errMessage});

}