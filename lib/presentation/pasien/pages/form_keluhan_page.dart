import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/custom_dialog.dart';
import 'package:medical_checkup/core/components/custom_field.dart';
import 'package:medical_checkup/core/components/custom_text_tile.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/keluhan_model.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';
import 'package:medical_checkup/presentation/pasien/bloc/add_keluhan/add_keluhan_bloc.dart';

class FormKeluhanPage extends StatefulWidget {
  final UserResponseModel user;
  const FormKeluhanPage({super.key, required this.user});

  @override
  State<FormKeluhanPage> createState() => _FormKeluhanPageState();
}

class _FormKeluhanPageState extends State<FormKeluhanPage> {
  final TextEditingController _keluhanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: const Text('Keluhan'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextTile(
            label: 'Tanggal Kedatangan',
            text: DateTime.now().toFormattedDate(),
          ),
          CustomTextTile(
            label: 'Nama Pasien',
            text: widget.user.name,
          ),
          CustomField.comment(
            controller: _keluhanController,
            label: 'Keluhan Pasien',
            maxLines: 4,
          ),
          const SizedBox(height: 20),
          BlocConsumer<AddKeluhanBloc, AddKeluhanState>(
            listener: (context, state) {
              if (state is AddKeluhanLoaded) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      icon: Icons.check_circle,
                      title: 'Berhasil',
                      message:
                          'Anda berhasil menambahkan keluhan, tunggu balasan dari petugas',
                      onDonePressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }

              if (state is AddKeluhanError) {
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
                  final pasienId = FirebaseAuth.instance.currentUser!.uid;
                  context.read<AddKeluhanBloc>().add(
                        AddKeluhan(
                          keluhan: KeluhanModel(
                            pasienId: pasienId,
                            namaPasien: widget.user.name,
                            keluhanPasien: _keluhanController.text,
                            tanggalDatang: DateTime.now(),
                            status: 'diproses',
                          ),
                        ),
                      );
                },
                text: 'Kirim Keluhan',
                isLoading: state is AddKeluhanLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
