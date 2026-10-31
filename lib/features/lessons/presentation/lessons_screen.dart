import 'package:duolingo/features/lessons/presentation/lesson_bubble.dart';
import 'package:duolingo/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

void _showIntroduction(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            "Introdução",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Esta lição estará disponível em breve.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            "ENTENDI",
            onPressed: () => Navigator.of(sheetContext).pop(),
          ),
        ],
      ),
    ),
  );
}

const List<List<LessonBubble>> _rows = <List<LessonBubble>>[
  <LessonBubble>[
    LessonBubble("Introdução", "egg", onTap: _showIntroduction),
  ],
  <LessonBubble>[
    LessonBubble("Saudações", "dialog"),
    LessonBubble("Viagem", "airplane"),
  ],
  <LessonBubble>[
    LessonBubble("Cafeteria", "hamburger"),
    LessonBubble("Famílias", "baby"),
  ],
];

class LessonsScreen extends StatelessWidget {
  const LessonsScreen();

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 38),
        children: <Widget>[
          for (final row in _rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row,
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Expanded(child: _CheckpointLine()),
              Image.asset(
                "assets/images/home_screen/lesson_divisor_castle.png",
                height: 85,
                semanticLabel: "Ponto de controle",
              ),
              const Expanded(child: _CheckpointLine()),
            ],
          ),
        ],
      );
}

class _CheckpointLine extends StatelessWidget {
  const _CheckpointLine();

  @override
  Widget build(BuildContext context) => Divider(
        color: Colors.grey.shade300,
        height: 50,
        thickness: 2,
        indent: 12,
        endIndent: 12,
      );
}
