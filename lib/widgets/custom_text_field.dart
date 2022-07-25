import 'package:flutter/material.dart';
import 'package:twitch_clone/utils/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final bool hideText;
  final String hintLable;
  final TextEditingController textController;
  final Function(String)? onTap;
  const CustomTextfield({
    Key? key,
    required this.text,
    required this.hideText,
    required this.hintLable,
    required this.textController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            onSubmitted: onTap,
            controller: textController,
            style: const TextStyle(
              fontSize: 20,
              color: primaryColor,
              letterSpacing: 0.7,
              fontWeight: FontWeight.bold,
            ),
            obscureText: hideText,
            decoration: InputDecoration(
              hintText: hintLable,
              hintStyle: const TextStyle(
                color: hintTextColor,
                fontSize: 18,
              ),
              contentPadding: const EdgeInsets.all(16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: secondaryBackgroundColor,
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: secondaryBackgroundColor,
                  width: 3,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
