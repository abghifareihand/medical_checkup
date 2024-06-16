import 'package:flutter/material.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/data/datasources/auth_local_datasource.dart';
import 'package:medical_checkup/presentation/auth/pages/login_page.dart';
import 'package:medical_checkup/presentation/pasien/pages/dashboard_pasien_page.dart';
import 'package:medical_checkup/presentation/petugas/pages/dashboard_petugas_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _checkLoginStatus();
    super.initState();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isLoggedIn = await AuthLocalDatasource().isLogin();
    if (isLoggedIn) {
      String role = await AuthLocalDatasource().getRole();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => role == 'pasien'
              ? const DashboardPasienPage()
              : const DashboardPetugasPage(),
        ),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MEDICAL CHECKUP',
              style: AppFont.blackText.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              'Melayani Anda dengan Sepenuh Hati',
              style: AppFont.blackText.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
