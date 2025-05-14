class EventModel {
  final String nama;
  final String lokasi;
  final String harga;
  final String deskripsi;
  final String tanggal;
  final String imageUrl;

  EventModel({
    required this.nama,
    required this.lokasi,
    required this.harga,
    required this.deskripsi,
    required this.tanggal,
    required this.imageUrl,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      nama: json['nama'] ?? '',
      lokasi: json['lokasi'] ?? '',
      harga: json['harga'] ?? 'Gratis',
      deskripsi: json['deskripsi'] ?? '',
      tanggal: json['tanggal'] ?? '',
      imageUrl: json['image'] ?? '',
    );
  }
}
