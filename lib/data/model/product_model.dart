import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String nama;
  final String harga;
  final String status;
  final String kategori;
  final double penilaian;
  final String tempat;
  final String gambar;

  const Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.status,
    required this.kategori,
    required this.penilaian,
    required this.tempat,
    required this.gambar,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        status: json["status"],
        kategori: json["kategori"],
        penilaian: json["penilaian"]?.toDouble(),
        tempat: json["tempat"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "status": status,
        "kategori": kategori,
        "penilaian": penilaian,
        "tempat": tempat,
        "gambar": gambar,
      };

  @override
  List<Object?> get props =>
      [id, nama, harga, status, kategori, penilaian, tempat, gambar];
}
