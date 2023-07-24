import 'package:cloud_firestore/cloud_firestore.dart';

int toJsonDateTime(DateTime dateTime) => dateTime.millisecondsSinceEpoch;
DateTime fromJsonDateTime(int millisecondsSinceEpoch) =>
    DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch).toLocal();

int? toJsonDateTimeNullable(DateTime? dateTime) =>
    dateTime?.millisecondsSinceEpoch;
DateTime? fromJsonDateTimeNullable(int? millisecondsSinceEpoch) =>
    millisecondsSinceEpoch != null
        ? DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch).toLocal()
        : null;

///returns timestamp value from a date, nullable
Timestamp? toJsonTimestampDateNullable(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return Timestamp.fromDate(dateTime);
}

///returns date value from a timestamp, nullable
DateTime? fromJsonTimestampDateNullable(Timestamp? timestamp) {
  if (timestamp == null) {
    return null;
  }
  return timestamp.toDate();
}

// MessageEnum? fromJsonMessageEnum(String enumString) =>
//     enumString.isEmpty ? MessageEnum.text : enumString.toEnum();
