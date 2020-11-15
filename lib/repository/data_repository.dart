import 'package:http_hp/models/episodes_page.dart';
import 'package:http/http.dart' as http;

abstract class DataRepository {
  Future<EpisodePage> getEpisodePage();
}

class DataRepositoryImpl extends DataRepository {
  Future<EpisodePage> getEpisodePage() async {
    EpisodePage episodePage;
    try {
      final url = 'https://rickandmortyapi.com/api/episode';
      final result = await http.get(url);

      if (result.statusCode == 200) {
        episodePage = episodePageFromJson(result.body);
      }
    } catch (err) {
      print(err.toString());
    }

    return episodePage;
  }
}
