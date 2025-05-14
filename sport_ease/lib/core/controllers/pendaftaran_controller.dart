class Olahraga {
  final String hariJam;
  final String nama;
  final String pelatih;
  final String lokasi;
  final String imageUrl;

  Olahraga({
    required this.hariJam,
    required this.nama,
    required this.pelatih,
    required this.lokasi,
    required this.imageUrl,
  });
}

class PendaftaranController {
  static final List<Olahraga> listOlahraga = [
    Olahraga(
      hariJam: "Senin, 15.00 - 17.00 WIB",
      nama: "Bulu Tangkis",
      pelatih: "Bapak Sugiyo",
      lokasi: "Gor Bung Karno Kab.Nganjuk",
      imageUrl: "assets/image/badminton/badminton2.jpeg",
    ),
    Olahraga(
      hariJam: "Rabu, 16.00 - 18.00 WIB",
      nama: "Futsal",
      pelatih: "Bapak Sugeng",
      lokasi: "Gor Bung Karno Kab.Nganjuk",
      imageUrl: "assets/image/futsal/futsal2.jpeg",
    ),
    Olahraga(
      hariJam: "Kamis, 16.00 - 18.00 WIB",
      nama: "Voli",
      pelatih: "Bapak Jiman",
      lokasi: "Gedung Juang 45 Kab.Nganjuk",
      imageUrl: "assets/image/voly/voly1.png",
    ),
    Olahraga(
      hariJam: "Minggu, 08.00 - 10.00 WIB",
      nama: "Karate",
      pelatih: "Bapak Andik",
      lokasi: "Gor Bung Karno Kab.Nganjuk",
      imageUrl: "assets/image/karate/karate1.jpeg",
    ),
    Olahraga(
      hariJam: "Jum'at, 15.00 - 17.00 WIB",
      nama: "Taekwondo",
      pelatih: "Bapak Sugeng",
      lokasi: "Gedung Juang 45 Kab.Nganjuk",
      imageUrl: "https://picsum.photos/seed/taekwondo/200/120",
    ),
  ];

  static List<Olahraga> filterList(String query) {
    if (query.isEmpty) return listOlahraga;

    final lowerQuery = query.toLowerCase();
    return listOlahraga.where((olahraga) {
      return olahraga.nama.toLowerCase().contains(lowerQuery) ||
          olahraga.pelatih.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
