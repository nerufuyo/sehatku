import 'package:flutter/material.dart';
import 'package:sehatku/common/constant.dart';
import 'package:sehatku/presentation/style/pallet.dart';
import 'package:sehatku/presentation/style/typography.dart';
import 'package:sehatku/presentation/widgets/basic_components.dart';
import 'package:sehatku/presentation/widgets/custom_appbar.dart';
import 'package:sehatku/presentation/widgets/custom_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final List tabBarName = ['Profil Saya', 'Pengaturan'];
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      identityNumberController = TextEditingController(),
      passwordConfirmationController = TextEditingController();
  String emailErrorText = '',
      passwordErrorText = '',
      firstNameErrorText = '',
      lastNameErrorText = '',
      phoneNumberErrorText = '',
      identityNumberErrorText = '',
      passwordConfirmationErrorText = '';
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white5,
      key: key,
      appBar: customAppBar(
        menuOnPressed: () => key.currentState!.openDrawer(),
      ),
      drawer: customDrawer(context),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: white0,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: customTabBar(
                  tabBarController: tabController,
                  tabBarOnTapped: (index) {
                    setState(() {
                      tabController!.index = index;
                    });
                  },
                  tabBarLength: tabBarName.length,
                  tabBarName: tabBarName,
                  tabBarTextColor: tabController!.index,
                  tabBarIndicatorColor: secondary,
                  tabBarSelectedColor: primary,
                ),
              ),
              customVerticalSpace(height: 16),
              _buildCardProfile(context),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: white0,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText(
                      textValue: 'Pilih Data yang Ingin Ditampilkan',
                      textStyle: body2.copyWith(color: primary),
                    ),
                    customVerticalSpace(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              color: white0,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            2,
                            (index) => customText(
                              textValue: index == 0
                                  ? 'Data Diri'
                                  : 'Data diri Anda sesuai KTP',
                              textStyle: index == 0 ? heading4 : body4,
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: white10,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.location_on_rounded,
                              color: white0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    customVerticalSpace(height: 24),
                    _buildProfileForm(context),
                    customVerticalSpace(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.info_rounded,
                          color: primary,
                        ),
                        customHorizontalSpace(width: 8),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: customText(
                            textValue:
                                'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                            textStyle: body4,
                          ),
                        ),
                      ],
                    ),
                    customVerticalSpace(height: 24),
                    customButtonwithIcon(
                      buttonWidth: MediaQuery.of(context).size.width,
                      buttonTitle: 'Simpan Profil',
                      buttonOnTapped: () {},
                      buttonIcon: Icons.save_as_rounded,
                    ),
                    customVerticalSpace(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .1,
                      color: primary,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildProfileForm(BuildContext context) {
    return Column(
      children: List.generate(
          profileTextField.length,
          (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: customTextField(
                    textFieldWidth: MediaQuery.sizeOf(context).width,
                    textFieldTitle: profileTextField[index]['label'],
                    textFieldController: index == 0
                        ? firstNameController
                        : index == 1
                            ? lastNameController
                            : index == 2
                                ? emailController
                                : index == 3
                                    ? identityNumberController
                                    : phoneNumberController,
                    textFieldObscureText: false,
                    textFieldHintText: profileTextField[index]['hintText'],
                    textFieldErrorText: index == 0
                        ? firstNameErrorText
                        : index == 1
                            ? lastNameErrorText
                            : index == 2
                                ? emailErrorText
                                : index == 3
                                    ? identityNumberErrorText
                                    : phoneNumberErrorText,
                    textFieldOnChanged: (value) {
                      setState(() {
                        if (index == 0) {
                          firstNameErrorText = '';
                        } else if (index == 1) {
                          lastNameErrorText = '';
                        } else if (index == 2) {
                          emailErrorText = '';
                        } else if (index == 3) {
                          identityNumberErrorText = '';
                        } else if (index == 4) {
                          phoneNumberErrorText = '';
                        }
                      });
                    }),
              )),
    );
  }

  Stack _buildCardProfile(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.225,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    'lib/assets/images/card_image.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 28,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: white0,
                      borderRadius: BorderRadius.circular(80),
                      image: const DecorationImage(
                        image: AssetImage(
                          'lib/assets/images/profile_image.png',
                        ),
                        fit: BoxFit.cover,
                      ),
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
                            textStyle: heading4.copyWith(color: white0),
                          ),
                          customText(
                            textValue: 'Adi',
                            textStyle: body2.copyWith(color: white0),
                          ),
                        ],
                      ),
                      customText(
                        textValue: 'Membership BBLK',
                        textStyle: subHeading4.copyWith(
                          color: white0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A3E78),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Center(
                  child: customText(
                    textValue:
                        'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
                    textStyle: body4.copyWith(color: white0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
