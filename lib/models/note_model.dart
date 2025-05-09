import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;
  @HiveField(4)
  bool isArTitle;
  @HiveField(5)
  bool isArContent;

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
    required this.isArTitle,
    required this.isArContent,
  });
}
