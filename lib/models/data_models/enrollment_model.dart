// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Enrollment {
  final String id;
  final String title;
  final String description;
  final String type;
  final String image;
  final DateTime time;
  final String courseId;
  final String author;
  Enrollment({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.image,
    required this.time,
    required this.courseId,
    required this.author,
  });

  Enrollment copyWith({
    String? id,
    String? title,
    String? description,
    String? type,
    String? image,
    DateTime? time,
    String? courseId,
    String? author,
  }) {
    return Enrollment(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      image: image ?? this.image,
      time: time ?? this.time,
      courseId: courseId ?? this.courseId,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'image': image,
      'time': time.millisecondsSinceEpoch,
      'courseId': courseId,
      'author': author,
    };
  }

  factory Enrollment.fromMap(Map<String, dynamic> map) {
    return Enrollment(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
      image: map['image'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      courseId: map['courseId'] as String,
      author: map['author'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Enrollment.fromJson(String source) =>
      Enrollment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Enrollment(id: $id, title: $title, description: $description, type: $type, image: $image, time: $time, courseId: $courseId, author: $author)';
  }

  @override
  bool operator ==(covariant Enrollment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.type == type &&
        other.image == image &&
        other.time == time &&
        other.courseId == courseId &&
        other.author == author;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        type.hashCode ^
        image.hashCode ^
        time.hashCode ^
        courseId.hashCode ^
        author.hashCode;
  }
}
