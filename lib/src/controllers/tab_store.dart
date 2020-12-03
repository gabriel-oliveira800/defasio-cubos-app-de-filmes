import 'package:movies/src/repositories/movies_repository_i.dart';
import 'package:movies/src/erros/failure.dart';
import 'package:movies/src/models/category.dart';
import 'package:mobx/mobx.dart';
part 'tab_store.g.dart';

class TabStore = _TabStoreBase with _$TabStore;

abstract class _TabStoreBase with Store {
  final MoviesRepositoryInterface repository;

  _TabStoreBase(this.repository) {
    autorun((_){
      _getAllCategories();
    });
  }

  @observable
  int currentTab = 0;

  @action
  void setCurrentTab(int value) => currentTab = value;

  ObservableList<Category> categories = ObservableList<Category>();

  @action
  void setCategories(List<Category> value) {
    categories = ObservableList.of(value);
  }

  @observable
  String error;

  @action
  Future<void> _getAllCategories() async {
    try {
      
      var result = await repository.getCategories();
      if (result != null) categories = ObservableList<Category>.of(result);

    } on ResponseError catch (e) {
      error = e.message;
    }
  }
}
