// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tes_coding_interview/bloc/export.dart';
import 'package:tes_coding_interview/data/model/kabupatan_model.dart';
import 'package:tes_coding_interview/data/model/kalurahan_model.dart';
import 'package:tes_coding_interview/data/model/kecamatan_model.dart';
import 'package:tes_coding_interview/data/model/provinsi_model.dart';

class MyHomePages extends StatelessWidget {
  MyHomePages({super.key});

  TextEditingController provinsiController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kalurahanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AlamatBloc, AlamatState>(
        builder: (context, state) {
          return Column(
            children: [
              //! provinsi
              DropdownMenu<Provinsi>(
                  width: 300,
                  controller: provinsiController,
                  enableFilter: true,
                  hintText: 'Provinsi',
                  onSelected: (value) {
                    context
                        .read<AlamatBloc>()
                        .add(FetechKabupaten(provinsiId: int.parse(value!.id)));
                  },
                  dropdownMenuEntries: state.provinsiList
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList()),

              //! kabupaten
              DropdownMenu<Kabupaten>(
                  width: 300,
                  controller: kabupatenController,
                  enableFilter: true,
                  hintText: 'Kabupaten',
                  enabled: (provinsiController.text.isEmpty) ? false : true,
                  onSelected: (value) {
                    context.read<AlamatBloc>().add(
                        FetechKecamatan(kabupatenId: int.parse(value!.id)));
                  },
                  dropdownMenuEntries: state.kabupatenList
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList()),

              //! kecamatan
              DropdownMenu<Kecamatan>(
                  width: 300,
                  controller: kecamatanController,
                  enableFilter: true,
                  hintText: 'Kecamatan',
                  enabled: (kabupatenController.text.isEmpty) ? false : true,
                  onSelected: (value) {
                    context.read<AlamatBloc>().add(
                        FetechKalurahan(kecamatanId: int.parse(value!.id)));
                  },
                  dropdownMenuEntries: state.kecamatanList
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList()),

              //! kalurahan
              DropdownMenu<Kalurahan>(
                  width: 300,
                  controller: kalurahanController,
                  enableFilter: true,
                  hintText: 'Kalurahan',
                  enabled: (kecamatanController.text.isEmpty) ? false : true,
                  onSelected: (value) {},
                  dropdownMenuEntries: state.kalurahanList
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList())
            ],
          );
        },
      ),
    );
  }
}
