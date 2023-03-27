import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String country;
  final String localtime;

  Location(this.name, this.country, this.localtime);

  @override
  List<Object?> get props => [name, country, localtime];
}
