import 'package:flutter/material.dart';

class CircleAvatarIndicator extends StatelessWidget {
  final Color _backgroundColor;
  final String _img;

  const CircleAvatarIndicator(this._backgroundColor, this._img);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: 115,
                  height: 115,
                  child: const CircularProgressIndicator(
                    strokeWidth: 13,
                    value: 1,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 85,
                  child: CircleAvatar(
                    backgroundColor: _backgroundColor,
                    radius: 56,
                    child: Image.asset(
                      _img,
                      height: 58,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
