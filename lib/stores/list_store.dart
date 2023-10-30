import 'package:listamobx/stores/todo_store.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = "";

  @observable
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

  @computed
  bool get isFormValid => newTodoTitle.isEmpty;
}
