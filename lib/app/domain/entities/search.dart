import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final String keyword;
  final DateTime createdAt;
  const Search(
      {required this.id, required this.keyword, required this.createdAt});

  @override
  List<Object> get props => [id, keyword, createdAt];
}
