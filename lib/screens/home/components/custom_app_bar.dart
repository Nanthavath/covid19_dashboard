import 'package:covid19_dashboard/styles/palette.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key key,this.menu,this.notify}) : super(key: key);
  final VoidCallback menu;
  final VoidCallback notify;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28,
        onPressed:menu,

      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none),
          onPressed: notify,
          iconSize: 28,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
