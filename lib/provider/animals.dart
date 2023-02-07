import 'dart:convert';

import 'package:edugame/provider/animals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Animal with ChangeNotifier {
  final String id;
  final String namaHewan;
  final String kelas;
  final String kerajaan;
  final String description;
  final String imageUrl;
  final String ordo;
  final String ilmiah;

  Animal({
    required this.id,
    required this.namaHewan,
    required this.kelas,
    required this.kerajaan,
    required this.description,
    required this.imageUrl,
    required this.ordo,
    required this.ilmiah,
  });

// Animal.fromJson(Map<String, Object> json)
//     : this(
//         id: json['id'] as String,
//         namaHewan: json['nama'] as String,
//         kelas: json['kelas'] as String,
//         kerajaan: json['kerajaan'] as String,
//         description: json['detail'] as String,
//         imageUrl: json['imageUrl'] as String,
//         ordo: json['ordo'] as String,
//         ilmiah: json['ilmiah'] as String,
//       );
//
// Map<String, Object> toJson() {
//   return {
//     'id': this.id,
//     'nama': this.namaHewan,
//     'kelas': this.kelas,
//     'kerajaan': this.kerajaan,
//     'detail': this.description,
//     'imageUrl': this.imageUrl,
//     'ordo': this.ordo,
//     'ilmiah': this.ilmiah,
//   };
// }
}

class AnimalList with ChangeNotifier {
  // static CollectionReference animals =
  //     FirebaseFirestore.instance.collection('fauna');
  //
  // Future<void> getAnimals() async {
  //   final animals = FirebaseFirestore.instance.collection('fauna').doc();
  //   try {
  //     animals.get().then((DocumentSnapshot snapshot) {
  //       final data = snapshot.data() as Map<String, dynamic>;
  //       final List<Animal> loadAnimal = [];
  //       data.forEach((animalId, animalData) {
  //         loadAnimal.add(
  //           Animal(
  //             id: animalId,
  //             namaHewan: animalData['nama'],
  //             kelas: animalData['kelas'],
  //             kerajaan: animalData['kerajaan'],
  //             jenisHewan: List.from(animalData['jenis']),
  //             description: animalData['detail'],
  //             imageUrl: animalData['imageUrl'],
  //             ordo: animalData['ordo'],
  //             ilmiah: animalData['ilmiah'],
  //           ),
  //         );
  //       });
  //       _list = loadAnimal;
  //       notifyListeners();
  //     });
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  final List<String> _jenis = [];

  List<String> get jenis{
    return [..._jenis];
  }

  Future<void> getAnimals() async {
    final url = Uri.parse(
        'https://flora-dan-fauna-default-rtdb.firebaseio.com/hewan.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Animal> loadAnimals = [];
      extractedData.forEach((animalId, animalData) {
        loadAnimals.add(
          Animal(
            id: animalId,
            namaHewan: animalData['nama'],
            kelas: animalData['kelas'],
            kerajaan: animalData['kerajaan'],
            description: animalData['deskripsi'],
            imageUrl: animalData['imageUrl'],
            ordo: animalData['ordo'],
            ilmiah: animalData['namaIlmiah']
          ),
        );
      });
      _list = loadAnimals;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  List<Animal> _list = [
    // Animal(
    //   id: '1',
    //   namaHewan: 'Singa',
    //   kelas: 'Mamalia',
    //   kerajaan: 'Hutan',
    //   ordo: 'Karnivora',
    //   ilmiah: 'Singa',
    //   description: 'LorenIpsum',
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/800px-Lion_waiting_in_Namibia.jpg',
    // ),
    // Animal(
    //   id: '2',
    //   namaHewan: 'Hyena',
    //   kelas: 'Mamalia',
    //   kerajaan: 'Hutan',
    //   ordo: 'Karnivora',
    //   ilmiah: 'Hyena',
    //   description: 'LorenIpsum',
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/a/a4/Striped_hyena_%28Hyaena_hyaena%29_-_cropped.jpg',
    // ),
  ];

  List<Animal> get list {
    return [..._list];
  }

  Animal findById(String id) {
    return _list.firstWhere((animal) => animal.id == id);
  }
}
