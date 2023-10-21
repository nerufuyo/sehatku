import 'package:flutter/material.dart';
import 'package:sehatku/presentation/style/pallet.dart';
import 'package:sehatku/presentation/style/typography.dart';

SizedBox customVerticalSpace({required double height}) {
  return SizedBox(height: height);
}

SizedBox customHorizontalSpace({required double width}) {
  return SizedBox(width: width);
}

Text customText({required String textValue, textStyle}) {
  return Text(
    textValue,
    style: textStyle ?? heading1,
  );
}

SizedBox customTextField({
  required double textFieldWidth,
  required String textFieldTitle,
  required TextEditingController textFieldController,
  required bool textFieldObscureText,
  required String textFieldHintText,
  required String textFieldErrorText,
  required textFieldOnChanged,
  isSuffixIcon = false,
  textFieldSuffixIcon,
  isTextButton = false,
  textButtonTitle,
  textButtonOnTapped,
}) {
  return SizedBox(
    width: textFieldWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              textValue: textFieldTitle,
              textStyle: heading4.copyWith(
                color: primary,
              ),
            ),
            Visibility(
              visible: isTextButton,
              child: InkWell(
                onTap: textButtonOnTapped,
                child: customText(
                  textValue: textButtonTitle ?? 'Lupa Password Anda?',
                  textStyle: body3.copyWith(color: primary),
                ),
              ),
            ),
          ],
        ),
        customVerticalSpace(height: 8),
        TextField(
          controller: textFieldController,
          obscureText: textFieldObscureText,
          onChanged: textFieldOnChanged,
          decoration: InputDecoration(
            suffixIcon: isSuffixIcon ? textFieldSuffixIcon : null,
            hintText: textFieldHintText,
            hintStyle: body4.copyWith(color: white20),
            isDense: true,
            errorText: textFieldErrorText == '' ? null : textFieldErrorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: white10.withOpacity(.25),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: primary,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

InkWell customButtonwithIcon({
  required double buttonWidth,
  required String buttonTitle,
  required buttonOnTapped,
  required buttonIcon,
}) {
  return InkWell(
    onTap: buttonOnTapped,
    child: Container(
      width: buttonWidth,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16),
          customText(
            textValue: buttonTitle,
            textStyle: heading4.copyWith(color: white0),
          ),
          Icon(buttonIcon, color: white0)
        ],
      ),
    ),
  );
}
