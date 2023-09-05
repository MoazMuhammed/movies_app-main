import 'package:movies_app/movies/domain/entities/genres.dart';

class GenersModel extends Genres {
  GenersModel({required super.id, required super.name});

  factory GenersModel.fromJson(Map<String, dynamic> json) =>
      GenersModel(id: json["id"], name: json["name"]);
}
