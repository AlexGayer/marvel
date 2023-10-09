import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../domain/model/hero.dart';
part 'hero_store.g.dart';

@injectable
class HeroStore = _HeroStoreBase with _$HeroStore;

abstract class _HeroStoreBase with Store {
  final Dio dio = Dio();

  @observable
  ObservableList<Hero> heroes = ObservableList<Hero>();

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @action
  Future<void> fetchHeroes() async {
    _loading = true;
    try {
      final response = await dio.get(
        'https://gateway.marvel.com:443/v1/public/characters?ts=thesoer&apikey=001ac6c73378bbfff488a36141458af2&hash=72e5ed53d1398abb831c3ceec263f18b',
      );

      final data = response.data['data']['results'];
      heroes.clear();

      for (final heroData in data) {
        final name = heroData['name'];
        final description = heroData['description'];
        final image = heroData['thumbnail']["path"];
        final extension = heroData['thumbnail']["extension"];
        final comics = heroData['comics']['items']?.map<dynamic>((item) => item['name']).toList();

        heroes.add(Hero(name: name, description: description, image: image, extension: extension, comics: comics));
      }
      _loading = false;
    } catch (e) {
      print('Erro ao buscar heróis: $e');
    }
  }
}
