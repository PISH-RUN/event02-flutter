import 'package:flutter/material.dart';

class OurTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const OurTextField({@required this.hint, this.icon, @required this.controller, this.keyboardType = TextInputType.text, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 15),
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(1.0),
        ),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0), borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
          borderSide: BorderSide(width: 2, color: Colors.black.withOpacity(0.6)),
        ),
        labelText: hint,
        labelStyle: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.6)),
        prefixIcon: icon == null ? null : Icon(icon, color: Colors.blue, size: 17),
      ),
    );
  }
}
