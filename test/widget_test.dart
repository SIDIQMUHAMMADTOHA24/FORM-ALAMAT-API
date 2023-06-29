import 'package:tes_coding_interview/data/provider/alamat_provider.dart';

void main() async {
  AlamatProvider alamatProvider = AlamatProvider();
  print(await alamatProvider.getDataKalurahan(1111121));
}
