import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://192.168.1.10:8081/apis")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //LoginUser
  @POST("/user/login")
  Future<dynamic> login(@Part() String? email, @Part() String? password);

  //Registrasi
  @POST("/user/add")
  Future<dynamic> registration(@Part() String? uid, @Part() String? email,
      @Part() String? displayname, @Part() String? avatar);

  //Get Category
  @GET("/category")
  Future<dynamic> category();

  //Get Promo
  @GET("/promo")
  Future<dynamic> promo();

  //Items Reference
  @GET("/items/reference?page={page}")
  Future<dynamic> itemsreference({@Path('page') int? page});

  //Item Recommendation
  @GET("/items/reference?page={page}")
  Future<dynamic> itemsrecomendation({@Path('page') int? page});

  //Items By Category
  @POST("/items/itembycategory?page={page}")
  Future<dynamic> itemsbycategory(
      {@Path('page') int? page, @Part() int? categoryid});

  @POST("/items/search?page={page}")
  Future<dynamic> itemsearch({@Path('page') int? page, @Part() String? search});
}
