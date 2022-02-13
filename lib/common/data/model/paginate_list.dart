import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PaginateList<T> extends Equatable {
  final List<T> list;
  final int currentPage;
  final int totalPage;
  final int perPage;

  PaginateList({
    @required this.list,
    @required this.currentPage,
    @required this.totalPage,
    @required this.perPage,
  });

  factory PaginateList.fromJson(Map<String, dynamic> json, Function makeObject) {
    final output = PaginateList(
      list: (json['data'] as List).map((e) => (makeObject(e) as T)).toList(),
      totalPage: json['last_page'] == null ? 1 : (json['last_page'] as num).toInt() ?? 1,
      currentPage: json['current_page'] == null ? 1 : (json['current_page'] as num).toInt() ?? 1,
      perPage: json['current_page'] == null ? 1 : int.parse(json['per_page'].toString().trim()) ?? 1000,
    );
    return output;
  }

  @override
  List<Object> get props => [currentPage, totalPage, perPage, list];
}
