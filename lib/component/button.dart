import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final Size? size;
  final String? head;
  final Function()? onPress;
  const ButtonItem({Key? key, this.head, this.onPress, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size!.shortestSide * .05,
          vertical: size!.longestSide * .015),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            head!,
            style: TextStyle(
                fontSize: size!.shortestSide * .065,
                letterSpacing: 1.5,
                fontFamily: 'button'),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.blueGrey.shade700),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: size!.longestSide * .023))),
        ),
      ),
    );
  }
}
