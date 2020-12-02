// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabStore on _TabStoreBase, Store {
  final _$currentTabAtom = Atom(name: '_TabStoreBase.currentTab');

  @override
  int get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  final _$errorAtom = Atom(name: '_TabStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_getAllCategoriesAsyncAction =
      AsyncAction('_TabStoreBase._getAllCategories');

  @override
  Future<void> _getAllCategories() {
    return _$_getAllCategoriesAsyncAction.run(() => super._getAllCategories());
  }

  final _$_TabStoreBaseActionController =
      ActionController(name: '_TabStoreBase');

  @override
  void setCurrentTab(int value) {
    final _$actionInfo = _$_TabStoreBaseActionController.startAction(
        name: '_TabStoreBase.setCurrentTab');
    try {
      return super.setCurrentTab(value);
    } finally {
      _$_TabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<Category> value) {
    final _$actionInfo = _$_TabStoreBaseActionController.startAction(
        name: '_TabStoreBase.setCategories');
    try {
      return super.setCategories(value);
    } finally {
      _$_TabStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab},
error: ${error}
    ''';
  }
}
