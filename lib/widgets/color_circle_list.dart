import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  List<Color> colors = const [
    Color(0xffE9D2F4),
    Color(0xffF2C14E),
    Color(0xffB95F89),
    Color(0xff63B0CD),
    Color(0xff587D71),
    Color(0xffFFCCB0),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorCircle(
                isActive: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
