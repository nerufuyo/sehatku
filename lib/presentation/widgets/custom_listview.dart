import 'package:flutter/material.dart';
import 'package:sehatku/presentation/style/pallet.dart';
import 'package:sehatku/presentation/style/typography.dart';
import 'package:sehatku/presentation/widgets/basic_components.dart';

Stack customListView(
  BuildContext context,
  int index, {
  required contentPaddingAlign,
  required contentFirstText,
  required contentSecondText,
  required contentSecondTextStyle,
  required contentDescription,
  required contentButtonOntapped,
  required contentButtonCondition,
  required contentButtonText,
  required contentButtonIcon,
  required contentPositionAlign,
  required contentImage,
}) {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.035,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white0,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              color: white0,
            ),
            padding: contentPaddingAlign
                ? const EdgeInsets.all(16)
                : EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.35,
                    top: 16,
                    bottom: 16,
                    right: 16,
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customText(
                      textValue: contentFirstText,
                      textStyle: body2.copyWith(color: primary),
                    ),
                    customText(
                      textValue: contentSecondText,
                      textStyle: contentSecondTextStyle == ''
                          ? body2.copyWith(color: primary)
                          : heading4.copyWith(color: primary),
                    ),
                  ],
                ),
                customVerticalSpace(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: customText(
                    textValue: contentDescription,
                    textStyle: body3.copyWith(color: tertiary),
                  ),
                ),
                customVerticalSpace(height: 4),
                InkWell(
                  onTap: contentButtonOntapped,
                  child: contentButtonCondition == null
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.275,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primary,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: Center(
                            child: customText(
                              textValue: contentButtonText,
                              textStyle: body3.copyWith(
                                color: white0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            customText(
                                textValue: contentButtonText,
                                textStyle: subHeading3.copyWith(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                )),
                            customHorizontalSpace(width: 8),
                            Icon(
                              contentButtonIcon,
                              color: primary,
                            )
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
      Align(
        alignment: contentPositionAlign,
        child: Padding(
          padding: EdgeInsets.only(
            right: index == 0 ? 0 : 16,
            left: 16,
          ),
          child: Image.asset(
            contentImage,
            width: index == 0
                ? MediaQuery.of(context).size.width * 0.35
                : MediaQuery.of(context).size.width * 0.275,
            height: index == 0
                ? MediaQuery.of(context).size.height * 0.175
                : MediaQuery.of(context).size.height * 0.125,
            fit: index == 0 ? BoxFit.fitHeight : BoxFit.fitWidth,
          ),
        ),
      ),
    ],
  );
}
