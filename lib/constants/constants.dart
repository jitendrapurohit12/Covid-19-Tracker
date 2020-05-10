import 'package:covid_19/helper/numeric_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

//Images
const kBasePath = 'assets/images';
const kImageFrame = '$kBasePath/Frame.svg';
const kImageHome = '$kBasePath/home.svg';
const kImageInfo = '$kBasePath/info.svg';
const kImageMenu = '$kBasePath/menu.svg';
const kImageMessage = '$kBasePath/message.svg';
const kImageNewspaper = '$kBasePath/newspaper.svg';
const kImageNotification = '$kBasePath/notification.svg';
const kImagePhone = '$kBasePath/phone.svg';
const kImagePrecaution1 = '$kBasePath/precaution_1.svg';
const kImagePrecaution2 = '$kBasePath/precaution_2.svg';
const kImagePrecaution3 = '$kBasePath/precaution_3.svg';
const kImageStats = '$kBasePath/stats.svg';

//Color
const kColorPrimary = Color(0xFF473F97);
const kColorRed = Color(0xFFE54554);
const kColorBlue = Color(0xFF4D78FC);
const kColorCardAmber = Color(0xFFF3B157);
const kColorCardRed = Color(0xFFE65355);
const kColorCardGreen = Color(0xFF7ADA7C);
const kColorCardBlue = Color(0xFF4DB4FB);
const kColorCardPurple = Color(0xFF9570FD);

//Gradients
const kFrameGradient =
    LinearGradient(colors: [Color(0xFFAEA1E6), Color(0xFF56549E)]);

//String constants
const kCovid19 = 'Covid-19';
const kFeelingSick = 'Are you feeling sick?';
const kFeelingSickDesc =
    'If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.';
const kCallNow = 'Call Now';
const kMessage = 'Send SMS';
const kPrevention = 'Prevention';
const kPrecaution1 = 'Avoid close\ncontact';
const kPrecaution2 = 'Clean your\nhands often';
const kPrecaution3 = 'Wear a\nfacemask';
const kDoYourTest = 'Do your own test!';
const kDoYourTestInstrucitons = 'Follow the instructions to do your own test.';
const kStatistics = 'Statistics';
const kSelectCountry = 'Select Country';
const kMyCountry = 'My Country';
const kGlobal = 'Global';
const kAffected = 'Affected';
const kDeath = 'Death';
const kRecovered = 'Recovered';
const kActive = 'Active';
const kSerious = 'Serious';
const kTotal = 'Total';
const kToday = 'Today';
const kYesterday = 'Yesterday';
const kDailayCases = 'Daily New Cases';
const kRetry = 'Retry';
const kNullCountryError = 'Please select a country to continue!';
const kInvalidOptionError =
    'This option is not available. Sorry!! Please select another one.';

//Date time formats
DateFormat format = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');
DateFormat monthDayFormat = DateFormat('mm dd');

// Formaters
List<TextInputFormatter> commaSeperatedIntFormatter = [
  WhitelistingTextInputFormatter.digitsOnly,
  NumericTextFormatter(),
];
