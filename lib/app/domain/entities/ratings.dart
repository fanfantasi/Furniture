import 'package:equatable/equatable.dart';
import 'package:home_decor/app/data/model/ratings.dart';

class Ratings extends Equatable {
  final bool status;
  final ResultRatingsModel? result;
  const Ratings({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultRatings extends Equatable {
  final int? id;
  final String? displayname;
  final String? avatar;
  final String? rating;
  final String? features;
  final String? quality;
  final String? review;
  final DateTime? createdAt;
  const ResultRatings(
      {this.id,
      this.displayname,
      this.avatar,
      this.rating,
      this.features,
      this.quality,
      this.review,
      this.createdAt});

  @override
  List<Object> get props => [
        id!,
        displayname!,
        avatar!,
        rating!,
        features!,
        quality!,
        review!,
        createdAt!
      ];
}
