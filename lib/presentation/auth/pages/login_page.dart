import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/custom_field.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/presentation/auth/bloc/login/login_bloc.dart';
import 'package:medical_checkup/presentation/auth/pages/register_role_page.dart';
import 'package:medical_checkup/presentation/pasien/pages/dashboard_pasien_page.dart';
import 'package:medical_checkup/presentation/petugas/pages/dashboard_petugas_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 40),
          Text(
            'Login',
            style: AppFont.blackText.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 30),
          CustomField.email(
            controller: _emailController,
            label: 'Email',
          ),
          CustomField.password(
            controller: _passwordController,
            label: 'Password',
          ),
          const SizedBox(height: 30),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoaded) {
                final user = state.user;
                debugPrint('Rolemu : ${user.role}');

                /// Jika role PASIEN ke DashboardPasien
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
              if (state is LoginError) {
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
                onPressed: () {
                  context.read<LoginBloc>().add(Login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                },
                isLoading: state is LoginLoading,
                text: 'Login',
              );
            },
          ),
          const SpaceHeight(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account? ',
                style: AppFont.blackText.copyWith(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterRolePage(),
                      ));
                },
                child: Text(
                  'Register',
                  style: AppFont.primaryText.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
