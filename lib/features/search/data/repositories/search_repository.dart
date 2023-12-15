import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/web_services/http_client.dart';
import '../../../../web_services/end_points.dart';

abstract class SearchRepository {
  Future<TrendingList> fetchTrendingData();
  Future<UsersList> searchUsers({
    required String query,
  });
}

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<TrendingList> fetchTrendingData() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getTrendingData());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TrendingList.fromJson(response.data);
      }
      return const TrendingList(data: []);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UsersList> searchUsers({required String query}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.searchUsers(query));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UsersList.fromJson(response.data);
      }
      return const UsersList(data: []);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UsersList> searchTweets({required String query}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.searchTweets(query));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UsersList.fromJson(response.data);
      }
      return const UsersList(data: []);
    } catch (e) {
      rethrow;
    }
  }
}

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl();
});
