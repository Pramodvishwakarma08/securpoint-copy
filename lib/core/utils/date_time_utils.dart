import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}


String formatToMonthYear(DateTime dateTime) {
  final DateFormat formatter = DateFormat('MMMM yyyy');
  return formatter.format(dateTime);
}

// String formatToDayMonthTime(DateTime dateTime) {
//   final DateFormat formatter = DateFormat('dd MMM AT HH:mm');
//   return formatter.format(dateTime);
// }
String formatToDayMonthTime(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('dd MMM yyyy \'AT\' HH:mm');
  // Format the date
  String formattedDate = dateFormat.format(dateTime);
  // Split the formatted date into parts
  List<String> parts = formattedDate.split(' ');
  // Convert the month part to uppercase
  parts[1] = parts[1].toUpperCase();
  // Join the parts back into a single string
  return parts.join(' ');
}