// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wand.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WandAdapter extends TypeAdapter<Wand> {
  @override
  final int typeId = 1;

  @override
  Wand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wand(
      wood: fields[0] as String?,
      core: fields[1] as String?,
      length: fields[2] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Wand obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.wood)
      ..writeByte(1)
      ..write(obj.core)
      ..writeByte(2)
      ..write(obj.length);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
