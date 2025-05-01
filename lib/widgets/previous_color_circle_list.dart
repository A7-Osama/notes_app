// This is a copy othe previous version of color_circle_list.dart

/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0xffFFFFFF),
          child: CircleAvatar(radius: 48, backgroundColor: color),
        )
        : CircleAvatar(radius: 35, backgroundColor: color);
  }
}

class ColorCircleList extends StatefulWidget {
  const ColorCircleList({super.key});

  @override
  State<ColorCircleList> createState() => _ColorCircleListState();
}

class _ColorCircleListState extends State<ColorCircleList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    kColorsList[index];
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
 */
