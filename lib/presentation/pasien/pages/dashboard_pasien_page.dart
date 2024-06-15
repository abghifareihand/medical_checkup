import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/presentation/auth/bloc/user/user_bloc.dart';
import 'package:medical_checkup/presentation/pasien/bloc/get_checkup_pasien/get_checkup_pasien_bloc.dart';
import 'package:medical_checkup/presentation/pasien/bloc/get_keluhan_pasien/get_keluhan_pasien_bloc.dart';
import 'package:medical_checkup/presentation/pasien/pages/keluhan_pasien_page.dart';
import 'package:medical_checkup/presentation/pasien/pages/home_pasien_page.dart';
import 'package:medical_checkup/presentation/pasien/pages/profile_pasien_page.dart';

class DashboardPasienPage extends StatefulWidget {
  const DashboardPasienPage({super.key});

  @override
  State<DashboardPasienPage> createState() => _DashboardPasienPageState();
}

class _DashboardPasienPageState extends State<DashboardPasienPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUser());
    context.read<GetCheckupPasienBloc>().add(GetCheckupPasien());
    context.read<GetKeluhanPasienBloc>().add(GetKeluhanByPasien());
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePasienPage(),
    const KeluhanPasienPage(),
    const ProfilePasienPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      // body: _pages[_selectedIndex],
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.white,
            selectedItemColor: AppColor.primary,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit_calendar),
                label: 'Keluhan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
