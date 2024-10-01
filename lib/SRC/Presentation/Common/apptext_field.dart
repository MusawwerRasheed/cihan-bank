import 'package:cihan_bank_mobile_banking/SRC/Application/Utils/Extensions/responsive_extention.dart';
import 'package:cihan_bank_mobile_banking/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool? isBank;
  final Color? filledColor;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isValid;
  final bool isBorderRequired;
  final String? titleText;
  final int? maxline;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final String? validateText;
  final bool? isShadowRequired;
  final Color? titleTextColor;
  final double? suffixWidth;
  final double? suffixHeight;
  final ValueChanged? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Color? hintTextColor;
  final double? height;
  final bool? isState;
  final String? labelText;
  final double? prefixWidth;
  final EdgeInsets? contentPadding;

  const AppTextField({
    super.key,
     this.controller,
    this.isBank,
    this.hintText,
    this.obscureText = false,
    required this.textInputType,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.isValid = false,
    this.isBorderRequired = true,
    this.titleText = "",
    this.maxline = 1,
    this.labelText,
    this.validateText,
    this.isShadowRequired = false,
    this.titleTextColor,
    this.suffixWidth = 15,
    this.suffixHeight = 15,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.readOnly,
    this.focusNode,
    this.hintTextColor,
    this.borderRadius,
    this.height,
    this.filledColor,
    this.hintStyle,
    this.isState,
    this.titleStyle,
    this.prefixWidth,
    this.enabled,
    this.constraints,
  });

  final double? borderRadius;
  final bool? enabled;
  final BoxConstraints? constraints;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

