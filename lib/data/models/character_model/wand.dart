
import 'package:hive/hive.dart';

part 'wand.g.dart';

@HiveType(typeId: 1)
class Wand  {
  @HiveField(0)
  final String? wood;
  @HiveField(1)
  final String? core;
  @HiveField(2)
  final num? length;

  const Wand({this.wood, this.core, this.length});

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json['wood'] as String?,
        core: json['core'] as String?,
        length: json['length'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'wood': wood,
        'core': core,
        'length': length,
      };

}