import 'package:oboe/oboe.dart';
import 'package:localstorage/localstorage.dart';

class HistoryController extends Oboe {
  final history = {};
  final storage = LocalStorage('history');

  void addHistory(object, item) {
    final now = DateTime.now();
    history[now.microsecondsSinceEpoch.toString()] = object;
    storage.setItem('history', history);
    next();
  }
}

final historyController = HistoryController();
