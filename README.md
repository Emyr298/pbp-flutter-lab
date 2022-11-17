# counter_7

## Tugas 7
### _Stateless Widget_ dan _Stateful Widget_
_State_ adalah informasi yang bisa dibaca ketika widget di-_build_ dan dapat berubah nantinya dalam runtime. _Stateless widget_ adalah widget yang tidak memiliki _state_ sehingga kondisinya tidak bisa berubah setelah di-_build_ (_immutable_). Untuk membuat _stateless widget_, kita dapat meng-_extend_ _class_ dari _widget_ yang ingin dibuat ke _class_ `StatelessWidget`. _Stateful_ widget adalah _widget_ yang memiliki _state_ sehingga kondisinya dapat berubah-berubah selama _runtime_. Untuk membuat _stateful widget_, kita dapat meng-_extend_ _class_ dari _widget_ yang ingin dibuat ke _class_ `StatefulWidget`. Selain itu, kita juga memanfaatkan _class_ `State< Widget Class Disini >` untuk membuat _state_ dari _widget_.

### Widget yang Digunakan dalam Proyek dan Fungsinya
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

### Fungsi `setState()` dan Variabel yang dapat Terdampak Olehnya
Fungsi `setState()` akan memberitahu _framework_ bahwa _state_ dari objek telah berubah sehingga _framework_ akan menjadwalkan _build_ untuk objek _state_ ini. Fungsi ini memiliki fungsi _callback_ sebagai parameter yang nantinya akan dijalankan secara sinkronus ketika fungsi `setState()` dijalankan. Pada fungsi _callback_ ini, **SEBENARNYA** kita dapat mengisinya dengan _statement_ apapun, termasuk perubahan pada variabel-variabel yang tidak berhubungan dengan _state_. **NAMUN** pada _best practice_-nya, kita hanya menggunakan fungsi _callback_ ini untuk mengubah variabel-variabel _state_ saja. Terkadang, kita perlu melakukan komputasi bersama dengan perubahan variabel _state_, misal menyimpan nilai dari variabel _state_ pada suatu file. Komputasi-komputasi seperti ini sebaiknya tidak dilakukan di dalam fungsi _callback_ dalam fungsi `setState()`.

Pada proyek ini, fungsi `setState()` saya manfaatkan untuk mengubah nilai dari variabel _state_ `_counter` dengan menambahkannya dengan 1 ketika tombol tambah ditekan ataupun mengurangkannya dengan 1 ketika tombol kurang ditekan. Karena fungsi ini akan membuat _framework_ menjalankan _build_ kembali, maka tampilan di layar yang menunjukkan nilai dari `_counter` juga akan berubah.

### Perbedaan `const` dan `final`
_Keyword_ `final` digunakan untuk memberikan nilai pada variabel secara _hard-coded_. Nilai akan diberikan pada variabel saat _run-time_. Variabel yang diberi _keyword_ ini tidak bisa diubah nilainya di masa depan. Fungsi dari _keyword_ `const` mirip dengan `final`, tetapi pada _keyword_ ini, nilai dari variabel ditentukan saat _compile-time_ sehingga kondisi dari objek yang dibentuk akan benar-benar tetap dan _immutable_.

### Tahapan Pengimplementasian
#### Membuat program Flutter `counter_7`
Untuk membuat program flutter, saya menjalankan `flutter create counter_7` pada cmd.

#### Mengubah Tampilan dan Menambahkan Logika pada Program
##### Mengubah Tulisan `"Flutter Demo Home Page"` Menjadi `"Program Counter"`
Awalnya, argumen `title` dari `MyHomePage` diberikan argumen string `"Flutter Demo Home Page"`. Isi dari string tersebut saya ganti dengan `"Program Counter"` untuk mengikuti gambar contoh.

##### Tombol + dan Tombol -
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

##### Teks `GENAP` dan `GANJIL`
Pada _widget_ `Text` yang tadinya berisi string default _template_, saya mengubah stringnya menjadi `(_counter % 2 == 0) ? 'GENAP' : 'GANJIL'` agar ketika _counter_ bernilai genap, teksnya menjadi `"GENAP"` dan ketika ganjil, teksnya menjadi `"GANJIL"`. Setelah itu, saya menambahkan argumen pada `style`-nya dengan `TextStyle` yang berisikan `(_counter % 2 == 0) ? Colors.red : Colors.blue` sebagai `color` sehingga ketika _counter_ bernilai genap, warna dari teks adalah merah dan ketika ganjil, warna dari teks adalah biru.

