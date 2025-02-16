import 'package:breaking_bad_api/data/models/character_model/character_model.dart';
import 'package:breaking_bad_api/presentation/utils/colors/app_colors.dart';
import 'package:breaking_bad_api/presentation/utils/constants/app_constatns.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final CharacterModel characterModel;
  const CardItem({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppConstatns.characterDetailScreen, arguments: characterModel),
      child: Hero(
        tag: characterModel.id!,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.myWhite,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: GridTile(
              // ignore: sort_child_properties_last
              child: characterModel.image?.isNotEmpty == true
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: "assets/images/Animation loading.gif",
                      image: characterModel.image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/Animation - 1739657573224.gif",
                      fit: BoxFit.cover,
                    ),
              footer: Container(
                padding: EdgeInsets.all(12.0),
                color: Colors.black,
                child: Text(
                  characterModel.name ?? "No Name",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
