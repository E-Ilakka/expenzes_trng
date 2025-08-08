import 'package:expenzes_trng/screens/main_screen.dart';
import 'package:expenzes_trng/services/user_services.dart';
import 'package:expenzes_trng/utils/colors.dart';
import 'package:expenzes_trng/utils/constants.dart';
import 'package:expenzes_trng/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _rememberMe = false;

  // form key for validation
  final _formKey = GlobalKey<FormState>();

  // controller for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your \npersonal data",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
                //form fields for uder data
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form field for the user name
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          // check wether the user has enterd a valid name
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 20),
                      //form field for the user name
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          // check wether the user has enterd a valid email
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 20),
                      //form field for the user name
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          // check wether the user has enterd a valid name
                          if (value!.isEmpty) {
                            return "Please enter a valid password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 20),
                      //form field for the user name
                      TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        validator: (value) {
                          // check wether the user has enterd a valid name
                          if (value!.isEmpty) {
                            return "Please enter the same password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(height: 30),
                      //remember me checkbox
                      Row(
                        children: [
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            String userName = _nameController.text;
                            String userEmail = _emailController.text;
                            String userPassword = _passwordController.text;
                            String userConfirmPassword =
                                _confirmPasswordController.text;
                            // save the user name and emauil in the device storage
                            await UserServices().storeUserDetails(
                              userName: userName,
                              userEmail: userEmail,
                              password: userPassword,
                              confirmPassword: userConfirmPassword,
                              context: context,
                            );
                            // navigate to the main screen
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const MainScreen();
                                  },
                                ),
                              );
                            }
                          }
                        },
                        child: CustomButton(
                          buttonName: "Next",
                          buttonColor: kMainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
