import 'package:flutter/material.dart';

class ClearableTextFormField extends StatefulWidget {
  final String labelText;
  final Function(String) onChanged;
  final TextEditingController? controller;

  const ClearableTextFormField({
    required this.labelText,
    required this.onChanged,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _ClearableTextFormFieldState createState() => _ClearableTextFormFieldState();
}

class _ClearableTextFormFieldState extends State<ClearableTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (newValue) {
        widget.onChanged(newValue);
        // setState(() {}); // To update the clear icon visibility
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                  widget.onChanged(
                      _controller.text); // To notify the change after clearing
                },
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
    );
  }
}
