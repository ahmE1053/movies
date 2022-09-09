class AppConstants {
  static const baseurl = 'https://api.themoviedb.org/3/';
  static const getPopularMovies = 'movie/popular?api_key=';
  static const getTopRatedMovies = 'movie/top_rated?api_key=';
  static const getNowPlayingMovies = 'movie/now_playing?api_key=';
  static const recommendedUrl = 'recommendations?api_key=';
  static const apiKey = 'b1a2878711335b4775f1cbce8110c67f';
  static const getNowPlayingMoviesUrl = '$baseurl$getNowPlayingMovies$apiKey';
  static const getTopRatedMoviesUrl = '$baseurl$getTopRatedMovies$apiKey';
  static const getPopularMoviesUrl = '$baseurl$getPopularMovies$apiKey';
  static String getMovieRecommendations(String movieId) =>
      '${baseurl}movie/$movieId/$recommendedUrl$apiKey';
  static String getMovieDetails(String movieId) =>
      '${baseurl}movie/$movieId?api_key=$apiKey';
}
