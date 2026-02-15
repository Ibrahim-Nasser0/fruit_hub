import '../../domain/entities/orders_entity.dart';

class OrdersModel extends OrdersEntity {
  const OrdersModel({required super.id, required super.name});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(id: json['id'] as String, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
