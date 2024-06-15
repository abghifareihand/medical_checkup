import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_checkup/core/components/custom_alert_delete.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/datasources/notification_service.dart';

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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('remindersKeluhan')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final reminders = snapshot.data!.docs;

          if (reminders.isEmpty) {
            return const Center(
              child: Text('Belum ada data reminder'),
            );
          }
          return ListView.builder(
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              final isActive = reminder['isActive'] ?? false;
              return ListTile(
                title: Text(
                  reminder['title'],
                  style: AppFont.blackText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                subtitle: Text(
                  formatTimestamp(reminder['scheduledDate']),
                  style: AppFont.greyText.copyWith(
                    fontWeight: light,
                  ),
                ),
                trailing: isActive
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                onTap: () {
                  if (!isActive) {
                    _activateReminderKeluhan(context, reminder);
                  }
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDelete(
                        title: 'Hapus Reminder Keluhan',
                        message: 'Anda yakin ingin menghapus reminder ini?',
                        onPressed: () async {
                          Navigator.pop(context);
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('remindersKeluhan')
                              .doc(reminder.id)
                              .delete();
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}

class CheckupReminderPage extends StatelessWidget {
  const CheckupReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('remindersCheckup')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final reminders = snapshot.data!.docs;

          if (reminders.isEmpty) {
            return const Center(
              child: Text('Belum ada data reminder'),
            );
          }
          return ListView.builder(
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              final isActive = reminder['isActive'] ?? false;
              return ListTile(
                title: Text(
                  reminder['title'],
                  style: AppFont.blackText.copyWith(
                    fontWeight: medium,
                  ),
                ),
                subtitle: Text(
                  formatTimestamp(reminder['scheduledDate']),
                  style: AppFont.greyText.copyWith(
                    fontWeight: light,
                  ),
                ),
                trailing: isActive
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                onTap: () {
                  if (!isActive) {
                    _activateReminderCheckup(context, reminder);
                  }
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDelete(
                        title: 'Hapus Reminder Checkup',
                        message: 'Anda yakin ingin menghapus reminder ini?',
                        onPressed: () async {
                          Navigator.pop(context);
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('remindersCheckup')
                              .doc(reminder.id)
                              .delete();
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}


void _activateReminderKeluhan(
    BuildContext context, DocumentSnapshot reminder) async {
  String title = reminder['title'];
  DateTime scheduledDate = (reminder['scheduledDate'] as Timestamp).toDate();

  // Aktifkan notifikasi dengan waktu yang sudah ada di Firestore
  NotificationService.addScheduleNotifications(
    title: 'Medical App',
    body: title,
    scheduledDate: scheduledDate,
  );

  // Update nilai isActive menjadi true di Firestore
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('remindersKeluhan')
      .doc(reminder.id)
      .update({'isActive': true});

  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Reminder keluhan aktif'),
      backgroundColor: Colors.green,
    ),
  );
}

void _activateReminderCheckup(
    BuildContext context, DocumentSnapshot reminder) async {
  String title = reminder['title'];
  DateTime scheduledDate = (reminder['scheduledDate'] as Timestamp).toDate();

  // Aktifkan notifikasi dengan waktu yang sudah ada di Firestore
  NotificationService.addScheduleNotifications(
    title: 'Medical App',
    body: title,
    scheduledDate: scheduledDate,
  );

  // Update nilai isActive menjadi true di Firestore
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('remindersCheckup')
      .doc(reminder.id)
      .update({'isActive': true});

  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Reminder checkup aktif'),
      backgroundColor: Colors.green,
    ),
  );
}
