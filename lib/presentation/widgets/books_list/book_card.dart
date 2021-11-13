import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
              image: AssetImage("assets/images/book1.jpg"),
              fit: BoxFit.cover,
            ),
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(bottom: 20),
          width: 150,
          decoration: const BoxDecoration(
            
            color: Colors.white,
          ),
          child: Text(
            'Some book',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
