import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
  final Text label;
  final Function()? onPressed;

  final buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: const Color.fromARGB(255, 233, 143, 21),
    textStyle: const TextStyle(
      fontSize: 16,
    ),
    padding: const EdgeInsets.all(14),
  );

  BlockButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: buttonStyle, onPressed: onPressed, child: label),
    );
  }
}
