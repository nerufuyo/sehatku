import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatku/common/constant.dart';
import 'package:sehatku/presentation/bloc/user/user_bloc.dart';
import 'package:sehatku/presentation/screens/authentication/authentication_controller.dart';
import 'package:sehatku/presentation/screens/home/home_screen.dart';
import 'package:sehatku/presentation/style/pallet.dart';
import 'package:sehatku/presentation/style/typography.dart';
import 'package:sehatku/presentation/widgets/basic_components.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const routeName = '/login';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final PageController pageController = PageController();
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
  bool isPasswordObscure = true;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white0,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 20,
          ),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildGreetingsText(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: pageIndex == 0
                    ? MediaQuery.of(context).size.height * 0.425
                    : MediaQuery.of(context).size.height * 0.85,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) => setState(() => pageIndex = value),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          index == 0 ? _buildLoginForm() : _buildRegisterForm(),
                          customVerticalSpace(height: 8),
                          customButtonwithIcon(
                            buttonWidth: MediaQuery.of(context).size.width,
                            buttonTitle: index == 0 ? 'Login' : 'Daftar',
                            buttonOnTapped: () {
                              switch (index) {
                                case 0:
                                  BlocProvider.of<UserBloc>(context)
                                      .add(PostUserEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ));
                                  Navigator.pushNamed(
                                      context, HomeScreen.routeName);
                                  break;
                                case 1:
                                  null;
                                  break;
                              }
                            },
                            buttonIcon: Icons.arrow_forward,
                          ),
                          customVerticalSpace(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customText(
                                textValue: index == 0
                                    ? 'Belum punya akun? '
                                    : 'Sudah punya akun? ',
                                textStyle: body3.copyWith(color: tertiary),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    index == 0
                                        ? pageController.animateToPage(1,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeIn)
                                        : pageController.animateToPage(0,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeIn);
                                  });
                                },
                                child: customText(
                                  textValue: index == 0
                                      ? 'Daftar sekarang'
                                      : 'Login sekarang',
                                  textStyle: body3.copyWith(color: primary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              customText(
                textValue: '©️ SILK. all right reserved.',
                textStyle: body4.copyWith(color: white20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Visibility _buildGreetingsText() {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  text: 'Hai, ',
                  style: subHeading1.copyWith(color: primary, fontSize: 28),
                  children: [
                    TextSpan(
                      text: 'Selamat Datang',
                      style: heading1.copyWith(color: primary),
                    ),
                  ],
                ),
              ),
            ),
          ),
          customVerticalSpace(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: customText(
              textValue: 'Silahkan login untuk melanjutkan',
              textStyle: subBody3.copyWith(color: tertiary),
            ),
          ),
          customVerticalSpace(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset('lib/assets/images/login_image.png'),
          ),
        ],
      ),
    );
  }

  Column _buildLoginForm() {
    return Column(
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: customTextField(
            textFieldWidth: MediaQuery.of(context).size.width,
            isTextButton: index == 0 ? false : true,
            isSuffixIcon: index == 0 ? false : true,
            textFieldSuffixIcon: IconButton(
              onPressed: () {
                setState(() => isPasswordObscure = !isPasswordObscure);
              },
              icon: Icon(
                isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                color: primary,
              ),
            ),
            textFieldTitle: loginTextField[index]['label'],
            textFieldController:
                index == 0 ? emailController : passwordController,
            textFieldObscureText: index == 0 ? false : isPasswordObscure,
            textFieldHintText: loginTextField[index]['hintText'],
            textFieldErrorText: index == 0 ? emailErrorText : passwordErrorText,
            textFieldOnChanged: (value) {
              setState(() {
                switch (index) {
                  case 0:
                    emailValidation(
                        emailController: emailController,
                        setEmailErrorText: (value) => emailErrorText = value);
                    break;
                  case 1:
                    passwordValidation(
                        passwordController: passwordController,
                        setPasswordErrorText: (value) =>
                            passwordErrorText = value);
                    break;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  Column _buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            2,
            (index) => customTextField(
              textFieldWidth: MediaQuery.of(context).size.width * 0.44,
              textFieldTitle: registerTextField[index]['label'],
              textFieldController:
                  index == 0 ? firstNameController : lastNameController,
              textFieldObscureText: false,
              textFieldHintText: registerTextField[index]['hintText'],
              textFieldErrorText:
                  index == 0 ? firstNameErrorText : lastNameErrorText,
              textFieldOnChanged: (value) {
                setState(() {
                  switch (index) {
                    case 0:
                      firstNameValidation(
                          firstNameController: firstNameController,
                          setFirstNameErrorText: (value) =>
                              firstNameErrorText = value);
                      break;
                    case 1:
                      lastNameValidation(
                          lastNameController: lastNameController,
                          setLastNameErrorText: (value) =>
                              lastNameErrorText = value);
                      break;
                  }
                });
              },
            ),
          ),
        ),
        customVerticalSpace(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: customTextField(
                  textFieldWidth: MediaQuery.of(context).size.width,
                  textFieldTitle: registerTextField[index + 2]['label'],
                  textFieldController: index == 0
                      ? phoneNumberController
                      : index == 1
                          ? identityNumberController
                          : index == 2
                              ? emailController
                              : index == 3
                                  ? passwordController
                                  : passwordConfirmationController,
                  textFieldObscureText: index == 3 ? isPasswordObscure : false,
                  textFieldHintText: registerTextField[index + 2]['hintText'],
                  textFieldErrorText: index == 0
                      ? phoneNumberErrorText
                      : index == 1
                          ? identityNumberErrorText
                          : index == 2
                              ? emailErrorText
                              : index == 3
                                  ? passwordErrorText
                                  : passwordConfirmationErrorText,
                  textFieldOnChanged: (value) {
                    setState(() {
                      switch (index) {
                        case 0:
                          phoneNumberValidation(
                              phoneNumberController: phoneNumberController,
                              setPhoneNumberErrorText: (value) =>
                                  phoneNumberErrorText = value);
                          break;
                        case 1:
                          identityNumberValidation(
                              identityNumberController:
                                  identityNumberController,
                              setIdentityNumberErrorText: (value) =>
                                  identityNumberErrorText = value);
                          break;
                        case 2:
                          emailValidation(
                              emailController: emailController,
                              setEmailErrorText: (value) =>
                                  emailErrorText = value);
                          break;
                        case 3:
                          passwordValidation(
                              passwordController: passwordController,
                              setPasswordErrorText: (value) =>
                                  passwordErrorText = value);
                          break;
                        case 4:
                          confirmPasswordValidation(
                              passwordController: passwordController,
                              confirmPasswordController:
                                  passwordConfirmationController,
                              setConfirmPasswordErrorText: (value) =>
                                  passwordConfirmationErrorText = value);
                          break;
                      }
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
