class Lagu {
  String judul;
  Lagu? next;

  Lagu(this.judul);
}

class Playlist {
  Lagu? head;
  // Method untuk menambah lagu baru ke playlist
  void tambahLagu(String judulLagu) {
    Lagu laguBaru = Lagu(judulLagu);

    if (head == null) {
      // Jika playlist kosong, lagu pertama menjadi head
      head = laguBaru;
    } else {
      // Cari lagu terakhir, lalu tambahkan lagu baru di akhir
      Lagu? laguSaatIni = head;
      while (laguSaatIni!.next != null) {
        laguSaatIni = laguSaatIni.next;
      }
      laguSaatIni.next = laguBaru;
    }
  }

  // Method untuk menghapus lagu dari playlist (misalnya, lagu pertama)
  String? hapusLagu() {
    if (head == null) {
      print("Playlist kosong.");
      return null;
    }

    String judulLagu = head!.judul;
    head = head!.next; // Hapus lagu pertama dengan memindahkan head

    return judulLagu;
  }

  // Method untuk menampilkan semua lagu dalam playlist
  void tampilkanPlaylist() {
    if (head == null) {
      print("Playlist kosong.");
    } else {
      Lagu? laguSaatIni = head;
      while (laguSaatIni != null) {
        print("Lagu: ${laguSaatIni.judul}");
        laguSaatIni = laguSaatIni.next;
      }
    }
  }
}

void main() {
  Playlist playlist = Playlist();

  playlist.tambahLagu("FEIN !");
  playlist.tambahLagu("FEIN2 !");
  playlist.tambahLagu("FEIN3 !");

  print("Playlist saat ini:");
  playlist.tampilkanPlaylist();

  print("\nLagu yang dihapus: ${playlist.hapusLagu()}");

  print("\nPlaylist setelah hapus lagu:");
  playlist.tampilkanPlaylist();
}
