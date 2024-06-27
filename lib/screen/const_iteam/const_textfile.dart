import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:securepoint/core/constants/size.dart';

SizedBox primaryTextfield({
  required String hintText,
  required controller,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 50.96.ah,
    child: TextFormField(
      cursorColor: Colors.black,
      enabled: enabled ?? true,

      // onTap: onTap,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.text,
      style: const TextStyle(color: Colors.black),
      inputFormatters: inputFormatters ?? null, //
      // Apply the custom formatter
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.only(left: 15.h),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFE4E2E6),
            width: 1.aw,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFE4E2E6),
            width: 1.aw,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.aw,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(.40),
            fontWeight: FontWeight.bold,
            fontSize: 12),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

SizedBox primaryTextfield1({
  required String hintText,
  required controller,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 50.96.ah,
    child: TextFormField(
      cursorColor: Colors.black,
      enabled: enabled ?? true,
      // onTap: onTap,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.phone,
      style: const TextStyle(color: Colors.black),
      inputFormatters: inputFormatters ?? null, //
      // Apply the custom formatter
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.only(left: 15.h),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFE4E2E6),
            width: 1.aw,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFE4E2E6),
            width: 1.aw,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.aw,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(.40),
            fontWeight: FontWeight.bold,
            fontSize: 12),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

SizedBox primaryTextfield2({
  required String hintText,
  required controller,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 44.adaptSize,
    //width: 240.aw,
    child: TextFormField(
      cursorColor: Colors.black,
      enabled: enabled ?? true,
      // onTap: onTap,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.text,
      style: const TextStyle(color: Colors.black),
      inputFormatters: inputFormatters ?? null, //
      // Apply the custom formatter
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        counterText: "",
        contentPadding: const EdgeInsets.only(left: 10),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontSize: 15.fSize),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

SizedBox primaryTextfield3({
  required String hintText,
  required controller,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 102.ah,
    //width: 240.aw,
    child: TextFormField(
      cursorColor: Colors.black,
      enabled: enabled ?? true,
      // onTap: onTap,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.text,
      style: const TextStyle(color: Colors.black),
      inputFormatters: inputFormatters ?? null, //
      // Apply the custom formatter
      maxLines: maxLines ?? 5,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.only(left: 10.h, top: 12),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Color(0xff000000).withOpacity(.50),
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            fontSize: 11.fSize),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    final List<String> _options = ['Stolen 1', 'Stolen 2', 'Stolen 3'];
    String? _selectedOption;
    return DropdownButtonFormField<String>(
      value: _selectedOption,
      items: _options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedOption = value;
        });
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12),
        // labelText: 'Select an option',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFB5B5B5),
            width: 1,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}

class CustomDropdownTextField extends StatelessWidget {
  final String? selectedItem;
  final List<DropdownMenuItem<String>> demoItems;
  final Function(String?) onSelect;

  const CustomDropdownTextField({
    Key? key,
    required this.selectedItem,
    required this.demoItems,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      onChanged: onSelect,
      items: demoItems,
      decoration: const InputDecoration(
        hintText: "Choose name",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      ),
    );
  }
}

SizedBox primaryTextfield4({
  required String hintText,
  required controller,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 44.ah,
    child: TextFormField(
      cursorColor: Colors.black,
      enabled: enabled ?? true,
      // onTap: onTap,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.text,
      style: const TextStyle(color: Colors.black),
      inputFormatters: inputFormatters ?? null, //
      // Apply the custom formatter
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        counterText: "",
        contentPadding: const EdgeInsets.only(left: 10),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFB5B5B5),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFFB5B5B5),
            width: 1,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black.withOpacity(.40),
            fontWeight: FontWeight.bold,
            fontSize: 12),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

SizedBox primaryTextfield5({
  required String hintText,
  required controller,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 45.ah,
    child: TextFormField(
      cursorColor: Colors.black,
      enabled: enabled ?? true,
      // onTap: onTap,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      inputFormatters: inputFormatters ?? null, //
      // Apply the custom formatter
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        counterText: "",
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

SizedBox primaryTextfieldSg({
  required String hintText,
  required controller,
  Function(String)? onChanged,
  var validator,
  int? maxLines,
  String? suffixIconn,
  bool? obscureText,
  VoidCallback? onTap,
  TextInputType? textInputType,
  bool? enabled,
  String? initialValue,
  int? maxLength,
  List<TextInputFormatter>? inputFormatters,
}) {
  return SizedBox(
    height: 50.ah,
    child: TextFormField(
      cursorColor: Colors.green,
      enabled: enabled ?? true,
      onChanged:onChanged ,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: textInputType ?? TextInputType.text,
      style: const TextStyle(color: Colors.black),
      inputFormatters: inputFormatters ?? null, //
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,

      decoration: InputDecoration(
        fillColor: Color(0xffFAFAFA),
        filled: true,
        counterText: "",
        contentPadding: EdgeInsets.only(left: 15.h),
        // filled: true,
        // fillColor: Colors.grey.withOpacity(.25),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1.aw,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1.aw,
          ),
        ),
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.aw,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: BorderSide(
            color: Color(0xFF32CD30),
            width: 1,
          ),
        ),

        hintText: hintText,
        hintStyle: TextStyle(
            color: Color(0xff666666),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 12.fSize),
        suffixIcon: suffixIconn == null
            ? const SizedBox(
                height: 1,
                width: 1,
              )
            : IconButton(
                onPressed: onTap,
                icon: SvgPicture.asset(
                  suffixIconn,
                  fit: BoxFit.none,
                  color: Colors.black54,
                ),
              ),
      ),

      obscureText: obscureText ?? false,
      // validator: validator,
    ),
  );
}

class CustomTextFormField1 extends StatelessWidget {
  CustomTextFormField1({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.inputFormatters,
    this.onTap,
    this.autovalidateMode,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  Function()? onEditingComplete;
  Function(String)? onChanged;

  Function(String?)? onSaved;
  Function()? onTap;

  AutovalidateMode? autovalidateMode;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          onTap: onTap,
          cursorColor: Colors.green,
          onEditingComplete: onEditingComplete,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          onSaved: onSaved,
          //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          controller: controller,
          // focusNode: focusNode ?? FocusNode(),
          // autofocus: autofocus!,
          style: textStyle ?? TextStyle(),
          obscureText: obscureText!,
          inputFormatters: inputFormatters ?? null,
          // textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
    fillColor: Color(0xffFAFAFA),
    filled: true,
    counterText: "",
    contentPadding: EdgeInsets.only(left: 15.h),
    suffixIcon: suffix,
    // filled: true,
    // fillColor: Colors.grey.withOpacity(.25),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.h),
      borderSide: BorderSide(
        color: Color(0xFFDEDEDE),
        width: 1.aw,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.h),
      borderSide: BorderSide(
        color: Color(0xFFDEDEDE),
        width: 1.aw,
      ),
    ),
    errorStyle: TextStyle(color: Colors.red),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.h),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.aw,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.h),
      borderSide: BorderSide(
        color: Color(0xFF32CD30),
        width: 1,
      ),
    ),

    hintText: hintText,
    hintStyle: TextStyle(
        color: Color(0xff666666),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 12.fSize),

  );

}
