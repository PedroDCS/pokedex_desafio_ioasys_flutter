import 'package:flutter/material.dart';

class ErrorGenericWidget extends StatelessWidget {
  const ErrorGenericWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.error_outline, color: Colors.amber),
          Text(
            "Error",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Tente Novamente",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
