// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:widgets/widgets/elements/input/search_input.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(226, 255, 255, 255),
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0), // สีของเส้นขอบด้านล่าง
            width: 2.0, // ความกว้างของเส้นขอบด้านล่าง
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SearchInput()),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.info_outline_rounded,
                color: Color.fromARGB(255, 13, 0, 154),
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}