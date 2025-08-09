import 'package:expenzes_trng/services/user_services.dart';
import 'package:expenzes_trng/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.checkUserName(),
      builder: (context, snapshot) {
        // If the snapshot is still waiting

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          // here the hasUserName  will be set to true of the data is there in the snapshot and
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Expenzes',
            theme: ThemeData(fontFamily: "inter"),
            home: Wrapper(showMainScreen: hasUserName),
            // Navigate to the main screen if user data exists
          );
        }
      },
    );
  }
}
