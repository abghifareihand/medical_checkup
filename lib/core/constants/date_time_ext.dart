// Ekstensi DateTimeExt
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toFormattedDate() {
    const List<String> monthNames = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    const List<String> dayNames = [
      'Minggu',
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu'
    ];

    String dayName = dayNames[weekday % 7];
    String day = this.day.toString();
    String month = monthNames[this.month - 1];
    String year = this.year.toString();

    return '$dayName, $day $month $year';
  }
}


extension TimeOfDayExt on TimeOfDay {
  String toFormattedTime() {
    final DateTime now = DateTime(2000, 1, 1, hour, minute);
    return DateFormat.jm().format(now); // Menggunakan DateFormat dari intl package
  }
}

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate(); // Ubah Timestamp menjadi DateTime

  String formattedDate = dateTime.toFormattedDate();
  String formattedTime = DateFormat.Hm().format(dateTime);

  return '$formattedDate $formattedTime';
}


String formatRekamMedis(String patientId) {
  int hashCode = patientId.hashCode;
  String rmNumber = 'RM-${hashCode.abs()}'; // abs() untuk memastikan positif
  return rmNumber;
}

String formatDecimal(double value) {
  String result = value.toString();
  
  // Menghapus desimal jika nilainya nol
  if (value % 1 == 0) {
    result = value.toInt().toString(); // Ubah ke integer dan kemudian ke string
  }
  
  return result;
}
