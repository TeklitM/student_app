part of core;

class StudentData {
  List<Student>? students;
  Student? student;
  String? status;

  StudentData({this.students, this.student, this.status, this.message});

  String? message;


  factory StudentData.fromJson(Map<String, dynamic> json) => _$StudentDataFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDataToJson(this);
}

class Student {
  String? id;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? image;
  // String? _id;

  Student({this.id,this.firstName,this.lastName,this.dateOfBirth,this.image});

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, String> toJson() => _$StudentToJson(this);
}

StudentData _$StudentDataFromJson(Map<String, dynamic> json) => StudentData(
  students: (json['students'] as List<dynamic>?)
      ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
      .toList(),
  student: (json['student'] == null ? null:Student.fromJson(json['student'] )),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$StudentDataToJson(StudentData instance) =>
    <String, dynamic>{
      'students': instance.students,
      'status': instance.status,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
  // id:json['id'] as int?,
  id:(json['id'] as int?).toString(),
  firstName:json['firstName'] as String?,
  lastName:json['lastName'] as String?,
  dateOfBirth:json['dateOfBirth'] as String?,
  image:json['image'] as String?,
);

Map<String, String> _$StudentToJson(Student instance) => <String, String>{
  'id': instance.id ?? "",
  'firstName': instance.firstName ?? "",
  'lastName': instance.lastName ?? "",
  'dateOfBirth': instance.dateOfBirth ?? "",
  // 'image': instance.image,
};
