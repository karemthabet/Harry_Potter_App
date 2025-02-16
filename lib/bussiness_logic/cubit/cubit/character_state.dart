part of 'character_cubit.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterSuccessState extends CharacterState {
  final List<CharacterModel> charactersList;

  const CharacterSuccessState({required this.charactersList});

  @override
  List<Object> get props => [charactersList];
}

class CharacterErrorState extends CharacterState {
  final String errMessage;

  const CharacterErrorState({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}