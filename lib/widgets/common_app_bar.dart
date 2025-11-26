import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.height = 100.0,
    this.backgroundColor = Colors.white,
    this.elevation = 5,
    this.shape,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double height;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder? shape;

  @override
  Size get preferredSize => Size.fromHeight(height);

  // this is a custom appbar to tell flutter about its internal height
  // we need to define a prefeered size height


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return AppBar(
    toolbarHeight: height,
    backgroundColor: backgroundColor,
    elevation: elevation,
      shadowColor: elevation > 0 ?
    Colors.black.withOpacity(0.05):null,
    shape: shape ??
    const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
bottom: Radius.circular(40)

      ),
    ),

   title: title,
   leading: leading,
   actions: actions,
   centerTitle: true,
   automaticallyImplyLeading: false,









  );





  }





}