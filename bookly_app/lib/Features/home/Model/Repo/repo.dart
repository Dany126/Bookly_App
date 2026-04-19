abstract class Repo {
  Future<void> fetchBestSellerBooks();
  Future<void> fetchFeaturedBooks();
  Future<void> fetchSimilarBooks();
  Future<void> fetchSearchBooks(String search);
}
