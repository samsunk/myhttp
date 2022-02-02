import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  @JsonKey(name: '_id')
  String? id;
  String? fullname;
  int? age;
  String? gender;
  String? address;
  String? photo;
  String? createdAt;

  Student(
      {this.id,
      this.fullname,
      this.age,
      this.gender,
      this.address,
      this.photo,
      this.createdAt});

  factory Student.fromJson(Map<String, dynamic> obj) => _$StudentFromJson(obj);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
