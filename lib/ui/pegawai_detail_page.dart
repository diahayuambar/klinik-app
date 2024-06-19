import 'package:flutter/material.dart';
import '../service/pegawai_service.dart';
import '../ui/pegawai_form_page.dart';
import '../ui/pegawai_update_form.dart';
import '../model/pegawai.dart';

class PegawaiDetailPage extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetailPage({super.key, required this.pegawai});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  PegawaiService _pegawaiServiceNew = PegawaiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai"),),
      body: Column(
        children: [
          SizedBox(height: 11),
          Text(
            "ID Pegawai : ${widget.pegawai.id!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          ),
          SizedBox(height: 11),
          Text(
            "NIP Pegawai : ${widget.pegawai.nipPegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          ),
          SizedBox(height: 11),
          Text(
            "Nama Pegawai : ${widget.pegawai.nm_pegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Tanggal Lahir Pegawai : ${widget.pegawai.tglLahirPegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          ),
          SizedBox(height: 11),
          Text(
            "Nomor Telepon : ${widget.pegawai.noTlpPegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          ),
          SizedBox(height: 11),
          Text(
            "Email Pegawai : ${widget.pegawai.emailPegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          ),
          SizedBox(height: 11),
          Text(
            "Password Pegawai : ${widget.pegawai.passwordPegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          )
        ],
      )
    );
  }

  _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai))
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
      child: Text("Ubah"),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: () async {
                await _pegawaiServiceNew.deletePegawai(widget.pegawai.id!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PegawaiForm()));
              },
              child: Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            // tombol batal
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.black),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
      child: Text("Hapus"),
    );
  }
}
