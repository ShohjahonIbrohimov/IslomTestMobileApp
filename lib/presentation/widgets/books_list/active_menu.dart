import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';

class ActiveMenu extends StatelessWidget {
  final icon;
  final title;
  const ActiveMenu({Key? key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset('assets/images/curve.png'),
        Positioned(
          right: 23,
          bottom: -12,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFef036f),
                  Color(0xFFbe56ff),
                ],
              ),
              borderRadius: BorderRadius.circular(
                50.0,
              ),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              iconSize: 25,
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ),
        ),
        Positioned(
          bottom: -35,
          right: 25,
          child: Text(title),
        )
      ],
    );
  }
}
