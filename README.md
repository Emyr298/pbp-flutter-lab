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
- https://api.flutter.dev/
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
- https://api.flutter.dev/
- https://stackoverflow.com/questions/51125024/there-are-multiple-heroes-that-share-the-same-tag-within-a-subtree
- https://stackoverflow.com/questions/59474307/error-either-zero-or-2-or-more-dropdownmenuitems-were-detected-with-the-same

## Tugas 9
### Pengambilan Data JSON Tanpa Model
Kita bisa mengambil data JSON tanpa membuat model yang berfungsi menyimpan data pada _string_ JSON tersebut terlebih dahulu. Kita bisa membuat _map_ (`Map<String, dynamic>`) yang menyimpan pasangan _key_ dan _value_ pada data JSON. Namun, penggunaan _map_ sebagai struktur data untuk menyimpan data JSON kurang baik jika dibandingkan dengan penggunaan model. Hal ini karena tipe data dari _value_ pada _map_ yang tidak konsisten (_dynamic_) sehingga memaksa _developer_ untuk mengingat atau membaca dokumentasi dari _endpoint_ mengenai tipe data dari suatu _value_ ketika akan menggunakannya pada suatu _statement_ atau ekspresi untuk memastikan tidak akan terjadi error ketika aplikasi Flutter dijalankan.

### Widget yang Digunakan Beserta Fungsinya
- `Scaffold`: Mengimplementasikan struktur _layout_ dasar dari _material design_.
- `AppBar`: Sebuah _app bar_ untuk _material design_ yang berisi _toolbar_ dan mungkin juga berisi _widget_ lainnya.
- `Text`: Teks dengan satu _style_.
- `ListTile`: Baris dengan tinggi tetap yang biasanya mengandung teks dan _leading_ atau _trailing icon_.
- `FutureBuilder`: Membuat dirinya sendiri berdasarkan _snapshot_ terakhir dari interaksi dengan objek dari _class_ `Future`.
- `Center`: Memindahkan _child_-nya ke tengah.
- `Column`: _Layout_ dari beberapa _child widget_ dalam arah vertikal.
- `Row`: _Layout_ dari beberapa _child widget_ dalam arah horizontal.
- `SizedBox`: _Box_ dengan ukuran yang spesifik.
- `Container`: _Widget_ untuk keamanan yang mengatur _painting_, _positioning_, dan _sizing_.
- `ListView`: Kumpulan _widget_ yang tersusun secara linear dan dapat di-_scroll_.
- `Checkbox`: _Checkbox_ dengan _material design_.
- `Expanded`: Widget yang meng-_expand_ _child_ dari `Row`, `Column`, atau `Flex` sehingga _child_ tersebut mengisi _space_ yang ada.
- `ElevatedButton`: _Elevated button_ dengan _material design_.
- `CircularProgressIndicator`: Indikator _progress_ berbentuk lingkaran yang memutar.

### Mekanisme Pengambilan Data JSON Hingga Penampilan
Pertama, _widget_ `FutureBuilder` akan memanggil _function_ yang mengembalikan objek dengan _class_ `Future`. Fungsi tersebut akan mengirimkan _request_ ke suatu _endpoint_ dengan `http.get`. Ketika _response_ dari _endpoint_ belum didapatkan, objek `Future` belum memiliki data. _Developer_ bisa mengimplementasikan tampilan _loading_ pada halamannya untuk tahap ini agar pengguna tahu bahwa data yang diinginkan belum sampai. Ketika _response_ sampai, _body_ JSON dari _response_ yang masih ada dalam bentuk _bytes_ akan dilakukan UTF-8 _decode_ agar menjadi _string_. Setelah itu, _string_ JSON yang didapatkan akan diubah menjadi `Map<String,dynamic>` dengan menggunakan fungsi `jsonDecode`. Setelah didapatkan _map_ yang menyimpan data JSON, _map_ akan dikonversikan dari bentuk _map_ ke bentuk model. Konversi ini dilakukan dengan memanfaatkan fungsi `Model.fromJson` yang mengubah `Map<String,dynamic>` ke objek `Model`. Setelah itu, objek akan dikembalikan sebagai _return value_ dari fungsinya. Apabila data JSON yang dikembalikan ada dalam bentuk _list_ (seperti pada tugas ini), konversi dari _map_ ke objek `Model` dapat dilakukan satu per satu untuk tiap indeksnya. Setelah objek dikembalikan oleh fungsi, _value_ dari objek `Future` akan berubah sehingga `FutureBuilder` akan meng-_update_ tampilan dari aplikasi. Data yang didapat dari _response_ JSON sudah dapat dilihat dalam tampilan aplikasi.

