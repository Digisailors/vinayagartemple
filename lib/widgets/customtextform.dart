import 'package:flutter/material.dart';

/// __________CoustTextFormFeild _____________

class CustomTextFormFeild1 extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String? hinttext;
  final IconData? prefixIcon;
  final IconData? surffixIcon;

  const CustomTextFormFeild1(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.labelText,
      this.prefixIcon,
      this.hinttext,
      this.surffixIcon,
      required Future<void> Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 12, // Adjust the font size as needed
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hinttext,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: surffixIcon != null
              ? Icon(
                  surffixIcon,
                  color: Colors.black,
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Colors.black,
                )
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: (Value) {
          if (Value == null || Value.isEmpty) {
            return '${labelText} is required';
          }
          return null;
        },
      ),
    );
  }
}

class CustomTextFormFeild extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  const CustomTextFormFeild(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.labelText,
      this.prefixIcon,
      this.validator});

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        cursorColor: Colors.white,
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: Colors.white,
                )
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: widget.validator,

        // validator: (Value){
        // if(Value == null||Value.isEmpty){
        //     return '${widget.labelText} is required';
        // }
        // return null;
        // },
      ),
    );
  }
}
class CustomTextFormFeilds extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  const CustomTextFormFeilds(
      {super.key,
      required this.controller,
      this.obscureText = false,
      required this.labelText,
      this.prefixIcon,
      this.validator});

  @override
  State<CustomTextFormFeilds> createState() => _CustomTextFormFeildsState();
}

class _CustomTextFormFeildsState extends State<CustomTextFormFeilds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        cursorColor: Colors.black12,
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 77, 74, 74),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: Colors.white,
                )
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: widget.validator,

        // validator: (Value){
        // if(Value == null||Value.isEmpty){
        //     return '${widget.labelText} is required';
        // }
        // return null;
        // },
      ),
    );
  }
}

///____________________Elevated Button-----------////

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const CustomElevatedButton({Key? key, this.onPressed, this.child})
      : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const  Color(0xFF006CA7),), // Red color
        elevation: MaterialStateProperty.all<double>(4),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(41),
          ),
        ),
      ),
      child: widget.child,
    );
  }
}
