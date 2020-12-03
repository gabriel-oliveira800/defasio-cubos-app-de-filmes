import 'package:connectivity/connectivity.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'connection_store.g.dart';

class ConnectionStore = _ConnectionStoreBase with _$ConnectionStore;

abstract class _ConnectionStoreBase with Store {
  _ConnectionStoreBase() {
    stream = ObservableStream(Connectivity().onConnectivityChanged);
  }

  @observable
  ObservableStream<ConnectivityResult> stream;

  @computed
  bool get connected => stream.value != ConnectivityResult.none;

  void showNetWorkingOn(BuildContext context) {
    Map data = {
      'icon:': connected ? Icons.wifi : Icons.wifi_off,
      'title': connected ? 'Conectado' : 'Conexão perdida',
      'color': connected ? Theme.of(context).accentColor : Colors.red,
      'description': connected
          ? ''
          : 'Por favor, ligue os dados móveis ou conecte-se ao wi-fi',
    };

    EdgeAlert.show(
      context,
      icon: data['icon'],
      title: data['title'],
      gravity: EdgeAlert.BOTTOM,
      backgroundColor: data['color'],
      description: data['description'],
      duration: EdgeAlert.LENGTH_SHORT,
    );
  }
}
