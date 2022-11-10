# counter_7

## _Stateless Widget_ dan _Stateful Widget_
_State_ adalah informasi yang bisa dibaca ketika widget di-_build_ dan dapat berubah nantinya dalam runtime. _Stateless widget_ adalah widget yang tidak memiliki _state_ sehingga kondisinya tidak bisa berubah setelah di-_build_ (_immutable_). Untuk membuat _stateless widget_, kita dapat meng-_extend_ _class_ dari _widget_ yang ingin dibuat ke _class_ `StatelessWidget`. _Stateful_ widget adalah _widget_ yang memiliki _state_ sehingga kondisinya dapat berubah-berubah selama _runtime_. Untuk membuat _stateful widget_, kita dapat meng-_extend_ _class_ dari _widget_ yang ingin dibuat ke _class_ `StatefulWidget`. Selain itu, kita juga memanfaatkan _class_ `State< Widget Class Disini >` untuk membuat _state_ dari _widget_.

## Widget yang Digunakan dalam Proyek dan Fungsinya
- `MaterialApp`: Membungkus beberapa _widget_ yang biasanya digunakan untuk mengimplementasikan _material design_.
- `Scaffold`: Mengimplementasikan struktur _layout_ dasar dari _material design_.
- `AppBar`: Sebuah _app bar_ untuk _material design_ yang berisi _toolbar_ dan mungkin juga berisi _widget_ lainnya.
- `Text`: Teks dengan satu _style_.
- `Center`: Memindahkan _child_-nya ke tengah.
- `Row`: _Layout_ dari beberapa _child widget_ dalam arah horizontal.
- `Column`: _Layout_ dari beberapa _child widget_ dalam arah vertikal.
- `Theme` (_Widget_ ini hanya digunakan _class_-nya saja untuk mendapatkan `TextStyle`, tidak dipakai sebagai _widget_): Memberikan tema berupa pilihan warna dan tipografi pada _descendant_-nya.
- `Padding`: Memberikan _padding_ pada _child_-nya.
- `Visibility`: Mengatur ketersembunyian dari _child_-nya.
- `FloatingActionButton`: Tombol lingkaran yang ter-_hover_ pada konten.
- `Icon`: Menampilkan _icon_ dari _material design_.

## Fungsi `setState()` dan Variabel yang dapat Terdampak Olehnya
Fungsi `setState()` akan memberitahu _framework_ bahwa _state_ dari objek telah berubah sehingga _framework_ akan menjadwalkan _build_ untuk objek _state_ ini. Fungsi ini memiliki fungsi _callback_ sebagai parameter yang nantinya akan dijalankan secara sinkronus ketika fungsi `setState()` dijalankan. Pada fungsi _callback_ ini, **SEBENARNYA** kita dapat mengisinya dengan _statement_ apapun, termasuk perubahan pada variabel-variabel yang tidak berhubungan dengan _state_. **NAMUN** pada _best practice_-nya, kita hanya menggunakan fungsi _callback_ ini untuk mengubah variabel-variabel _state_ saja. Terkadang, kita perlu melakukan komputasi bersama dengan perubahan variabel _state_, misal menyimpan nilai dari variabel _state_ pada suatu file. Komputasi-komputasi seperti ini sebaiknya tidak dilakukan di dalam fungsi _callback_ dalam fungsi `setState()`.

Pada proyek ini, fungsi `setState()` saya manfaatkan untuk mengubah nilai dari variabel _state_ `_counter` dengan menambahkannya dengan 1 ketika tombol tambah ditekan ataupun mengurangkannya dengan 1 ketika tombol kurang ditekan. Karena fungsi ini akan membuat _framework_ menjalankan _build_ kembali, maka tampilan di layar yang menunjukkan nilai dari `_counter` juga akan berubah.

## Perbedaan `const` dan `final`
_Keyword_ `final` digunakan untuk memberikan nilai pada variabel secara _hard-coded_. Nilai akan diberikan pada variabel saat _run-time_. Variabel yang diberi _keyword_ ini tidak bisa diubah nilainya di masa depan. Fungsi dari _keyword_ `const` mirip dengan `final`, tetapi pada _keyword_ ini, nilai dari variabel ditentukan saat _compile-time_ sehingga kondisi dari objek yang dibentuk akan benar-benar tetap dan _immutable_.

## Tahapan Pengimplementasian
### Membuat program Flutter `counter_7`
Untuk membuat program flutter, saya menjalankan `flutter create counter_7` pada cmd.

### Mengubah Tampilan dan Menambahkan Logika pada Program
#### Mengubah Tulisan `"Flutter Demo Home Page"` Menjadi `"Program Counter"`
Awalnya, argumen `title` dari `MyHomePage` diberikan argumen string `"Flutter Demo Home Page"`. Isi dari string tersebut saya ganti dengan `"Program Counter"` untuk mengikuti gambar contoh.

#### Tombol + dan Tombol -
Pertama, saya mengubah argumen pada `floatingActionButton` dari `Scaffold` di fungsi `build()` pada `_MyHomePageState` menjadi `Row` yang berisikan dua _widget_ `FloatingActionButton` yang masing-masing berfungsi untuk mengurangi _counter_ dan menambah _counter_. Untuk membuat posisi dari kedua tombol mengikuti gambar, saya mengubah posisi dari `floatingActionButton` ke tengah dengan menggunakan `floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat`. Pada `Row`, saya memberi `mainAxisAlignment: MainAxisAlignment.spaceBetween`. Setelah itu, saya menambahkan `Padding` sebagai _parent_ dari `Row` dengan _inset_ kiri dan kanan sebesar 16. Untuk memenuhi bonus, saya menambahkan `Visibility` sebagai _parent_ dari tombol - dan memberikannya `visible: (_counter != 0)` agar tombol tersebut hilang ketika _counter_ bernilai 0.

Setelah membuat tombol, saya mengimplementasikan logika penambahan dan pengurangan. Saya membuat fungsi `_decrement` pada `_MyHomePageState` untuk mengurangi `_counter` apabila nilainya lebih dari 0. Fungsi `_increment` tidak saya buat karena sudah ada pada _template_-nya. Berikut adalah isi dari fungsi `_decrementCounter`:
```dart
void _decrementCounter() {
    setState(() {
        if (_counter > 0) _counter--;
    });
}
```
Setelah kedua fungsi jadi, saya menambahkan kedua fungsi pada `onPressed` dari tombol yang bersesuaian sehingga fungsi akan dijalankan ketika tombol diklik.

#### Teks `GENAP` dan `GANJIL`
Pada _widget_ `Text` yang tadinya berisi string default _template_, saya mengubah stringnya menjadi `(_counter % 2 == 0) ? 'GENAP' : 'GANJIL'` agar ketika _counter_ bernilai genap, teksnya menjadi `"GENAP"` dan ketika ganjil, teksnya menjadi `"GANJIL"`. Setelah itu, saya menambahkan argumen pada `style`-nya dengan `TextStyle` yang berisikan `(_counter % 2 == 0) ? Colors.red : Colors.blue` sebagai `color` sehingga ketika _counter_ bernilai genap, warna dari teks adalah merah dan ketika ganjil, warna dari teks adalah biru.

## Referensi
- https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/
- https://docs.flutter.dev/reference/widgets
- https://api.flutter.dev/flutter/widgets/State/setState.html
- https://www.geeksforgeeks.org/dart-const-and-final-keyword/#:~:text=The%20Const%20keyword%20in%20Dart,constant%20from%20compile%2Dtime%20only.
- https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart