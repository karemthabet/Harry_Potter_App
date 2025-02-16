import 'package:equatable/equatable.dart';

class Wand extends Equatable {
  final String? wood;
  final String? core;
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

  @override
  List<Object?> get props => [wood, core, length];
}