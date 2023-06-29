// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'alamat_bloc.dart';

abstract class AlamatEvent extends Equatable {
  const AlamatEvent();

  @override
  List<Object> get props => [];
}

class FetechProvinsi extends AlamatEvent {}

class FetechKabupaten extends AlamatEvent {
  final int provinsiId;
  const FetechKabupaten({
    required this.provinsiId,
  });
}

class FetechKecamatan extends AlamatEvent {
  final int kabupatenId;
  const FetechKecamatan({
    required this.kabupatenId,
  });
}

class FetechKalurahan extends AlamatEvent {
  final int kecamatanId;
  const FetechKalurahan({
    required this.kecamatanId,
  });
}
