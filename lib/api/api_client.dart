import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'api_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("Login")
  Future<dynamic> signIn();


}