bool isHide = false;

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final maskFormatter = MaskTextInputFormatter(
    mask: '0000/00000000/000/0000/000',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    // print(Data().textScale);

    ThemeData themeData = Theme.of(context);

    return widget.isBank==true?MaskedTextField(
      maxLength:24,
      keyboardType: widget.textInputType,
      style:themeData.textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ) ,
      escapeCharacter: "0",
      mask: '0000/00000000/000/0000/000', textFieldController: widget.controller!, onChange: widget.onChanged ?? (String value) {


      },

      inputDecoration:  InputDecoration(
          fillColor: widget.filledColor ?? Colors.white,
          hintText: widget.hintText,

          helperStyle: widget.hintStyle ?? themeData.textTheme.bodySmall,
          hintStyle: widget.hintStyle??themeData.textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          prefixIcon: widget.prefixIcon,
          constraints: widget.constraints,
          suffixIcon: widget.isState != null
              ? GestureDetector(
            onTap: () {
              if (isHide == true) {
                isHide = false;
              } else {
                isHide = true;
              }
              setState(() {});
            },
            child: SizedBox(
              width: widget.suffixWidth ?? 20.w,
              height: widget.suffixHeight ?? 20.h,
              child: Center(
                child: SvgPicture.asset(
                  isHide
                      ? Assets.icons.viewShowIcon
                      : Assets.icons.viewHideIcon,
                  width: !isHide ? 25 : 20,
                  height: !isHide ? 25 : 20,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          )
              : widget.suffixIcon != null
              ? Container(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            width: widget.suffixWidth ?? 20.w,
            height: widget.suffixHeight ?? 20.h,
            child: widget.suffixIcon,
          )
              : null,
          isDense: false,
          labelText: widget.labelText,
          labelStyle: themeData.textTheme.labelMedium,
          alignLabelWithHint: true,

          ///changess
          contentPadding: widget.contentPadding),


    ) : TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      scribbleEnabled: true,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      inputFormatters: widget.isBank==true?[maskFormatter]:[],
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator ??
          (v) {
            if (v!.isEmpty) {
              return widget.validateText;
            }
            return null;
          },
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,
      obscureText: widget.isState != null ? !isHide : widget.obscureText,
      controller: widget.controller,
      maxLines: widget.maxline,
      style: themeData.textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      cursorColor: themeData.colorScheme.primary,

      decoration: InputDecoration(
          fillColor: widget.filledColor ?? Colors.white,
          hintText: widget.hintText,
          helperStyle: widget.hintStyle ?? themeData.textTheme.bodySmall,
          hintStyle: widget.hintStyle??themeData.textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          prefixIcon: widget.prefixIcon,
          constraints: widget.constraints,
          suffixIcon: widget.isState != null
              ? GestureDetector(
                  onTap: () {
                    if (isHide == true) {
                      isHide = false;
                    } else {
                      isHide = true;
                    }
                    setState(() {});
                  },
                  child: SizedBox(
                    width: widget.suffixWidth ?? 20.w,
                    height: widget.suffixHeight ?? 20.h,
                    child: Center(
                      child: SvgPicture.asset(
                        isHide
                            ? Assets.icons.viewShowIcon
                            : Assets.icons.viewHideIcon,
                        width: !isHide ? 25 : 20,
                        height: !isHide ? 25 : 20,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                )
              : widget.suffixIcon != null
                  ? Container(
                      padding: const EdgeInsetsDirectional.only(end: 2.0),
                      width: widget.suffixWidth ?? 20.w,
                      height: widget.suffixHeight ?? 20.h,
                      child: widget.suffixIcon,
                    )
                  : null,
          isDense: false,
          labelText: widget.labelText,
          labelStyle: themeData.textTheme.labelMedium,
          alignLabelWithHint: true,

          ///changess
          contentPadding: widget.contentPadding),
    );
  }
}



/*
*
* In this we Implement Text Field where we can write Multiple text
* Like Date 01/02/2022
* Phone Number +91 98765-43210
* Zip code AND Many other things
*/


class MaskedTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  /*

  * This is for format which you want added in mask foe example if we want a date formate
  text (01-02-2022) then we define it text in mask (xx-xx-xxxx).

  * escapeCharacter is by defeault declear as 'x' but if change mask text then you also need to declear it in escapeCharacter.

  * maxLength is for max character length in a line.

  * Keyboard type for TextInputType like number keyboard or text keyboard etc.

   */

  final String mask;
  final String escapeCharacter;

  final int maxLength;
  final TextInputType keyboardType;
  final InputDecoration inputDecoration;
  final bool autofocus;
  final TextStyle? style;

  final ValueChanged<String> onChange;

  const MaskedTextField(
      {super.key,
        required this.mask,
        this.escapeCharacter = "x",
        required this.textFieldController,
        this.maxLength = 100,
        this.keyboardType = TextInputType.text,
        this.inputDecoration = const InputDecoration(),
        this.autofocus = false,
        required this.onChange, this.style});

  @override
  Widget build(BuildContext context) {
    var lastTextSize = 0;

    return TextFormField(
      controller: textFieldController,
      maxLength: maxLength,
      style: style,
      keyboardType: keyboardType,
      decoration: inputDecoration,
      autofocus: autofocus,
      onChanged: (String text) {
        // its deleting text
        if (text.length < lastTextSize) {
          if (mask[text.length] != escapeCharacter) {
            textFieldController.selection = TextSelection.fromPosition(
                TextPosition(offset: textFieldController.text.length));
          }
        } else {
          // its typing
          if (text.length >= lastTextSize) {
            var position = text.length;

            if ((mask[position - 1] != escapeCharacter) &&
                (text[position - 1] != mask[position - 1])) {
              textFieldController.text = _buildText(text);
            }

            if (mask[position] != escapeCharacter) {
              textFieldController.text =
              "${textFieldController.text}${mask[position]}";
            }
          }

          // Android on change resets cursor position(cursor goes to 0)
          // so you have to check if it reset, then put in the end(just on android)
          // as IOS bugs if you simply put it in the end

          if (textFieldController.selection.start <
              textFieldController.text.length) {
            textFieldController.selection = TextSelection.fromPosition(
                TextPosition(offset: textFieldController.text.length));
          }
        }

        // update cursor position
        lastTextSize = textFieldController.text.length;

        onChange(textFieldController.text);
      },
    );
  }

  //For build Text Method
  String _buildText(String text) {
    var result = "";

    for (int i = 0; i < text.length - 1; i++) {
      result += text[i];
    }

    result += mask[text.length - 1];
    result += text[text.length - 1];

    return result;
  }
}
