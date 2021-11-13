import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';
import 'package:islom_test/presentation/widgets/books_list/active_menu.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  double active = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: const BoxDecoration(
        color: primaryColorLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: (active * 58 + 20).toDouble(),
                  top: -50,
                  child: ActiveMenu(icon: Icons.home, title: 'Home'))),
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: active == 1
                ? Positioned(
                    top: -17,
                    left: 20,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          active = 0;
                        });
                      },
                      icon: const Icon(
                        Icons.home,
                        color: iconColor,
                        size: 30,
                      ),
                    ),
                  )
                : Text(''),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 2),
            child: active == 0
                ? Positioned(
                    top: -17,
                    left: 90 + 20,
                    child: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            active = 1;
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: iconColor,
                        size: 30,
                      ),
                    ),
                  )
                : Text(''),
          )
        ],
      ),
    );
  }
}
