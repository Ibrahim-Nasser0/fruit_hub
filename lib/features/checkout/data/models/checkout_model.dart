import '../../domain/entities/checkout_entity.dart';

class CheckoutModel extends CheckoutEntity {
  const CheckoutModel({required super.id, required super.name});

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
