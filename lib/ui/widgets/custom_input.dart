import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    this.height = 35,
    required this.width,
    this.enabled = true,
    this.readonly = false,
    required this.controller,
    this.onChanged,
    this.isError = false,
    this.onFocused = false,
    this.onTab,
    this.keyboardType,
    this.inputFormatters,
    this.hintText = "",
    this.withPrefix = false,
    this.prefix = const Text(""),
    this.isPassword = false,
    this.withSuffix = false,
    this.suffix = const Text(""),
    this.backroundColor = const Color(0xffF1F3F4),
  });

  final double width;
  final double height;
  final bool enabled;
  final bool readonly;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool isError;
  final bool onFocused;
  final Function()? onTab;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final bool withPrefix;
  final Widget prefix;
  final bool withSuffix;
  final Widget suffix;
  final bool isPassword;
  final Color backroundColor;

  @override
  Widget build(BuildContext context) {
    double prefixWidth = (withPrefix) ? 20 : 0;
    double suffixWidth = (withSuffix) ? 20 : 0;

    double _width = width - 30 - prefixWidth - suffixWidth;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: new BoxDecoration(
        color: (isError)
            ? errorBackroundColor
            : ((onFocused) ? blueBackroundColor : backroundColor),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: (isError)
              ? errorDefaultColor
              : ((onFocused) ? blueDefaultColor : greyBorderColor),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          if (withPrefix) ...[
            prefix,
          ],
          SizedBox(
            height: height,
            width: _width,
            child: TextFormField(
              obscureText: (isPassword) ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              enabled: enabled,
              readOnly: readonly,
              controller: controller,
              onChanged: onChanged,
              onTap: onTab,
              style: blackFontStyle14,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              decoration: new InputDecoration(
                hintText: hintText,
                hintStyle: greyFontStyle12,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          if (withSuffix) ...[
            suffix,
          ],
        ],
      ),
    );
  }
}
