// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionStore on _ConnectionStoreBase, Store {
  Computed<bool> _$connectedComputed;

  @override
  bool get connected =>
      (_$connectedComputed ??= Computed<bool>(() => super.connected,
              name: '_ConnectionStoreBase.connected'))
          .value;

  final _$streamAtom = Atom(name: '_ConnectionStoreBase.stream');

  @override
  ObservableStream<ConnectivityResult> get stream {
    _$streamAtom.reportRead();
    return super.stream;
  }

  @override
  set stream(ObservableStream<ConnectivityResult> value) {
    _$streamAtom.reportWrite(value, super.stream, () {
      super.stream = value;
    });
  }

  @override
  String toString() {
    return '''
stream: ${stream},
connected: ${connected}
    ''';
  }
}
