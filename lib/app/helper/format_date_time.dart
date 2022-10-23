import 'package:intl/intl.dart';

String formatDateTime(String? value, {bool hastime = true}) {
  if (value == null || value.isEmpty) {
    return '';
  }
  final parsed = DateTime.tryParse(value);
  return parsed == null
      ? ''
      : hastime
          ? DateFormat.yMEd().add_jms().format(parsed)
          : DateFormat.yMEd().format(parsed);
}
