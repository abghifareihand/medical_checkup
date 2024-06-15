import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/custom_field.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/presentation/auth/bloc/register/register_bloc.dart';
import 'package:medical_checkup/presentation/pasien/pages/dashboard_pasien_page.dart';
import 'package:medical_checkup/presentation/petugas/pages/dashboard_petugas_page.dart';
import '../../../core/components/spaces.dart';

class RegisterPage extends StatefulWidget {
  final String role;
  const RegisterPage({super.key, required this.role});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _buttonRegister() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap isi semua field'),
          backgroundColor: AppColor.red,
        ),
      );
    } else {
      context.read<RegisterBloc>().add(Register(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            role: widget.role,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 40),
          Text(
            'Register',
            style: AppFont.blackText.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 30),
          CustomField.text(
            controller: _nameController,
            label: 'Nama',
          ),
          CustomField.email(
            controller: _emailController,
            label: 'Email',
          ),
          CustomField.password(
            controller: _passwordController,
            label: 'Password',
          ),
          const SpaceHeight(30.0),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoaded) {
                final user = state.user;
                if (user.role == 'pasien') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPasienPage(),
                    ),
                  );
                }

                /// Jika role PETUGAS ke DashboardPetugas
                if (user.role == 'petugas') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPetugasPage(),
                    ),
                  );
                }
              }
              if (state is RegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColor.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                onPressed: _buttonRegister,
                text: 'Register',
                isLoading: state is RegisterLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
