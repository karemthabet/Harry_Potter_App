
import 'package:hive/hive.dart';
import 'wand.dart';

part 'character_model.g.dart';

@HiveType(typeId: 0)
class CharacterModel {
  @HiveField(0)
  final String? id;
  
  @HiveField(1)
  final String? name;
  
  @HiveField(2)
  final List<String>? alternateNames;
  
  @HiveField(3)
  final String? species;
  
  @HiveField(4)
  final String? gender;
  
  @HiveField(5)
  final String? house;
  
  @HiveField(6)
  final String? dateOfBirth;
  
  @HiveField(7)
  final int? yearOfBirth;
  
  @HiveField(8)
  final bool? wizard;
  
  @HiveField(9)
  final String? ancestry;
  
  @HiveField(10)
  final String? eyeColour;
  
  @HiveField(11)
  final String? hairColour;
  
  @HiveField(12)
  final Wand? wand;
  
  @HiveField(13)
  final String? patronus;
  
  @HiveField(14)
  final bool? hogwartsStudent;
  
  @HiveField(15)
  final bool? hogwartsStaff;
  
  @HiveField(16)
  final String? actor;
  
  @HiveField(17)
  final List<String>? alternateActors;
  
  @HiveField(18)
  final bool? alive;
  
  @HiveField(19)
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

  
      


  
  factory CharacterModel.fromJson(dynamic json) {
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