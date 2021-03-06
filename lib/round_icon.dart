import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
