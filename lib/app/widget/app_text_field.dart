import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controlName,
    required this.label,
    this.isRequired = false,
    this.maxLines = 1,
    this.hintText,
    this.onSubmitted,
    this.nextFocusControlName,
    this.formGroup,
    this.autofocus = false,
    this.isPasswordVisible = false,
    this.onTap,
  }) : super(key: key);

  final String controlName;
  final String label;
  final bool isRequired;
  final int maxLines;
  final String? hintText;
  final void Function(FormControl<Object?>)? onSubmitted;
  final String? nextFocusControlName;
  final FormGroup? formGroup;
  final bool autofocus;
  final bool isPasswordVisible;
  // final bool isPasswordVisible;
  final Function()? onTap;
  _onSubmit(FormControl<Object?> control) {
    if (onSubmitted != null) {
      onSubmitted!(control);
    }

    if (nextFocusControlName != null && formGroup != null) {
      formGroup!.focus(nextFocusControlName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      obscureText: controlName == 'password' ? isPasswordVisible : false,
      autofocus: autofocus,
      maxLines: maxLines,
      keyboardType: maxLines > 1 ? TextInputType.multiline : TextInputType.text,
      formControlName: controlName,
      validationMessages: isRequired
          ? {'required': (error) => '$label can not be empty'}
          : null,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: controlName == 'password'
              ? IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: onTap,
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ))
              : null,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelText: maxLines > 1 ? null : "$label${isRequired ? "*" : ""}",
      ),
      onSubmitted: _onSubmit,
    );
  }
}
