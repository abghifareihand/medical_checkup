import 'package:flutter/material.dart';
import 'package:medical_checkup/core/constants/app_color.dart';

import '../../../core/constants/app_font.dart';

class ReminderPasienPage extends StatelessWidget {
  const ReminderPasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 2,
          title: const Text('Reminder Pasien'),
          bottom: TabBar(
            indicatorColor: AppColor.white,
            indicatorWeight: 3.5,
            labelColor: AppColor.white,
            labelStyle: AppFont.whiteText.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
            unselectedLabelColor: AppColor.white.withOpacity(0.4),
            tabs: const [
              Tab(text: 'Keluhan'),
              Tab(text: 'Checkup'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            KeluhanReminderPage(),
            CheckupReminderPage(),
          ],
        ),
      ),
    );
  }
}

class KeluhanReminderPage extends StatelessWidget {
  const KeluhanReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Konten Keluhan',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CheckupReminderPage extends StatelessWidget {
  const CheckupReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Konten Checkup',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