### Tahapan
#### Menambahkan Tombol Navigasi pada Drawer
Pada _drawer_, saya menambahkan `ListTile` baru dengan meng-_copy_ `ListTile` lainnya. Lalu, saya mengubah halaman yang dituju menjadi `MyWatchListPage`. Pada saat ini, saya belum mengimplementasikan `MyWatchListPage` sehingga masih ada error. Setelah `MyWatchListPage` diimplementasikan pada tahap selanjutnya, saya menambahkan `import 'package:counter_7/pages/my_watch_list.dart'` pada `drawer.dart` untuk menghilangkan error-nya.

#### Menambahkan Halaman My Watch List
Saya membuat model `Movie` pada file `movie.dart` yang nantinya akan digunakan untuk menyimpan data `Movie` dari data JSON yang didapat dari _endpoint_. Implementasi dari model tersebut saya dapatkan dengan memasukkan data JSON yang ada pada _endpoint_ ke situs Quicktype.

Setelah membuat model, saya membuat _stateful widget_ `MyWatchListPage`. Dalam _widget_ tersebut saya mengimplementasikan fungsi `fetchWatchList` dan `build`. Fungsi `fetchWatchList` mengembalikan objek `Future` yang nantinya akan berisi _list of movies_ yang didapat dari data JSON pada _endpoint_. Pada fungsi `build`, saya memanfaatkan `FutureBuilder` untuk menampilkan data dari objek `Future`. Ketika objek `Future` masih mengambil data, akan ditampilkan _circular loading_. Ketika objek `Future` sudah mendapatkan data tetapi _list_-nya kosong, akan ditampilkan teks "Tidak ada watch list". Ketika objek `Future` sudah mendapatkan data dan _list_-nya tidak kosong, akan ditampilkan berbagai `ListTile` yang masing-masing merepresentasikan satu objek `Movie` pada _list_ (dibuat dengan `ListView.builder`). Seluruh `ListTile` tersebut menampilkan judul dari `Movie` yang direpresentasikan olehnya. Pada `ListTile`, saya juga menambahkan fungsi yang mengubah halaman sekarang ke halaman `MyWatchListDetail` yang menampilkan _detail_ dari `Movie` dengan memanfaatkan `Navigator.push`. Dalam _constructor_ `MyWatchListDetail`, saya tambahkan argumen `snapshot.data![index]` pada parameter `movie` untuk memberikan objek `Movie` ke halaman `MyWatchListDetail`. Pada saat ini, saya belum mengimplementasikan `MyWatchListDetail` sehingga masih ada error. Setelah `MyWatchListDetail` diimplementasikan pada tahap selanjutnya, saya menambahkan `import 'package:counter_7/pages/my_watch_list_detail.dart'` pada `my_watch_list.dart` untuk menghilangkan error-nya.

#### Menambah Halaman Detail
Saya membuat _widget_ `MyWatchListDetail` dengan `movie` sebagai salah satu parameternya. _Widget_ ini akan menampilkan data dari objek `Movie`. Saya memanfaatkan `Column` untuk menyusun teks-teks secara vertikal. Dalam `Column` tersebut, terdapat berbagai _widget_ yang masing-masing merepresentasikan data dari `Movie`, yaitu judul, _release date_, _rating_, _review_, dan status. judul dari `Movie` ditampilkan dengan memanfaatkan `Text` _bold_ dengan _size_ 24 yang diberikan `Padding`. _Release date_, _rating_, dan _status_ ditampilkan dengan memanfaatkan `Row` yang berisi `Text` bold untuk nama atribut dan `Text` biasa untuk nilai atribut. _Review_ diimplementasikan dengan `Container` yang di-_align_ ke _center left_ dengan `Column` dengan `CrossAxisAlignment.start` berisi `Text` bold untuk nama atribut dan `Text` biasa untuk nilai atribut sebagai _child_-nya. Setelah itu, saya mengimplementasikan tombol _back_ dengan menggunakan `ElevatedButton` dengan fungsi yang berisi `Navigator.pop(context)` sebagai _handler_ dari _event_ `onPressed`-nya.

### Referensi
- https://api.flutter.dev/
- https://stackoverflow.com/questions/71091828/crossaxisalignment-crossaxisalignment-end-doesnt-work