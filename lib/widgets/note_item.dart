import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 24, top: 24),
      decoration: BoxDecoration(
        color: Color(0xffFFCCB0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Flutter Tip',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Build your career up with A7mad Me3yad',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withAlpha(128),
                ),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 26,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              DateFormat("MMMM d, y").format(DateTime.now()),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withAlpha(102),
              ),
              // textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
