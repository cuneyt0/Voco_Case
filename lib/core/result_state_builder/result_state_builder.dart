import 'package:flutter/material.dart';
import 'package:voco_case/core/freezed/result_state.dart';

typedef CompletedWidget<T> = Widget Function(T);

class ResultStateBuilder<T, E extends Exception> extends StatelessWidget {
  final ResultState<T, E> resultState;
  final CompletedWidget<T> completed;
  const ResultStateBuilder(
      {Key? key, required this.resultState, required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return resultState.when(idle: () {
      return Container();
    }, pending: () {
      return const Center(child: CircularProgressIndicator.adaptive());
    }, completed: (data) {
      return completed(data);
    }, failed: (error, textColor) {
      return Text(error.toString());
    }, empty: (color) {
      return Center(
          child: Text(
        "Gösterilecek Bir Sonuç Bulunamadı.",
        style: TextStyle(fontSize: 16, color: color ?? Colors.black),
      ));
    });
  }
}
