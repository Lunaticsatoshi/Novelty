import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;
  const RegisterButton({Key key, @required VoidCallback onPressed}) : _onPressed = onPressed, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: _onPressed,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFB71C1C), const Color(0xFFD32F2F)],
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            "Register",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
        ),
      ),
    );
  }
}