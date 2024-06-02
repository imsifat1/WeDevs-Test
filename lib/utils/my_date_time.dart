import 'package:intl/intl.dart';
import '../main.dart';

class MyDateTime {

  static final DateFormat _formatter = DateFormat('dd-MM-yyyy hh:mm a');
  static final DateFormat _timeFormatter = DateFormat('hh:mm a');
  static final DateFormat _twentyFourHourFormatter = DateFormat('HH:mm');
  static final DateFormat _yearMonthDay = DateFormat('yyyy-MM-dd');
  static final DateFormat _dayMonthYear = DateFormat('dd-MM-yyyy');
  static final DateFormat _dateTimeFormatter = DateFormat('d MMMM, y  hh:mm a');
  static final DateFormat _dateFormatter = DateFormat('MMMM d, y');
  static final DateFormat _monthFormatter = DateFormat('MMMM  yyyy');
  static final DateFormat _estimateFormatter = DateFormat('EEEE, dd LLL');
  static final DateFormat _localeFormatter = DateFormat('dd-MM-yyyy', MyApp.appLocale!.languageCode);
  static final DateFormat _homeDateFormatter = DateFormat('MMMM dd, yyyy');

  static String getDate(DateTime dateTime) {
    return _formatter.format(dateTime);
  }

  static String getTime(DateTime dateTime) {
    return _timeFormatter.format(dateTime);
  }

  static String getTimeIn24HourFormat(DateTime dateTime) {
    return _twentyFourHourFormatter.format(dateTime);
  }

  static String getDatabaseFormat(DateTime dateTime) {
    return _yearMonthDay.format(dateTime);
  }

  static String getUserFormat(DateTime dateTime) {
    return _dayMonthYear.format(dateTime);
  }

  static String getDateTime(DateTime dateTime) {
    return _dateTimeFormatter.format(dateTime);
  }

  static String getLocaleDate(DateTime dateTime) {
    return _localeFormatter.format(dateTime);
  }

  static String getMonthData(DateTime dateTime) {
    return _dateFormatter.format(dateTime);
  }

  static String getCalenderMonthData(DateTime dateTime) {
    return _monthFormatter.format(dateTime);
  }

  static String getReviewDate(DateTime dateTime) {

    var suffix = "th";
    var digit = dateTime.day % 10;

    if((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {

      suffix = ["st", "nd", "rd"][digit - 1];
    }

    DateFormat estimateFormatter = DateFormat("dd'$suffix' LLL, yyyy");

    return estimateFormatter.format(dateTime);
  }

  static String getTimeWithDateName(DateTime dateTime) {

    var suffix = "th";
    var digit = dateTime.day % 10;

    if((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }

    DateFormat estimateFormatter = DateFormat("EEEE, dd'$suffix' LLL, yyyy");

    return estimateFormatter.format(dateTime);
  }

  static String getEstimatedDate(DateTime dateTime) {

    dateTime = dateTime.add(const Duration(days: 6));

    var suffix = "th";
    var digit = dateTime.day % 10;

    if((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {

      suffix = ["st", "nd", "rd"][digit - 1];
    }

    DateFormat estimateFormatter = DateFormat("EEEE, dd'$suffix' LLL");

    return estimateFormatter.format(dateTime);
  }

  static String getOrderDate(DateTime dateTime) {

    var suffix = "th";
    var digit = dateTime.day % 10;

    if((digit > 0 && digit < 4) && (dateTime.day < 11 || dateTime.day > 13)) {

      suffix = ["st", "nd", "rd"][digit - 1];
    }

    DateFormat formatter = DateFormat("dd'$suffix' MMMM, yyyy");

    return formatter.format(dateTime);
  }

  static String getHomeDate(DateTime dateTime) {
    return _homeDateFormatter.format(dateTime);
  }
}