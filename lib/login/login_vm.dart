import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../network/api_client.dart';

class LoginViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final apiClient = ApiClient();
  bool obsecureText = true;
  String username = '';
  String password = '';
  String responseMessage = '';
  onObsecure() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

  onUserNameSaved(String? value) {
    username = value!.trim();
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'UserName is required';
    }
    return null;
  }

  onPasswordSaved(String? value) {
    password = value!.trim();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  Future<bool> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // final request = {'username': username, 'password': password};

      try {
        setBusy(true);
        final loginResponse = await apiClient.login(username, password);
        print('Login Response: ${loginResponse.data}');

        setBusy(false);
        return true;
      } catch (error) {
        setBusy(false);
        responseMessage = 'username or password is incorrect';
        print('Error: $error');
        return false;
      }
    }
    return false;
  }

  Future<void> showSnackbar(BuildContext context, String msg) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
