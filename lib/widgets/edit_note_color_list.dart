import 'package:flutter/widgets.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_circle.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  final ScrollController controller = ScrollController();
  late ValueNotifier<int> currentIndexs;
  late bool isEnd;

  @override
  void initState() {
    super.initState();
    int initialIndex = kColorsList.indexOf(Color(widget.note.color));
    currentIndexs = ValueNotifier<int>(initialIndex);
    if (currentIndexs.value > 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.animateTo(
          80.0 * initialIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: controller,
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _buildColorItem(index),
      ),
    );
  }

  Widget _buildColorItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GestureDetector(
        onTap: () => _handleColorSelection(index),
        child: ValueListenableBuilder<int>(
          valueListenable: currentIndexs,
          builder: (context, selectedIndex, child) {
            return ColorCircle(
              isActive: selectedIndex == index,
              color: kColorsList[index],
            );
          },
        ),
      ),
    );
  }

  void _handleColorSelection(int index) {
    currentIndexs.value = index;
    widget.note.color = kColorsList[index].toARGB32();
  }

  @override
  void dispose() {
    currentIndexs.dispose();
    controller.dispose();
    super.dispose();
  }
}
