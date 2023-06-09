import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final String textLabel;
  final String? errorMessage;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  const InputPassword({
    super.key, 
    required this.textLabel, 
    this.errorMessage, 
    this.onChanged,
    this.onFieldSubmitted});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        obscureText: !_showPassword,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          errorText: widget.errorMessage,
          labelText: widget.textLabel,
          suffixIcon: IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        ),
      ),
    );
  }
}
