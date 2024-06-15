import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/auth/bloc/user/user_bloc.dart';
import 'presentation/auth/pages/splash_page.dart';
import 'presentation/pasien/bloc/add_keluhan/add_keluhan_bloc.dart';
import 'presentation/pasien/bloc/get_checkup_pasien/get_checkup_pasien_bloc.dart';
import 'presentation/pasien/bloc/get_keluhan_pasien/get_keluhan_pasien_bloc.dart';
import 'presentation/petugas/bloc/add_checkup/add_checkup_bloc.dart';
import 'presentation/petugas/bloc/get_keluhan/get_keluhan_bloc.dart';
import 'presentation/petugas/bloc/get_pasien/get_pasien_bloc.dart';
import 'presentation/petugas/bloc/update/update_keluhan_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// AUTH
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),

        /// PETUGAS
        BlocProvider(
          create: (context) => GetPasienBloc(),
        ),
        BlocProvider(
          create: (context) => GetKeluhanBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateKeluhanBloc(),
        ),
        BlocProvider(
          create: (context) => AddCheckupBloc(),
        ),

        /// PASIEN
        BlocProvider(
          create: (context) => GetCheckupPasienBloc(),
        ),
        BlocProvider(
          create: (context) => AddKeluhanBloc(),
        ),
        BlocProvider(
          create: (context) => GetKeluhanPasienBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
