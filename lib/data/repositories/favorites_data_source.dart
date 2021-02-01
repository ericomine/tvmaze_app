import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class FavoritesDataSource {
  static const _favKey = 'favorites';

  final SharedPreferences sharedPreferences;

  FavoritesDataSource(this.sharedPreferences);

  List<int> getFavorites() {
    final saved = sharedPreferences.getStringList(_favKey) ?? <String>[];
    final result = saved
        .map((stringId) => int.tryParse(stringId))
        .where((id) => id != null)
        .toList();
    return result;
  }

  void addFavorite(int tvShowId) {
    final id = tvShowId.toString();
    final saved = sharedPreferences.getStringList(_favKey) ?? <String>[];
    if (saved.contains(id)) {
      return;
    }

    final newList = [...saved, id];
    sharedPreferences.setStringList(_favKey, newList);
  }

  void removeFavorite(int tvShowId) {
    final id = tvShowId.toString();
    final saved = sharedPreferences.getStringList(_favKey) ?? <String>[];
    final newList = saved;
    if (newList.contains(id)) {
      newList.removeWhere((item) => item == id);
      sharedPreferences.setStringList(_favKey, newList);
    }
  }

  bool isFavorite(int tvShowId) {
    final id = tvShowId.toString();
    final saved = sharedPreferences.getStringList(_favKey) ?? <String>[];
    return saved.contains(id);
  }
}
