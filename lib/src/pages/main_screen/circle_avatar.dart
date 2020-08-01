import 'package:flutter/material.dart';

class CircleAvatarIndicator extends StatelessWidget {
  final Color _backgroundColor;
  final String _img;

  CircleAvatarIndicator(this._backgroundColor, this._img);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 120.0,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: 115,
                  height: 115,
                  child: CircularProgressIndicator(
                    strokeWidth: 13,
                    value: 1.0,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 85,
                  child: CircleAvatar(
                    backgroundColor: _backgroundColor,
                    child: Image.asset(
                      this._img,
                      height: 58,
                    ),
                    radius: 56.0,
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
