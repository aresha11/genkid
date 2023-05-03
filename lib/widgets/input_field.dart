import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  String? label;
  String? hint;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool secure;
  @required
  Function validated;
  @required
  Function onchange;
  @required
  Function onEditingComplete;
  TextEditingController? controller;
  VoidCallback? onTap;
  Color borderColor;
  bool readonly;
  int? maxLines;
  TextInputType? keyboardType;
  String? initialValue;

  InputField(
      {super.key,
      this.readonly = false,
      this.label,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.secure = false,
      this.controller,
      required this.validated,
      this.onTap,
      this.keyboardType,
      this.maxLines=1,
      this.initialValue,
      required this.onchange,
      required this.onEditingComplete,
      this.borderColor = Colors.grey});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;
  var eyeIcon = Icons.remove_red_eye;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 30,
      borderRadius: BorderRadius.circular(40),
      shadowColor: Colors.black.withOpacity(.5),
      child: TextFormField(
        onEditingComplete: () => widget.onEditingComplete(),
        onChanged: (p) => widget.onchange(p),
        // autofocus: false,
        initialValue: widget.initialValue,
        maxLines: widget.maxLines,
        inputFormatters: <TextInputFormatter>[
          if (widget.keyboardType == TextInputType.phone)
            FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: widget.keyboardType,
        readOnly: widget.readonly,
        onTap: widget.onTap,
        validator: (p) => widget.validated(p),
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Color(0xffF5F5FA)),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: const Color(0xffF5F5FA),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: widget.borderColor,
            ),
          ),
          labelText: widget.label,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(),
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.prefixIcon,color: Colors.black,
          ),
          suffixIcon: widget.secure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                      eyeIcon = hidePassword
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined;
                    });
                  },
                  icon: Icon(eyeIcon),
                )
              : null,
        ),
        obscureText: widget.secure && hidePassword,
      ),
    );
  }
}
