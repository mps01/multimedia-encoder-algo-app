import 'package:adaproject_cryptic/algo_model.dart';

class PlanetDao {
  static final List<Planet> planets = [
    const Planet(
      id: "1",
      name: "Huffman Coding",
      location: "Tap to encode data",
      image: "assets/img/hc.png",
    ),
    const Planet(
      id: "2",
      name: "LWZ Compression",
      location: "Tap to encode, decode data",
      image: "assets/img/lwz.png",
    ),
    const Planet(
      id: "3",
      name: "2D Transform",
      location: "Tap to scale, rotate shape",
      image: "assets/img/2d.png",
    ),
  ];

  static Planet getPlanetById(id) {
    return planets.where((p) => p.id == id).first;
  }
}