### Referensi
- https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/
- https://docs.flutter.dev/reference/widgets
- https://api.flutter.dev/flutter/widgets/State/setState.html
- https://www.geeksforgeeks.org/dart-const-and-final-keyword/#:~:text=The%20Const%20keyword%20in%20Dart,constant%20from%20compile%2Dtime%20only.
- https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart

## Tugas 8
### Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
Kumpulan halaman dari aplikasi flutter diimplementasikan dalam bentuk _stack_. Halaman yang sekarang dibuka ada pada bagian atas dari _stack_. `Navigator.push` menambahkan halaman yang baru di bagian atas dari _stack_, atau dengan kata lain di atas halaman yang sekarang sedang dibuka. Setelah halaman berganti, ketika pengguna menekan tombol _back_, maka pengguna akan dialihkan ke halaman sebelum `Navigator.push` dijalankan. Selain `Navigator.push`, ada juga `Navigator.pushReplacement`. Perbedaan diantara keduanya yaitu `Navigator.pushReplacement` menukar halaman teratas dengan halaman yang baru (bukan menambahkan halaman di atasnya) sehingga ketika pengguna menekan tombol _back_, pengguna akan dialihkan ke *dua* halaman sebelumnya (bukan halaman yang tadi di-_replace_).

### Widget yang Dipakai Beserta Fungsinya
- `Drawer`: Panel _navigation links_.
- `ListTile`: Baris dengan tinggi tetap yang biasanya mengandung teks dan _leading_ atau _trailing icon_.
- `Navigator` (Digunakan untuk `pushReplacement`, bukan sebagai _child widget_): Mengatur _child widgets_ dengan aturan _stack_.
- `Form`: _Container_ yang mengelompokkan berbagai _form widget_.
- `SingleChildScrollView`: _Box_ dengan satu _widget_ yang dapat di-_scroll_.
- `TextFormField`: _Form field_ untuk input berupa _string_.
- `DropdownButtonFormField`: _Form field_ untuk input berupa _dropdown_.
- `DropdownMenuItem`: _Item menu_ yang dibuat dengan `DropdownButton`, bisa dipakai untuk `DropdownButtonFormField`.
- `TextButton`: Tombol dengan _material design_.
- `Container`: _Widget_ untuk keamanan yang mengatur _painting_, _positioning_, dan _sizing_.
- `ListView`: Kumpulan _widget_ yang tersusun secara linear dan dapat di-_scroll_.
- `Card`: _Card_ dengan _material design_ dengan sudut yang melingkar.

### Jenis-Jenis _Event_ pada Flutter
- `onChanged`: Terjadi ketika pengguna mengubah nilai dari `TextField` (_insert_ atau _delete_).
- `onTap`: Terjadi ketika pengguna menekan _render object_.
- `onEditingComplete`: Terjadi ketika pengguna melakukan _submit_ pada konten yang dapat diubah (contoh: menekan tombol _done_ pada _keyboard_).
- `onSaved`: Terjadi ketika _form_ di-_save_ dengan `FormState.save`.
- `onHover`: Terjadi ketika _pointer_ diarahkan ke posisi _widget_ tanpa ditekan.
- `onLongPress`: Terjadi ketika _button_ ditekan dengan lama.
- `onPressed`: Terjadi ketika _button_ ditekan.
- `onFocusChange`: Terjadi ketika fokus berubah.

### Cara Kerja `Navigator` dalam Mengganti Halaman Aplikasi Flutter
Kumpulan halaman dari aplikasi flutter diimplementasikan dalam bentuk _stack_. Halaman yang sekarang dibuka ada pada bagian atas dari _stack_. Ketika pengguna menekan tombol _back_, maka halaman teratas yang ada pada _stack_ akan dikeluarkan (_pop stack_) dan pengguna akan dialihkan ke halaman di bawahnya berdasarkan posisi halaman pada _stack_ (biasanya halaman sebelumnya). Ada tiga fungsi yang umum digunakan dalam memanipulasi _stack_ halaman dengan `Navigator`, yaitu `Navigator.push`, `Navigator.pop`, dan `Navigator.pushReplacement`. `Navigator.push` menambahkan halaman baru ke atas _stack_, `Navigator.pop` mengeluarkan/menghapus halaman teratas dari _stack_, dan `Navigator.pushReplacement` mengubah halaman teratas pada _stack_ ke halaman baru (bukan menambahkan di atasnya seperti `Navigator.push`).

### Tahapan
#### Preparasi
Saya membuat _class_ bernama `Budget` yang digunakan untuk menyimpan data budget. Berikut adalah isi dari _class_ `Budget`:

```dart
class Budget {
  String judul;
  int nominal;
  String tipe;
  DateTime tanggal;

  Budget(this.judul, this.nominal, this.tipe, this.tanggal);

  String getTanggalString() {
    return '${tanggal.day.toString()}/${tanggal.month.toString()}/${tanggal.year.toString()}';
  }
}
```

