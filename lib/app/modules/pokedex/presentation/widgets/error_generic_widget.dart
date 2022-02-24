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
        children: const [
          Icon(Icons.error_outline, color: Colors.amber),
          Text(
            "Ocorreu algum erro para carregar a pagina, tente novamente mais tarde",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
