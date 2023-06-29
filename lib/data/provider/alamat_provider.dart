import 'package:http/http.dart' as http;

import '../model/kabupatan_model.dart';
import '../model/kalurahan_model.dart';
import '../model/kecamatan_model.dart';
import '../model/provinsi_model.dart';

class AlamatProvider {
  //!provinsi
  Future<List<Provinsi>> getDataProvinsi() async {
    String urlProvinsi =
        'https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json';
    try {
      var response = await http.get(Uri.parse(urlProvinsi));
      return provinsiFromJson(response.body);
    } on Exception catch (e) {
      throw 'erorr';
    }
  }

  //!kabupaten
  Future<List<Kabupaten>> getDataKabupaten(int id) async {
    String urlKabupaten =
        'https://emsifa.github.io/api-wilayah-indonesia/api/regencies';

    try {
      var response = await http.get(Uri.parse('$urlKabupaten/$id.json'));
      return kabupatenFromJson(response.body);
    } on Exception catch (e) {
      throw 'erorr';
    }
  }

  //!kecamatan
  Future<List<Kecamatan>> getDataKecamatan(int id) async {
    String urlKabupaten =
        'https://emsifa.github.io/api-wilayah-indonesia/api/districts';
    try {
      var response = await http.get(Uri.parse('$urlKabupaten/$id.json'));
      return kecamatanFromJson(response.body);
    } catch (e) {
      throw 'erorr';
    }
  }

  //!kelurahan
  Future<List<Kalurahan>> getDataKalurahan(int id) async {
    String urlKalurahan =
        'https://emsifa.github.io/api-wilayah-indonesia/api/villages';
    try {
      var response = await http.get(Uri.parse('$urlKalurahan/$id.json'));
      return kalurahanFromJson(response.body);
    } catch (e) {
      throw 'erorr';
    }
  }
}
