import '../../domain/entities/on_boarding_entity.dart';

class OnBoardingModel extends OnBoardingEntity {
  const OnBoardingModel({required super.id, required super.name});

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
