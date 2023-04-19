import 'package:flutter/material.dart';

class ROOT {
  // static setLanguage(String language) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString('lang', language);
  // }

  // static getLanguage() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   ROOT.language = sharedPreferences.getString('lang') ?? ROOT.languageEnglish;
  //   log("LANGUAGE: $language");
  //   changeLanguage(language);
  // }

  static String language = languageEnglish;
  static const String languageBangla = 'bangla';
  static const String languageEnglish = 'english';

  static const IconData logo = (Icons.water_drop_outlined);

  // Root address [Firebase & SharedPreference]:
  static const String firebaseRoot = '';
  static const String sharedpreferenceRoot = 'bloodline';

  // Basic App Elements:
  static const String institutionLogoAddress = 'assets/images/logo.png';
  static const String institutionName = '';
  static const String institutionAbbreviation = 'BLOOD APP';
  static const String institutionMoto = '';
  static const String institutionAddress = '';
  static const String institutionEstablishmedDate = 'Est. 2023';
  static const String institutionEstablishmedEINN = '';
  static const String institutionEmail = '';

  // Notice Subscriber:
  static const String defaultNoticeSubscriber = 'BLODD_LINE_ALL';
  // Notification Subscription Topic:
  static const String defaultNotificationSubscriber = defaultNoticeSubscriber;

  // Feedback Email:
  static const String feedBackMail = 'akaomarfahim@gmail.com';
  static const String feedBackMailSubject = 'Feedback on BLOOD Application';

  // Date
  static const String dateFormat = "dd-MMM-yyyy";
}

class FirebaseDataRoot {
  // home
  static const String photoSlider = 'home/slider';

  // [Firebase]: Data - realtime address
  static const String home = 'home/glance/0';
  static const String firebaseChairmanDataRoot = 'home/chairman/0';
  static const String firebasePrincipalDataRoot = 'home/principal/0';

  // Storage:
  static const String firebaseLeadersPhotoRoot = 'home/';
  static const String firebaseSliderPhotoRoot = 'home/photo_slider';
  static const String newsPhotoRoot = 'news';
  static const String eventsPhotoRoot = 'events';

  static const String chairmanDesignation = 'VICE-CHANCELLOR';
  static const String principalDesignation = 'PRINCIPAL';
  static const String glancePhoto = 'glance';

  static const String imageErrorLink = 'https://firebasestorage.googleapis.com/v0/b/bloodline-9b527.appspot.com/o/error.png?alt=media&token=a56d1c64-b2d8-4556-a1a2-c22c3426c79a';
}

changeLanguage(String language) {
  if (language == ROOT.languageBangla) {
    ROOTTEXT.home = 'সাইন ইন';
    ROOTTEXT.signIn = 'সাইন ইন';
    ROOTTEXT.signOut = 'সাইন আউট';

    // home
    ROOTTEXT.menu = 'মেনু';
    ROOTTEXT.latestBloodRequest = 'সাম্প্রতিক রক্তের অনুরোধ';
    ROOTTEXT.stillSearchingForBlood = 'এখনো রক্ত খোজা হচ্ছে।';
  }
}

class ROOTTEXT {
  static String home = 'home';
  static String signIn = 'sign In';
  static String signOut = 'sign Out';

  // home

  static String menu = 'Menu';
  static String latestBloodRequest = 'Latest Blood Request';
  static String stillSearchingForBlood = 'Still searching for blood.';
}
