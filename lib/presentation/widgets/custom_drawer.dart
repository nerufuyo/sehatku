import 'package:flutter/material.dart';
import 'package:sehatku/presentation/screens/authentication/authentication_screen.dart';
import 'package:sehatku/presentation/screens/profile/profile_screen.dart';
import 'package:sehatku/presentation/style/pallet.dart';
import 'package:sehatku/presentation/style/typography.dart';
import 'package:sehatku/presentation/widgets/basic_components.dart';

Drawer customDrawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width,
    backgroundColor: Colors.transparent,
    child: Row(
      children: [
        SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height,
            color: primary.withOpacity(.25),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white0,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.close_rounded,
                      color: primary,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height,
            color: white0,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    customHorizontalSpace(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            customText(
                              textValue: 'Listyo',
                              textStyle: heading4.copyWith(color: primary),
                            ),
                            customText(
                              textValue: 'Adi',
                              textStyle: body2.copyWith(color: primary),
                            ),
                          ],
                        ),
                        customText(
                          textValue: 'Membership BBLK',
                          textStyle: subHeading4.copyWith(
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                customVerticalSpace(height: 16),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>
                      customVerticalSpace(height: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, ProfileScreen.routeName),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: white10,
                          width: .5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: white0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            textValue: index == 0 ? 'Profil' : 'Pengaturan',
                            textStyle: body3.copyWith(color: primary),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: primary,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                customVerticalSpace(height: 16),
                customButtonwithIcon(
                  buttonWidth: MediaQuery.of(context).size.width,
                  buttonTitle: 'Keluar',
                  buttonOnTapped: () => Navigator.pushReplacementNamed(
                      context, AuthenticationScreen.routeName),
                  buttonIcon: Icons.logout_rounded,
                  buttonColor: Colors.red,
                ),
                customVerticalSpace(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      textValue: 'Ikuti Kami di',
                      textStyle: body3.copyWith(color: primary),
                    ),
                    customHorizontalSpace(width: 8),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Icon(index == 0
                            ? Icons.facebook_rounded
                            : index == 1
                                ? Icons.facebook_rounded
                                : Icons.facebook_rounded),
                      ),
                    )
                  ],
                ),
                customVerticalSpace(
                    height: MediaQuery.of(context).size.height * .25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    2,
                    (index) => customText(
                      textValue: index == 0 ? 'FAQ' : 'Kebijakan Privasi',
                      textStyle: heading3.copyWith(color: tertiary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
