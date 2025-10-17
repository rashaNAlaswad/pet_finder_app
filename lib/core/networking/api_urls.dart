class ApiUrls {
  ApiUrls._();
  static const String baseUrl = "https://api.thecatapi.com/v1/";
  static const String breeds = 'breeds';
  static const String breedById = 'breeds/{breed_id}';
  static const String getFavourites = 'favourites';
  static const String deleteFavourite = 'favourites/{favourite_id}';
}
