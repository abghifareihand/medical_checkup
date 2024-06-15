import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/components/custom_date.dart';
import 'package:medical_checkup/core/components/custom_dropdown.dart';
import 'package:medical_checkup/core/components/custom_text_tile.dart';
import 'package:medical_checkup/core/components/spaces.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';
import 'package:medical_checkup/data/models/user_response_model.dart';
import 'package:medical_checkup/presentation/petugas/bloc/add_checkup/add_checkup_bloc.dart';

import '../../../core/components/custom_dialog.dart';
import '../../../core/components/custom_field.dart';

class FormPasienPage extends StatefulWidget {
  final UserResponseModel pasien;
  const FormPasienPage({
    super.key,
    required this.pasien,
  });

  @override
  State<FormPasienPage> createState() => _FormPasienPageState();
}

class _FormPasienPageState extends State<FormPasienPage> {
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _tahapController = TextEditingController();
  final TextEditingController _jenisobatController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  final String _selectedStatusKawin = 'Belum Menikah';
  final String _selectedJenisKelamin = 'Laki - laki';
  DateTime _selectedTanggalKembali = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.pasien.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextTile(
            label: 'Nama Pasien',
            text: widget.pasien.name,
          ),
          CustomField.comment(
            controller: _alamatController,
            label: 'Alamat Pasien',
          ),
          CustomField.number(
            controller: _tinggiController,
            label: 'Tinggi Badan',
          ),
          CustomField.number(
            controller: _beratController,
            label: 'Berat Badan',
          ),
          CustomDropdown(
            label: 'Status Kawin',
            value: _selectedStatusKawin,
            items: const [
              'Belum Menikah',
              'Sudah Menikah',
              'Cerai',
            ],
            onChanged: (value) {},
          ),
          CustomDropdown(
            label: 'Jenis Kelamin',
            value: _selectedJenisKelamin,
            items: const [
              'Laki - laki',
              'Perempuan',
            ],
            onChanged: (value) {},
          ),
          CustomTextTile(
            label: 'Tanggal Kedatangan',
            text: DateTime.now().toFormattedDate(),
          ),
          CustomField.number(
            controller: _tahapController,
            label: 'Tahap Pengobatan',
          ),
          CustomField.text(
            controller: _jenisobatController,
            label: 'Jenis Obat',
          ),
          CustomDate(
            label: 'Tanggal Harus Kembali',
            onDateChanged: (value) {
              setState(() {
                _selectedTanggalKembali = value!;
              });
            },
          ),
          CustomField.comment(
            controller: _catatanController,
            label: 'Catatan',
          ),
          const SpaceHeight(20),
          BlocConsumer<AddCheckupBloc, AddCheckupState>(
            listener: (context, state) {
              if (state is AddCheckupLoaded) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      icon: Icons.check_circle,
                      title: 'Berhasil',
                      message: 'Anda berhasil input data pasien',
                      onDonePressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  context.read<AddCheckupBloc>().add(
                        AddCheckup(
                          checkup: CheckupModel(
                            pasienId: widget.pasien.id,
                            nama: widget.pasien.name,
                            alamat: _alamatController.text,
                            tinggiBadan: double.parse(_tinggiController.text),
                            beratBadan: double.parse(_beratController.text),
                            statusKawin: _selectedStatusKawin,
                            jenisKelamin: _selectedJenisKelamin,
                            tanggalDatang: DateTime.now(),
                            tahapPengobatan: int.parse(_tahapController.text),
                            jenisObat: _jenisobatController.text,
                            tanggalKembali: _selectedTanggalKembali,
                            catatan: _catatanController.text,
                          ),
                        ),
                      );
                },
                text: 'Input Data Pasien',
                isLoading: state is AddCheckupLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
