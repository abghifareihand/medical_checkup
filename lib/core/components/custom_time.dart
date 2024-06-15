import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_font.dart';

class CustomTime extends StatefulWidget {
  final String label;
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay?> onTimeChanged;

  const CustomTime({
    super.key,
    required this.label,
    this.initialTime,
    required this.onTimeChanged,
  });

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  late TimeOfDay? _selectedTime; // Ubah tipe data menjadi DateTime nullable

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime; // Menggunakan widget.initialDate
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedTime ?? DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //     });
  //     widget.onDateChanged(picked);
  //   }
  // }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onTimeChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppFont.blackText.copyWith(
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: () => _selectedTime,
            child: InputDecorator(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColor.primary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14.0,
                  horizontal: 12.0,
                ),
                suffixIcon: InkWell(
                  onTap: () => _selectTime(context),
                  child: const Icon(
                    Icons.alarm,
                    color: AppColor.primary, // Warna ikon kalender
                  ),
                ),
              ),
              child: Text(
                '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                style: AppFont.blackText.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
