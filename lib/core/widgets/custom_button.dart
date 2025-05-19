import 'package:flutter/material.dart';

import '../untils/app_colors.dart';
class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text, required this.onPressed,this.backgroundColor=AppsColors.primary});
final String text;
final VoidCallback onPressed;
Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: MaterialStateProperty.all(backgroundColor)
      ),
      onPressed: onPressed,
      child: Text(text,style: TextStyle(color: AppsColors.white),
      ),
    );
  }
}
