import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:breaking_bad_api/data/models/character_model/wand.dart';
import 'package:breaking_bad_api/helper/app_router.dart';
import 'package:breaking_bad_api/presentation/utils/constants/app_constatns.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
await Hive.initFlutter();
Hive.registerAdapter(CharacterModelAdapter());
Hive.registerAdapter(WandAdapter());
await Hive.openBox<CharacterModel>(AppConstatns.characterBox);
 //await Hive.box<CharacterModel>(AppConstatns.characterBox).clear();
  runApp(const HarryPotterApp());
}

class HarryPotterApp extends StatelessWidget {
  const HarryPotterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
