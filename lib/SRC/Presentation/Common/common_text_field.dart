import 'package:cihan_bank_mobile_banking/SRC/Data/AppData/app_exports.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
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
    required this.controller,
    required this.hintText,
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
  });

  final double? borderRadius;
  final bool? enabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

bool isHide = false;

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      scribbleEnabled: true,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
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
        color: Theme.of(context).colorScheme.tertiary,
      ),
      cursorColor: themeData.colorScheme.primary,

      decoration: InputDecoration(
        hintText: widget.hintText,

        helperStyle: widget.hintStyle ?? themeData.textTheme.bodySmall,
        hintStyle: themeData.textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.isState != null
            ? GestureDetector(
                onTap: () {
                  //isHide=true;
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
                      !isHide
                          ? Assets.icons.viewHideIcon
                          : 'assets/Icons/show_pass.svg',
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

        ///changes
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 12,
            ),
      ),
    );
  }
}
