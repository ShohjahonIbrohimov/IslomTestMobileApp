import 'package:flutter/material.dart';
import 'package:islom_test/presentation/config/constants.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF333863),
              blurRadius: 20,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Container(
              height: 20,
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
                  16.0,
                ),
              ),
              child: const IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 25,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            filled: true,
            fillColor: primaryColorLight,
            hintText: 'Search',
            hintStyle: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w300),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide.none,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
