import 'package:flutter/material.dart';
import '../service/pasien_service.dart';
import '../ui/pasien_form_page.dart';
import '../ui/pasien_update_form.dart';
import '../model/pasien.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien pasien;

  const PasienDetailPage({super.key, required this.pasien});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  PasienService _pasienServiceNew = PasienService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pasien"),),
      body: Column(
        children: [
          SizedBox(height: 11),
          Text(
            "ID Pasien : ${widget.pasien.id!}",
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
            "NIP Pasien : ${widget.pasien.noRm!}",
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
            "Nama Pasien : ${widget.pasien.nm_pasien!}",
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
            "Tanggal Lahir Pasien : ${widget.pasien.tglLahirPasien!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Text(
            "Nomor Telepon : ${widget.pasien.noTlpPasien!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 11),
          Text(
            "Alamat Pasien : ${widget.pasien.alamatPasien!}",
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
        ],
      )
    );
  }

  _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasienUpdateForm(pasien: widget.pasien))
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
                await _pasienServiceNew.deletePasien(widget.pasien.id!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PasienForm()));
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
