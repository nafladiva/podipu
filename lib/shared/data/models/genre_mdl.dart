import 'package:equatable/equatable.dart';

class GenreMdl extends Equatable {
  final int id;
  final String name;

  const GenreMdl({
    required this.id,
    required this.name,
  });

  factory GenreMdl.fromMap(Map<String, dynamic> json) {
    return GenreMdl(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
