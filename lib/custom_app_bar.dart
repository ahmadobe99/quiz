import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  final String title;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(
        widget.title,
        style:  TextStyle(
          fontSize: 28.0,
          // fontWeight: FontWeight.bold,
          letterSpacing: 4.0,
          color: Theme.of(context).textTheme.headline1!.color
        ),
      ),
      centerTitle: true,
    );
  }
}
