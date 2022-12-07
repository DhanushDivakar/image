import 'package:dio/dio.dart';
import '../data/models/image_model.dart';

class ApiProvider {
  ApiProvider({required this.dio}) {
    dio.options.baseUrl = baseurl;
  }

  final Dio dio;
  final baseurl = 'https://jsonplaceholder.typicode.com';
  final path = '/photos';

  Future<List<Image>> getImages({int page = 0, int limit = 100}) async {
    final response = await dio.get(path, queryParameters: {
      '_page': page,
      '_limit': limit,
    });

    if(response.statusCode == 200){
      final images = response.data?.map<Image>((image)=> Image.fromJson(image))?.toList();
      return images;
    }

    return <Image>[];
  }
}
