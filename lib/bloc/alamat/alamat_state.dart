// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'alamat_bloc.dart';

abstract class AlamatState extends Equatable {
  const AlamatState({
    required this.provinsiList,
    required this.kabupatenList,
    required this.kecamatanList,
    required this.kalurahanList,
    this.selectedProvinsi,
    this.selectedKabupaten,
    this.selectedKecamatan,
    this.selectedKalurahan,
  });
  final List<Provinsi> provinsiList;
  final List<Kabupaten> kabupatenList;
  final List<Kecamatan> kecamatanList;
  final List<Kalurahan> kalurahanList;
  final Provinsi? selectedProvinsi;
  final Kabupaten? selectedKabupaten;
  final Kecamatan? selectedKecamatan;
  final Kalurahan? selectedKalurahan;

  @override
  List<Object> get props => [
        provinsiList,
        kabupatenList,
        kecamatanList,
        kalurahanList,
        selectedProvinsi!,
        selectedKabupaten!,
        selectedKecamatan!,
        selectedKalurahan!
      ];
}

class AlamatInitial extends AlamatState {
  const AlamatInitial(
      {required super.provinsiList,
      required super.kabupatenList,
      required super.kecamatanList,
      required super.kalurahanList});
  @override
  List<Object> get props => [
        provinsiList,
        kabupatenList,
        kecamatanList,
        kalurahanList,
      ];
}

class AlamatSucsess extends AlamatState {
  const AlamatSucsess(
      {required super.provinsiList,
      required super.kabupatenList,
      required super.kecamatanList,
      required super.kalurahanList});
  @override
  List<Object> get props => [
        provinsiList,
        kabupatenList,
        kecamatanList,
        kalurahanList,
      ];
}
