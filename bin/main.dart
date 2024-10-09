import 'dart:io'; // Import library untuk input/output
import 'dart:async';
import 'dart:math'; // Untuk random

class Node {
  String data; // Data di node
  Node? next;

  Node(this.data);
}

// Fungsi untuk membuat linked list dari string "REI"
Node createLinkedList(String input) {
  Node head = Node(input[0]); // Menyimpan karakter pertama
  Node current = head;

  for (int i = 1; i < input.length; i++) {
    current.next = Node(input[i]); // Menyimpan karakter berikutnya
    current = current.next!;
  }

  current.next = head; // Membuat loop kembali ke head
  return head;
}

// Fungsi untuk mendapatkan ukuran layar terminal
List<int> getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

// Fungsi untuk membersihkan layar terminal
void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // Clear entire screen and move cursor to (0,0)
}

// Fungsi untuk menghasilkan warna acak menggunakan ANSI
String getRandomColor() {
  List<String> colors = [
    '\x1B[31m', // Merah
    '\x1B[32m', // Hijau
    '\x1B[33m', // Kuning
    '\x1B[34m', // Biru
    '\x1B[35m', // Ungu
    '\x1B[36m', // Cyan
    '\x1B[37m', // Putih
  ];
  return colors[Random().nextInt(colors.length)];
}

// Fungsi untuk menampilkan animasi teks
Future<void> animateText(Node head) async {
  Node? currentNode = head;

  for (int j = 1; j <= getScreenSize()[1]; j++) {
    // Ambil warna untuk setiap huruf
    String color = getRandomColor();

    if (j % 2 != 0) {
      // Baris ganjil: cetak dari kiri ke kanan
      for (int i = 1; i <= getScreenSize()[0]; i++) {
        stdout.write(
            '\x1B[${j};${i}H${color}${currentNode!.data}\x1B[0m'); // Ganti posisi
        await Future.delayed(Duration(milliseconds: 200)); // Delay untuk efek
        currentNode = currentNode.next; // Pindah ke node berikutnya
      }
    } else {
      // Baris genap: cetak dari kanan ke kiri
      for (int i = getScreenSize()[0]; i > 0; i--) {
        stdout.write(
            '\x1B[${j};${i}H${color}${currentNode!.data}\x1B[0m'); // Ganti posisi
        await Future.delayed(Duration(milliseconds: 200)); // Delay untuk efek
        currentNode = currentNode.next; // Pindah ke node berikutnya
      }
    }
  }
}

void main() async {
  String input = "REI"; // Menggunakan kata "REI" secara langsung

  Node head = createLinkedList(input); // Buat linked list dari input
  clearScreen(); // Membersihkan terminal terlebih dahulu

  // Menampilkan animasi
  for (int i = 1; i <= getScreenSize()[1]; i++) {
    clearScreen(); // Membersihkan layar sebelum memulai animasi setiap loop
    await animateText(head); // Jalankan animasi
  }
}
