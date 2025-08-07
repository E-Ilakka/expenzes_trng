import 'package:expenzes_trng/models/onboarding_model.dart';

class OnboardingData {
  static final List<OnboardingModel> onboardingDataList = [
    OnboardingModel(
      title: "Gain total control of your money",
      description: "Become your own money manager and make every cent count",
      imagepath: "assets/images/onboard_1.png",
    ),
    OnboardingModel(
      title: "Know where your money goes",
      description:
          "Track your transaction easily, with categories and financial report ",
      imagepath: "assets/images/onboard_2.png",
    ),
    OnboardingModel(
      title: "Planning ahead",
      description: "Setup your budget for each categor so you in control",
      imagepath: "assets/images/onboard_3.png",
    ),
  ];
}
