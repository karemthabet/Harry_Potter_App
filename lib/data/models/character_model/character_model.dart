import 'package:equatable/equatable.dart';
import 'wand.dart';

class CharacterModel extends Equatable {
  final String? id;
  final String? name;
  final List<String>? alternateNames;
  final String? species;
  final String? gender;
  final String? house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool? wizard;
  final String? ancestry;
  final String? eyeColour;
  final String? hairColour;
  final Wand? wand;
  final String? patronus;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;
  final List<String>? alternateActors;
  final bool? alive;
  final String? image;

  const CharacterModel({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      alternateNames: (json['alternate_names'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList(),
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      house: json['house'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      yearOfBirth: (json['yearOfBirth'] as num?)?.toInt(),
      wizard: json['wizard'] as bool?,
      ancestry: json['ancestry'] as String?,
      eyeColour: json['eyeColour'] as String?,
      hairColour: json['hairColour'] as String?,
      wand: json['wand'] == null
          ? null
          : Wand.fromJson(json['wand'] as Map<String, dynamic>),
      patronus: json['patronus'] as String?,
      hogwartsStudent: json['hogwartsStudent'] as bool?,
      hogwartsStaff: json['hogwartsStaff'] as bool?,
      actor: json['actor'] as String?,
      alternateActors: (json['alternate_actors'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList(),
      alive: json['alive'] as bool?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'alternate_names': alternateNames,
        'species': species,
        'gender': gender,
        'house': house,
        'dateOfBirth': dateOfBirth,
        'yearOfBirth': yearOfBirth,
        'wizard': wizard,
        'ancestry': ancestry,
        'eyeColour': eyeColour,
        'hairColour': hairColour,
        'wand': wand?.toJson(),
        'patronus': patronus,
        'hogwartsStudent': hogwartsStudent,
        'hogwartsStaff': hogwartsStaff,
        'actor': actor,
        'alternate_actors': alternateActors,
        'alive': alive,
        'image': image,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      alternateNames,
      species,
      gender,
      house,
      dateOfBirth,
      yearOfBirth,
      wizard,
      ancestry,
      eyeColour,
      hairColour,
      wand,
      patronus,
      hogwartsStudent,
      hogwartsStaff,
      actor,
      alternateActors,
      alive,
      image,
    ];
  }
}