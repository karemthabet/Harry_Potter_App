import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:breaking_bad_api/presentation/utils/colors/app_colors.dart';
import 'package:breaking_bad_api/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../bussiness_logic/cubit/cubit/character_cubit.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<CharacterModel> searchedList = [];
  List<CharacterModel> allCharacters = [];
  bool isSearched = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getCharactersList();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: AppColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find a character",
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: AppColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedItemsToList(searchedCharacter);
      },
    );
  }

  void addSearchedItemsToList(String searchedCharacter) {
    if (searchedCharacter.isEmpty) {
      searchedList = allCharacters;
    } else {
      searchedList = allCharacters
          .where((character) =>
              character.name
                  ?.toLowerCase()
                  .startsWith(searchedCharacter.toLowerCase()) ??
              false)
          .toList();
    }
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearched) {
      return [
        IconButton(
          onPressed: _stopSearching,
          icon: const Icon(Icons.clear),
          color: AppColors.myGrey,
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(Icons.search),
          color: AppColors.myGrey,
        ),
      ];
    }
  }

  void _startSearching() {
    setState(() {
      isSearched = true;
      searchedList = allCharacters;
    });
  }

  void _stopSearching() {
    setState(() {
      searchTextController.clear();
      isSearched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.myYellow,
          title: isSearched
              ? _buildSearchField()
              : const Text(
                  "Characters",
                  style: TextStyle(color: AppColors.myGrey),
                ),
          actions: _buildAppBarActions(),
        ),
        body: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterSuccessState) {
              allCharacters = state.charactersList;
              final displayedList = isSearched ? searchedList : allCharacters;
              if (displayedList.isEmpty) {
                return Center(
                  child: Text(
                    "No character found with that name",
                    style: TextStyle(
                      color: AppColors.myYellow,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              return Container(
                color: AppColors.myGrey,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  itemCount: displayedList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return CardItem(
                      characterModel: displayedList[index],
                    );
                  },
                ),
              );
            } else if (state is CharacterErrorState) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.bottomSlide,
                      title: 'Error',
                      desc: state.errMessage,
                      btnOkOnPress: () {},
                    ).show();
                  },
                  child: const Text("Show Error"),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.myYellow,
                ),
              );
            }
          },
        ));
  }
}
