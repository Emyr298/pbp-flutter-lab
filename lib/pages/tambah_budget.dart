import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/models/budget.dart';

class TambahBudget extends StatefulWidget {
  const TambahBudget({super.key, required this.budgetList});

  final List<Budget> budgetList;

  @override
  State<TambahBudget> createState() => _TambahBudgetState();
}

class _TambahBudgetState extends State<TambahBudget> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = '';
  String _nominalBudget = '';
  String? _tipeBudget;
  final List<String> listTipeBudget = ['Pengeluaran', 'Pemasukan'];
  DateTime? _tanggal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: MyDrawer(budgetList: widget.budgetList),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Judul
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Judul',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _judulBudget = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _judulBudget = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nominal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _nominalBudget = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _nominalBudget = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, bottom: 4.0, left: 100.0, right: 100.0),
                child: DropdownButtonFormField<String>(
                    value: _tipeBudget,
                    hint: const Text('Pilih Jenis'),
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    onChanged: (String? value) {
                      setState(() {
                        _tipeBudget = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _tipeBudget = value!;
                      });
                    },
                    items: listTipeBudget
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis budget tidak boleh kosong!';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text(
                    _tanggal == null
                        ? 'Pilih Tanggal'
                        : '${_tanggal!.day.toString()}/${_tanggal!.month.toString()}/${_tanggal!.year.toString()}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now().add(const Duration(days: 1)),
                      initialDate: DateTime.now(),
                    ).then((value) {
                      setState(() {
                        _tanggal = value;
                      });
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            'Simpan',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate() && _tanggal != null) {
            String judul = _judulBudget;
            int nominal = int.parse(_nominalBudget);
            String tipe = _tipeBudget!;
            DateTime tanggal = _tanggal!;

            widget.budgetList.add(Budget(judul, nominal, tipe, tanggal));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
