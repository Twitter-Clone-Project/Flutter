
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import '../models/home_response.dart';



abstract class HomeRepository {
  getTimeline(int page);
  Future<void> addTweet({required String tweetText,
    String? attachments});
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  getTimeline(int page) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getTimelineData(page));

      if(response.statusCode == 200||response.statusCode == 201){
        return HomeResponse.fromJson(response.data);
      }
      return const HomeResponse(data: [],total:0);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTweet(
      {required String tweetText,
        String? attachments
      }) async {
    try {
      FormData data = FormData.fromMap({
        "tweetText": tweetText,
        "attachments": null
        // "attachments": await MultipartFile.fromFile(attachments!, filename: path.basename(attachments),),

      });

      var response = await HttpClient.dio.post(EndPoints.addTweet, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {

      }
      throw(response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
