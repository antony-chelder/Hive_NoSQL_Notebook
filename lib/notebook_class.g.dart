// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notebook_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotebookModelAdapter extends TypeAdapter<NotebookModel> {
  @override
  final int typeId = 1;

  @override
  NotebookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotebookModel(
      name: fields[0] as String,
      desc: fields[1] as String,
      completed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NotebookModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotebookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
