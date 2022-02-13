import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// import 'package:image_picker/image_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';

bool isSuccessfulHttp(Response response) {
  return isSuccessfulStatusCode(response.statusCode);
}

void unFocus(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  currentFocus.unfocus();
}

// Future<XFile> getImageFromGallery() async {
//   final ImagePicker picker = ImagePicker();
//   return picker.pickImage(source: ImageSource.gallery, maxWidth: 1000, maxHeight: 1000);
// }

bool isWebPlatform() => kIsWeb;

bool isSuccessfulStatusCode(int statusCode) {
  return statusCode >= 200 && statusCode <= 300;
}

Future<bool> isInternetEnable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
}

String convertTextToHtmlText(String plainText) {
  return "<div dir=\"rtl\">$plainText&nbsp;</div> ".replaceAll("\n", "</br>");
}

bool isTextHtml(String text) {
  return text.startsWith("<");
}

String persianToLowerCase(String input) {
  String output = input.replaceAll("آ", "ا");
  return output;
}

String convertJsonItemToString(Map<String, dynamic> json, String key, {String defaultValue = ""}) {
  return convertDynamicToString(json[key]);
}

String convertDynamicToString(dynamic item, {String defaultValue = ""}) {
  try {
    return (item ?? defaultValue).toString().trim();
  } on Exception {
    return defaultValue;
  }
}

int convertDynamicToInt(dynamic item, {int defaultValue = 0}) {
  return int.parse(convertDynamicToString(item, defaultValue: defaultValue.toString()));
}

bool convertDynamicToBool(dynamic item, {bool defaultValue = false}) {
  final output = convertDynamicToString(item, defaultValue: defaultValue.toString());
  return output == "1" || output == "true";
}

bool isUrlValid(String url) {
  try {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  } on Exception {
    return false;
  }
}

String persianToUpperCase(String input) {
  String output = input.replaceAll("ا", "آ");
  return output;
}

String convertSecondToTimeFormat(int seconds) {
  var d = Duration(days: 0, hours: 0, minutes: 0, seconds: seconds, microseconds: 0);
  String fullTime = d.toString().split('.').first.padLeft(8, "0");
  if (d.inHours > 0) {
    return fullTime;
  } else {
    return fullTime.substring(3);
  }
}

String _dateSplitter = "/";

String convertJalaliToString(Jalali input) {
  final inputFormatter = input.formatter;
  return "${inputFormatter.yyyy}$_dateSplitter${inputFormatter.mm}$_dateSplitter${inputFormatter.dd}";
}

Jalali convertStringToJalali(String input) {
  String splitter = input.contains("-") ? "-" : "/";
  return Jalali(int.parse(input.split(splitter)[0]), int.parse(input.split(splitter)[1]), int.parse(input.split(splitter)[2]));
}

String convertGregorianToString(Gregorian input) {
  final inputFormatter = input.formatter;
  return "$inputFormatter.yyyy$_dateSplitter$inputFormatter.mm$_dateSplitter${inputFormatter.dd}";
}

Gregorian convertStringToGregorian(String input) {
  String splitter = input.contains("-") ? "-" : "/";
  return Gregorian(int.parse(input.split(splitter)[0]), int.parse(input.split(splitter)[1]), int.parse(input.split(splitter)[2]));
}

Gregorian convertJalaliToGregorian(Jalali input) {
  return Gregorian.fromJalali(input);
}

Jalali convertGregorianToJalali(Gregorian input) {
  return Jalali.fromGregorian(input);
}

int _lastTimerCall = 0;

void timerAction({@required Function startAction, @required Function endAction, @required int milliSecondWait, int rightNow}) async {
  int localRightNow = rightNow ?? DateTime.now().millisecondsSinceEpoch;
  _lastTimerCall = localRightNow;
  startAction();
  await Future.delayed(Duration(milliseconds: milliSecondWait), () => "1");
  if (localRightNow == _lastTimerCall) endAction();
}

int numberOfMinutesInTimeOfDay(TimeOfDay timeOfDay) {
  return timeOfDay.hour * 60 + timeOfDay.minute;
}

Future<String> getDeviceName() async {
  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (isWebPlatform()) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.userAgent;
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return "${androidInfo.model} (${androidInfo.version.sdkInt})";
    }
  } on Exception {
    return "can not get device name";
  }
}

String getPhoneNumber(String phoneNumber) {
  if (phoneNumber.length < 10) return null;
  if (phoneNumber.length == 10) return phoneNumber;
  if (phoneNumber.length == 11 && phoneNumber.startsWith("0")) return phoneNumber.substring(1);
  if (phoneNumber.length == 12 && phoneNumber.startsWith("98")) return phoneNumber.substring(2);
  if (phoneNumber.length == 13 && phoneNumber.startsWith("+98")) return phoneNumber.substring(3);
  if (phoneNumber.length == 14 && phoneNumber.startsWith("+980")) return phoneNumber.substring(4);
  return null;
}
