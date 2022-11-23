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
