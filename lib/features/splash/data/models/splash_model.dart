import '../../domain/entities/splash_entity.dart';

class SplashModel extends SplashEntity {
  const SplashModel({required super.id, required super.name});

  factory SplashModel.fromJson(Map<String, dynamic> json) {
    return SplashModel(id: json['id'] as String, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
