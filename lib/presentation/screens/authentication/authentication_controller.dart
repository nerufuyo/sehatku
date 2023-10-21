import 'package:flutter/material.dart';

void emailValidation({
  required TextEditingController emailController,
  required Function(String) setEmailErrorText,
}) {
  if (emailController.text.isEmpty) {
    setEmailErrorText('Email tidak boleh kosong');
  } else if (!emailController.text.contains('@')) {
    setEmailErrorText('Email tidak valid');
  } else {
    setEmailErrorText('');
  }
}

void passwordValidation({
  required TextEditingController passwordController,
  required Function(String) setPasswordErrorText,
}) {
  if (passwordController.text.isEmpty) {
    setPasswordErrorText('Password tidak boleh kosong');
  } else if (passwordController.text.length < 8) {
    setPasswordErrorText('Password minimal 8 karakter');
  } else {
    setPasswordErrorText('');
  }
}

void firstNameValidation({
  required TextEditingController firstNameController,
  required Function(String) setFirstNameErrorText,
}) {
  if (firstNameController.text.isEmpty) {
    setFirstNameErrorText('Nama depan tidak boleh kosong');
  } else {
    setFirstNameErrorText('');
  }
}

void lastNameValidation({
  required TextEditingController lastNameController,
  required Function(String) setLastNameErrorText,
}) {
  if (lastNameController.text.isEmpty) {
    setLastNameErrorText('Nama belakang tidak boleh kosong');
  } else {
    setLastNameErrorText('');
  }
}

void phoneNumberValidation({
  required TextEditingController phoneNumberController,
  required Function(String) setPhoneNumberErrorText,
}) {
  if (phoneNumberController.text.isEmpty) {
    setPhoneNumberErrorText('Nomor telepon tidak boleh kosong');
  } else if (phoneNumberController.text.length < 10) {
    setPhoneNumberErrorText('Nomor telepon minimal 10 karakter');
  } else {
    setPhoneNumberErrorText('');
  }
}

void confirmPasswordValidation({
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required Function(String) setConfirmPasswordErrorText,
}) {
  if (confirmPasswordController.text.isEmpty) {
    setConfirmPasswordErrorText('Konfirmasi password tidak boleh kosong');
  } else if (confirmPasswordController.text != passwordController.text) {
    setConfirmPasswordErrorText('Konfirmasi password tidak sama');
  } else {
    setConfirmPasswordErrorText('');
  }
}

void identityNumberValidation({
  required TextEditingController identityNumberController,
  required Function(String) setIdentityNumberErrorText,
}) {
  if (identityNumberController.text.isEmpty) {
    setIdentityNumberErrorText('Nomor KTP tidak boleh kosong');
  } else if (identityNumberController.text.length < 16) {
    setIdentityNumberErrorText('Nomor KTP minimal 16 karakter');
  } else {
    setIdentityNumberErrorText('');
  }
}
