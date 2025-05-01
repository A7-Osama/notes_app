import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/color_circle.dart';

class ColorCircleList extends StatefulWidget {
  const ColorCircleList({super.key});

  @override
  State<ColorCircleList> createState() => _ColorCircleListState();
}

class _ColorCircleListState extends State<ColorCircleList> {
  int currentIndex = 0;
  final ValueNotifier<int> currentIndexs = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
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
    BlocProvider.of<AddNoteCubit>(context).color = kColorsList[index];
  }
}
