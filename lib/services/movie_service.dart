// ignore_for_file: avoid_print

part of 'services.dart';

class MovieService {
  static Future<MovieModel> getMovies(String title) async {
    final host = ApiUrl.baseUrl;
    final client = http.Client();
    var params = {
      "apiKey": ApiUrl.apiKey,
      "s": title,
    };

    var url = Uri.https(host, "/", params);

    var response = await client.get(url);

    // jika response gagal
    if (response.statusCode != 200) {
      throw Exception("Failed to load movies");
    }

    // jika response berhasil
    var data = jsonDecode(response.body);

    // jika data tidak kosong
    print(data);
    return MovieModel.fromJson(data);
  }

  static Future<MovieDetailModel> getMovieDetails(String movieId) async {
    final host = ApiUrl.baseUrl;
    final client = http.Client();
    var params = {
      "i": movieId,
      "apiKey": ApiUrl.apiKey,
    };

    var url = Uri.https(host, "/", params);

    var response = await client.get(url);

    // jika response gagal
    if (response.statusCode != 200) {
      throw Exception("Failed to load movies");
    }

    // jika response berhasil
    var data = jsonDecode(response.body);

    // jika data tidak kosong
    print(data);
    return MovieDetailModel.fromJson(data);
  }
}
