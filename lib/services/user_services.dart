// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // method to store the user name and user email in shared preferences
  static Future<void> storeUserDetails({
    required String userName,
    required String userEmail,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // chereck whether the user entered password and the confirm password are the same
      if (password != confirmPassword) {
        // show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("password and confirm password do not match")),
        );
        return;
      }
      // if the passwords match, save the user details
      // create an instance from shared preferences

      SharedPreferences preps = await SharedPreferences.getInstance();

      // store the user name and email as key value pairs
      await preps.setString("username", userName);
      await preps.setString("email", userEmail);

      // shoe a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User details stored successfully")),
      );
    } catch (err) {
      err.toString();
    }
  }

  // method to get the user name from shared preferences
  static Future<bool> checkUserName() async {
    SharedPreferences preps = await SharedPreferences.getInstance();
    // check if the user name is stored in shared preferences
    String? userName = preps.getString("username");
    // if the user name is not null, return true
    return userName != null;
  }
}
