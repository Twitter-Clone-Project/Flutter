
import 'package:hooks_riverpod/hooks_riverpod.dart';



abstract class HomeRepository {
}

class HomeRepositoryImpl implements HomeRepository {

}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
