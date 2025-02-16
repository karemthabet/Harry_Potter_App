import 'package:breaking_bad_api/bussiness_logic/cubit/cubit/character_cubit.dart';
import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:breaking_bad_api/presentation/screens/character_datails.dart';
import 'package:breaking_bad_api/presentation/screens/character_screen.dart';
import 'package:breaking_bad_api/presentation/utils/constants/app_constatns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstatns.characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharacterCubit(),
                  child: const CharacterScreen(),
                ));
      case AppConstatns.characterDetailScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => CharacterDatails(character: character));
      default:
        return null;
    }
  }
}
