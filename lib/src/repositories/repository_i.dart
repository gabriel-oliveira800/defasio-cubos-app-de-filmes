abstract class RepositoryInterface {
  Future getAllMovies();
  Future searchMovie();

  Future getCategories();
  Future getMoviesByCategory(int categoryId);

}