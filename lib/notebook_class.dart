import 'package:hive/hive.dart';

part 'notebook_class.g.dart';

@HiveType(typeId: 1)
class NotebookModel{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String desc;
  @HiveField(2)
  final bool completed;

  NotebookModel({this.name,this.desc,this.completed});
}