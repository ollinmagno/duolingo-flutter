import 'package:flutter/material.dart';

class LessonBubble extends StatelessWidget {
  final String title;
  final String icon;
  final ValueChanged<BuildContext> onTap;

  const LessonBubble(this.title, this.icon, {this.onTap});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap == null ? null : () => onTap(context),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 115,
                  height: 115,
                  child: CircularProgressIndicator(strokeWidth: 13, value: 1),
                ),
                SizedBox(
                  width: 85,
                  height: 85,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFF55ACF3),
                    child: Image.asset(
                      "assets/images/home_screen/lesson_$icon.png",
                      height: 58,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
}
