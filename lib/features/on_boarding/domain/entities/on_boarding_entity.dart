import 'package:equatable/equatable.dart';

class OnBoardingEntity extends Equatable {
  final String id;
  final String name;

  const OnBoardingEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
