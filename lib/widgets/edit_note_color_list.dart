import 'package:flutter/widgets.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_circle_list.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  final ScrollController controller = ScrollController();
  late int currentIndex;
  late bool isEnd;

  @override
  void initState() {
    super.initState();
    currentIndex = kColorsList.indexOf(Color(widget.note.color));
    if (currentIndex > 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.animateTo(
          80.0 * currentIndex,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * 2,
      child: ListView.builder(
        controller: controller,
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColorsList[index].toARGB32();
                setState(() {});
              },
              child: ColorCircle(
                isActive: currentIndex == index,
                color: kColorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
