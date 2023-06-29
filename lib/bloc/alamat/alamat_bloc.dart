import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tes_coding_interview/data/provider/alamat_provider.dart';

import '../../data/model/kabupatan_model.dart';
import '../../data/model/kalurahan_model.dart';
import '../../data/model/kecamatan_model.dart';
import '../../data/model/provinsi_model.dart';

part 'alamat_event.dart';
part 'alamat_state.dart';

class AlamatBloc extends Bloc<AlamatEvent, AlamatState> {
  AlamatProvider alamatProvider = AlamatProvider();
  AlamatBloc()
      : super(const AlamatInitial(
            provinsiList: [],
            kabupatenList: [],
            kecamatanList: [],
            kalurahanList: [])) {
    //! provinsi
    on<FetechProvinsi>((event, emit) async {
      try {
        List<Provinsi> data = await alamatProvider.getDataProvinsi();
        emit(AlamatSucsess(
            provinsiList: data,
            kabupatenList: [],
            kecamatanList: [],
            kalurahanList: []));
      } catch (e) {
        print(e.toString());
      }
    });

    //! kabupaten
    on<FetechKabupaten>((event, emit) async {
      try {
        List<Kabupaten> data =
            await alamatProvider.getDataKabupaten(event.provinsiId);
        emit(AlamatSucsess(
            provinsiList: state.provinsiList,
            kabupatenList: data,
            kecamatanList: [],
            kalurahanList: []));
      } catch (e) {
        print(e.toString());
      }
    });

    //! kecamatan
    on<FetechKecamatan>((event, emit) async {
      try {
        List<Kecamatan> data =
            await alamatProvider.getDataKecamatan(event.kabupatenId);
        emit(AlamatSucsess(
            provinsiList: state.provinsiList,
            kabupatenList: state.kabupatenList,
            kecamatanList: data,
            kalurahanList: []));
      } catch (e) {
        print(e.toString());
      }
    });

    on<FetechKalurahan>((event, emit) async {
      try {
        List<Kalurahan> data =
            await alamatProvider.getDataKalurahan(event.kecamatanId);
        emit(AlamatSucsess(
            provinsiList: state.provinsiList,
            kabupatenList: state.kabupatenList,
            kecamatanList: state.kecamatanList,
            kalurahanList: data));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
