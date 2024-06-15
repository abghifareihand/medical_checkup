import 'package:medical_checkup/core/constants/app_image.dart';

class BeritaResponseModel {
  final String judul;
  final String deskripsi;
  final String imageUrl;

  BeritaResponseModel({
    required this.judul,
    required this.deskripsi,
    required this.imageUrl,
  });
}

List<BeritaResponseModel> dummyBeritaList = [
  BeritaResponseModel(
    judul: 'Apa itu HIV dan AIDS?',
    deskripsi:
        'HIV (Human Immunodeficiency Virus) adalah virus yang menyerang sistem kekebalan tubuh yang dapat melemahkan kemampuan tubuh melawan infeksi dan penyakit. AIDS (Acquired Immune Deficiency Syndrome) adalah kondisi di mana HIV sudah pada tahap infeksi akhir. Ketika seseorang sudah mengalami AIDS, tubuh tidak lagi memiliki kemampuan untuk melawan infeksi yang ditimbulkan. Dengan menjalani pengobatan tertentu, pengidap HIV bisa memperlambat perkembangan penyakit ini, sehingga pengidap HIV bisa menjalani hidup dengan normal.',
    imageUrl: AppImage.bghiv,
  ),
  BeritaResponseModel(
    judul: 'Penyebab HIV dan AIDS',
    deskripsi:
        'Di negara Indonesia, penyebaran dan penularan HIV paling banyak disebabkan melalui hubungan intim yang tidak aman dan bergantian menggunakan jarum suntik yang tidak steril saat memakai narkoba. Seseorang yang terinfeksi HIV dapat menularkannya kepada orang lain, bahkan sejak beberapa minggu sejak tertular. Semua orang berisiko terinfeksi HIV.',
    imageUrl: AppImage.bghiv,
  ),
  BeritaResponseModel(
    judul: 'Faktor Risiko HIV dan AIDS',
    deskripsi:
        'Kelompok orang yang lebih berisiko terinfeksi, antara lain: Orang yang melakukan hubungan intim tanpa kondom, baik hubungan sesama jenis maupun heteroseksual. Mereka yang sering membuat tato atau melakukan tindik. Orang yang terkena infeksi penyakit seksual lain. Pengguna narkotika suntik. Orang yang berhubungan intim dengan pengguna narkotika suntik.',
    imageUrl: AppImage.bghiv,
  ),
  BeritaResponseModel(
    judul: 'Diagnosis HIV dan AIDS',
    deskripsi:
        'Tes HIV harus dilakukan untuk memastikan seseorang mengidap HIV atau tidak. Pemeriksaan yang dilakukan sebagai langkah diagnosis adalah dengan mengambil sampel darah atau urine pengidap untuk diteliti di laboratorium',
    imageUrl: AppImage.bghiv,
  ),
  BeritaResponseModel(
    judul: 'Pengobatan HIV dan AIDS',
    deskripsi:
        'Meskipun sampai saat ini belum ada pengobatan HIV yang bisa menyebmbuhkan total, tetapi ada jenis obat yang dapat memperlambat perkembangan virus. Jenis obat ini disebut antiretroviral (ARV). RV bekerja dengan menghilangkan unsur yang virus HIV butuhkan untuk menggandakan diri dan mencegah virus HIV menghancurkan sel CD4. Jenis obat ARV memiliki berbagai varian, antara lain Etravirine, Efavirenz, Lamivudin, Zidovudin, dan juga Nevirapine. Selama mengonsumsi obat antiretroviral, dokter akan memonitor jumlah virus dan sel CD4 untuk menilai respons pengidap terhadap pengobatan. Hitung sel CD4 bisa kamu lakukan tiap 3–6 bulan.',
    imageUrl: AppImage.bghiv,
  ),
];
