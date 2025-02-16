import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:breaking_bad_api/presentation/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CharacterDatails extends StatelessWidget {
  final CharacterModel character;
  const CharacterDatails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                        title: "Alternate Names: ",
                        value: (character.alternateNames?.isNotEmpty ??
                                false || character.alternateNames != null)
                            ? character.alternateNames!.join(" - ")
                            : "Unknown",
                      ),
                      buildDevider(endIndent: 300),
                      characterInfo(
                        title: "Gender: ",
                        value: character.gender?.isNotEmpty == true ||
                                character.gender != null
                            ? character.gender!
                            : "Unknown",
                      ),
                      buildDevider(endIndent: 200),
                      characterInfo(
                        title: "Date Of Birth: ",
                        value: character.dateOfBirth?.isNotEmpty == true ||
                                character.dateOfBirth != null
                            ? character.dateOfBirth!
                            : "Unknown",
                      ),
                      buildDevider(endIndent: 300),
                      characterInfo(
                        title: "Alive: ",
                        value: character.alive != null
                            ? (character.alive! ? "Yes" : "No")
                            : "Unknown",
                      ),
                      buildDevider(endIndent: 200),
                      characterInfo(
                        title: "Actor: ",
                        value: character.actor?.isNotEmpty == true ||
                                character.actor != null
                            ? character.actor!
                            : "Unknown",
                      ),
                      buildDevider(endIndent: 300),
                      const SizedBox(height: 500),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      centerTitle: true,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name ?? "Unknown",
          style: TextStyle(color: AppColors.myWhite),
        ),
        background: Hero(
          tag: character.id!,
          child: character.image?.isNotEmpty == true
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/Animation loading.gif",
                  image: character.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  "assets/images/Animation - 1739657573224.gif",
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget characterInfo({required String title, required String value}) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: AppColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDevider({required double endIndent}) {
    return Divider(
      color: AppColors.myYellow,
      thickness: 2,
      height: 30,
      endIndent: endIndent,
    );
  }
}
