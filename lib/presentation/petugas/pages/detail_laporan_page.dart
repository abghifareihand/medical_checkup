import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:medical_checkup/core/components/custom_button.dart';
import 'package:medical_checkup/core/constants/app_color.dart';
import 'package:medical_checkup/core/constants/app_font.dart';
import 'package:medical_checkup/core/constants/date_time_ext.dart';
import 'package:medical_checkup/data/models/checkup_model.dart';

class DetailLaporanPage extends StatefulWidget {
  final CheckupModel laporan;

  const DetailLaporanPage({
    Key? key,
    required this.laporan,
  }) : super(key: key);

  @override
  _DetailLaporanPageState createState() => _DetailLaporanPageState();
}

class _DetailLaporanPageState extends State<DetailLaporanPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Laporan'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Pasien :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.laporan.nama,
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'No. RM :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.laporan.rekamMedis,
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Umur :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${formatDecimal(widget.laporan.umur)} tahun',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Berat Badan :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${formatDecimal(widget.laporan.beratBadan)} kg',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tinggi Badan :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${formatDecimal(widget.laporan.tinggiBadan)} cm',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tanggal Datang :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${widget.laporan.tanggalDatang.toFormattedDate()} ${DateFormat.Hm().format(widget.laporan.tanggalDatang)}',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tanggal Kembali :',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${widget.laporan.tanggalKembali.toFormattedDate()} ${DateFormat.Hm().format(widget.laporan.tanggalKembali)}',
                style: AppFont.blackText.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await saveAsFile(
                    '${widget.laporan.nama.toUpperCase()}-${widget.laporan.rekamMedis}',
                    widget.laporan,
                  );
                  setState(() {
                    isLoading = false;
                  });
                },
                text: 'Print PDF',
                isLoading: isLoading,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> saveAsFile(String fileName, CheckupModel laporan) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  'Data Diri Pasien',
                  style: const pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.SizedBox(height: 14),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text(' Nama Pasien'),
                      pw.Text(' ${laporan.nama}'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' No. RM'),
                      pw.Text(' ${laporan.rekamMedis}'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Umur'),
                      pw.Text(' ${formatDecimal(laporan.umur)} tahun'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Berat Badan'),
                      pw.Text(' ${formatDecimal(laporan.beratBadan)} kg'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Tinggi Badan'),
                      pw.Text(' ${formatDecimal(laporan.tinggiBadan)} cm'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Tanggal Datang'),
                      pw.Text(
                          ' ${laporan.tanggalDatang.toFormattedDate()} ${DateFormat.Hm().format(laporan.tanggalDatang)}'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Tanggal Kembali'),
                      pw.Text(
                          ' ${laporan.tanggalKembali.toFormattedDate()} ${DateFormat.Hm().format(laporan.tanggalKembali)}'),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF document
    final bytes = await pdf.save();

    // Directory for storing the PDF file
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/$fileName.pdf');

    // Write to file
    await file.writeAsBytes(bytes);

    // Open the saved PDF file
    await OpenFile.open(file.path);
  }
}
