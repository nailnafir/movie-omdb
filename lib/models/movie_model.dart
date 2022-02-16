part of 'models.dart';

class MovieModel extends Equatable {
  final List<MovieSearch> search;

  const MovieModel({required this.search});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      search: List<MovieSearch>.from(
          json['Search'].map((e) => MovieSearch.fromJson(e)) ?? ""),
    );
  }

  @override
  List<Object?> get props => [search];
}

class MovieSearch extends Equatable {
  final String title;
  final String year;
  final String imdbid;
  final String type;
  final String poster;

  const MovieSearch({
    required this.title,
    required this.year,
    required this.imdbid,
    required this.type,
    required this.poster,
  });

  factory MovieSearch.fromJson(Map<String, dynamic> json) => MovieSearch(
        title: json["Title"] ?? "",
        year: json["Year"] ?? "",
        imdbid: json["imdbID"] ?? "",
        type: json["Type"] ?? "",
        poster: json["Poster"] ?? "",
      );

  @override
  List<Object?> get props => [title, year, imdbid, type, poster];
}
