import 'package:edugame/provider/plants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Plant with ChangeNotifier {
  final String id;
  final String nama;
  final String namaLatin;
  final String kelas;
  final String kerajaan;
  final String deskripsi;
  final String imageUrl;

  Plant({
    required this.id,
    required this.nama,
    required this.namaLatin,
    required this.kelas,
    required this.kerajaan,
    required this.deskripsi,
    required this.imageUrl,
  });
}

class PlantList with ChangeNotifier {
  List<Plant> _list = [];

  List<Plant> get list {
    return [..._list];
  }

  Future<void> getPlants() async {
    final url = Uri.parse(
        'https://flora-dan-fauna-default-rtdb.firebaseio.com/tumbuhan.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Plant> loadPlants = [];
      extractedData.forEach((plantId, plantData) {
        loadPlants.add(
          Plant(
            id: plantId,
            nama: plantData['nama'],
            namaLatin: plantData['namaLatin'],
            kelas: plantData['kelas'],
            kerajaan: plantData['kerajaan'],
            deskripsi: plantData['deskripsi'],
            imageUrl: plantData['imageUrl'],
          ),
        );
      });
      _list = loadPlants;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Plant findById(String id) {
    return _list.firstWhere((animal) => animal.id == id);
  }
}
