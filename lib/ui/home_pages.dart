import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tes_coding_interview/data/model/kabupatan_model.dart';
import 'package:tes_coding_interview/data/model/kalurahan_model.dart';
import 'package:tes_coding_interview/data/model/kecamatan_model.dart';
import 'package:tes_coding_interview/data/model/provinsi_model.dart';
import 'package:tes_coding_interview/data/provider/alamat_provider.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppPages(),
    );
  }
}

class AppPages extends StatefulWidget {
  const AppPages({super.key});

  @override
  State<AppPages> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  AlamatProvider alamatProvider = AlamatProvider();
  List<Provinsi> provinsiList = [];
  List<Kabupaten> kabupatenList = [];
  List<Kecamatan> kecamatanList = [];
  List<Kalurahan> kalurahanList = [];

  Provinsi? provinsi;
  Kabupaten? kabupaten;
  Kecamatan? kecamatan;
  Kalurahan? kalurahan;

  TextEditingController provinsiController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kalurahanController = TextEditingController();

  @override
  void initState() {
    fetchProvinsiData();
    super.initState();
  }

  void fetchProvinsiData() async {
    try {
      List<Provinsi> data = await alamatProvider.getDataProvinsi();
      provinsiList = data;
      setState(() {});
    } catch (e) {
      print('Failed to fetch provinsi data: $e');
    }
  }

  void fetchKabupatenData(int provinsiId) async {
    try {
      List<Kabupaten> data = await alamatProvider.getDataKabupaten(provinsiId);
      kabupatenList = data;
      setState(() {});
    } catch (e) {
      print('Failed to fetch kabupaten data: $e');
    }
  }

  void fetchKecamatanData(int kabupatenId) async {
    try {
      List<Kecamatan> data = await alamatProvider.getDataKecamatan(kabupatenId);
      kecamatanList = data;
      setState(() {});
    } catch (e) {
      print('Failed to fetch kabupaten data: $e');
    }
  }

  void fetchKalurahanData(int kecamatanId) async {
    try {
      List<Kalurahan> data = await alamatProvider.getDataKalurahan(kecamatanId);
      kalurahanList = data;
      setState(() {});
    } catch (e) {
      print('Failed to fetch kabupaten data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      //! provinsi
      DropdownMenu<Provinsi>(
        onSelected: (value) {
          provinsi = value;
          kabupaten = null;
          kabupatenList = [];
          if (value != null) {
            fetchKabupatenData(int.parse(value.id));
          }
        },
        width: 300,
        controller: provinsiController,
        enableFilter: true,
        hintText: 'Provinsi',
        dropdownMenuEntries: provinsiList
            .map((e) => DropdownMenuEntry(
                  value: e,
                  label: e.name,
                ))
            .toList(),
      ),
      //! kabupaten
      DropdownMenu<Kabupaten>(
        onSelected: (value) {
          kabupaten = value;
          kecamatan = null;
          kecamatanList = [];
          if (value != null) {
            fetchKecamatanData(int.parse(value.id));
          }
        },
        enabled: (provinsiController.text.isEmpty) ? false : true,
        width: 300,
        enableFilter: true,
        controller: kabupatenController,
        hintText: 'Kabupaten',
        dropdownMenuEntries: kabupatenList
            .map((e) => DropdownMenuEntry(
                  value: e,
                  label: e.name,
                ))
            .toList(),
      ),

      //! kecamatan
      DropdownMenu<Kecamatan>(
          onSelected: (value) {
            kecamatan = value;
            kalurahan = null;
            kalurahanList = [];
            if (value != null) {
              fetchKalurahanData(int.parse(value.id));
            }
          },
          enabled: (kabupatenController.text.isEmpty) ? false : true,
          width: 300,
          enableFilter: true,
          controller: kecamatanController,
          hintText: 'Kecamatan',
          dropdownMenuEntries: kecamatanList
              .map((e) => DropdownMenuEntry(value: e, label: e.name))
              .toList()),

      //!kalurahan
      DropdownMenu<Kalurahan>(
          onSelected: (value) {
            kalurahan = value;
            setState(() {});
          },
          enabled: (kecamatanController.text.isEmpty) ? false : true,
          width: 300,
          enableFilter: true,
          controller: kalurahanController,
          hintText: 'Kalurahan',
          dropdownMenuEntries: kalurahanList
              .map((e) => DropdownMenuEntry(value: e, label: e.name))
              .toList()),
      Text(provinsiController.text),
      Text(kabupatenController.text),
      Text(kecamatanController.text),
      Text(kalurahanController.text),
    ]));
  }
}
