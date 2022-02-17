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

class MovieDetailModel extends Equatable {
  final String title;
  final String year;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final List<Ratings> ratings;
  final String imdbID;
  final String type;

  const MovieDetailModel({
    required this.title,
    required this.year,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.imdbID,
    required this.type,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        title: json["Title"] ?? "",
        year: json["Year"] ?? "",
        runtime: json["Runtime"] ?? "",
        genre: json["Genre"] ?? "",
        director: json["Director"] ?? "",
        writer: json["Writer"] ?? "",
        actors: json["Actors"] ?? "",
        plot: json["Plot"] ?? "",
        language: json["Language"] ?? "",
        country: json["Country"] ?? "",
        awards: json["Awards"] ?? "",
        poster: json["Poster"] ?? "",
        ratings: List<Ratings>.from(
            json['Ratings'].map((e) => Ratings.fromJson(e)) ?? ""),
        imdbID: json["imdbID"] ?? "",
        type: json["Type"] ?? "",
      );

  @override
  List<Object?> get props => [
        title,
        year,
        type,
        poster,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        awards,
        imdbID,
      ];
}

class Ratings extends Equatable {
  final String source;
  final String value;

  const Ratings({
    required this.source,
    required this.value,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        source: json["Source"] ?? "",
        value: json["Value"] ?? "",
      );

  @override
  List<Object?> get props => [source, value];
}
