import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/favourite/data/models/post_favourite_request_body.dart';
import '../../features/favourite/data/models/get_favourite_response.dart';
import '../../features/favourite/data/models/post_favourite_response.dart';
import '../../features/home/data/models/breed_response.dart';
import '../constants/api_constants.dart';
import 'api_urls.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiUrls.breeds)
  Future<List<BreedResponse>> getBreeds({
    @Query(ApiConstants.limitQueryParam) int limit = ApiConstants.defaultLimit,
    @Query(ApiConstants.pageQueryParam) int page = ApiConstants.defaultPage,
  });

  @GET(ApiUrls.breedById)
  Future<BreedResponse> getBreedById(
    @Path(ApiConstants.breedIdPathParam) String breedId,
  );

  @GET(ApiUrls.getFavourites)
  Future<List<GetFavouriteResponse>> getFavourites();

  @POST(ApiUrls.getFavourites)
  Future<PostFavouriteResponse> addFavourite({
    @Body() required PostFavouriteRequestBody postFavouriteRequestBody,
  });

  @DELETE(ApiUrls.deleteFavourite)
  Future<String> removeFavourite({
    @Path(ApiConstants.favouriteIdPathParam) required String favouriteId,
  });
}