Terdapat dua halaman yang memakai _state_ sama. Oleh karena itu, saya mengubah `MyApp` yang tadinya `StatelessWidget` menjadi `StatefulWidget` dengan _list of_ `Budget` bernama `budgetList` sebagai _state_-nya. Nantinya, `budgetList` akan di-_pass_ ke _child widgets_-nya. Selain itu, saya juga menambahkan parameter baru pada _widget_ `MyHomePage` yang akan menerima `budgetList`.

#### Membuat Drawer
Saya menambahkan _widget_ `Drawer` pada argumen dengan nama parameter `drawer` dalam _method_ `build` dari _state class_ milik `MyHomePage`. _Widget_ `Drawer` tersebut diisi dengan `ListTile` yang tersusun dengan `Column` dimana ketika `ListTile` tersebut ditekan pengguna akan dialihkan ke halaman lainnya menggunakan `Navigator.pushReplacement`. Pada halaman yang dimasukkan ke dalam `Navigator.pushReplacement` melalui `MaterialPageRoute` dan fungsi `builder`, saya memasukkan nilai `budgetList` sebagai parameter sehingga halaman tersebut akan mendapatkan data `budgetList`. Awalnya, `ListTile` hanyalah untuk halaman `counter_7`, tetapi setiap saya menyelesaikan halaman yang baru, saya menambahkan `ListTile` baru dan meng-_copy_ `Drawer` terbaru ke seluruh halaman lainnya sehingga setiap halaman dapat diakses dari halaman lainnya dengan menggunakan `Drawer`.

#### Halaman Form
Saya membuat _widget_ `TambahBudget` dengan jenis `StatefulWidget` yang menerima `budgetList` sebagai parameter dan `_judulBudget`, `_nominalBudget`, dan `_tipeBudget` sebagai _state_ di dalamnya. `listTipeBudget` berfungsi menyimpan nilai-nilai dari `_tipeBudget` yang mungkin. Sedangkan _state_ lainnya berfungsi untuk menyimpan nilai dari seluruh _form field_. _Widget_ yang dijadikan `body` pada _class_ `builder` dari _state_ milik `TambahBudget` adalah `Form` dengan `_formKey` sebagai _key_. Setelah itu, saya membuat `SingleChildScrollView` dengan `Column` yang berisi seluruh _form field_ di dalamnya sebagai _child_-nya. Setelah itu, saya menambahkan seluruh _form field_ di dalam `Column` tersebut. Untuk judul, saya menggunakan `TextFormField` biasa. Untuk nominal, saya menggunakan `TextFormField` biasa dengan menambahkan `inputFormatters` berupa `FilteringTextInputFormatter.digitsOnly` agar pengguna hanya bisa memasukkan _string_ yang hanya berisi angka. Untuk tipe budget, saya menggunakan `DropdownButtonFormField` dengan kumpulan `DropdownMenuItem` yang berisi nilai-nilai dari `listTipeBudget` sebagai _item_-nya. Saya juga menambahkan pada setiap _form field_ _handler_ yang mengubah nilai dari setiap _state_ ketika terjadi _event_ `onChanged` dan `onSaved`. Selain _form fields_, saya juga menambahkan `TextButton` sebagai _floating action button_ di bawah tengah untuk menyimpan data budget. Ketika tombol ini ditekan, _form_ akan divalidasi dengan `_formKey.currentState!.validate()` dan apabila sudah _valid_, value-value yang ada akan diubah ke bentuk yang sesuai (contoh: _string_ `tipe` akan di-_parse_ ke `int`) dan akan dibentuk _instance_ baru dari `Budget` yang akan ditambahkan pada `budgetList`.

#### Halaman Data Budget
Saya membuat _widget_ `DataBudget` dengan jenis `StatelessWidget` yang menerima `budgetList` sebagai parameter. Berdasarkan pada isi dari `budgetList` tersebut, akan dibuat `ListView` dengan berbagai _child widget_ yang masing-masing merepresentasikan suatu `Budget` berbeda dalam `budgetList` dengan memanfaatkan `ListView.builder`. Dalam _builder_ tersebut ditambahkan fungsi yang mengembalikan `Card` berisi `ListTile` yang isinya adalah informasi dari `Budget` yang bersesuaian, yaitu judul, nominal, dan tipenya.

### Referensi
- https://stackoverflow.com/questions/51125024/there-are-multiple-heroes-that-share-the-same-tag-within-a-subtree
- https://stackoverflow.com/questions/59474307/error-either-zero-or-2-or-more-dropdownmenuitems-were-detected-with-the-same