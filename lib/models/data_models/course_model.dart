// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  final String title;
  final String backgroundImage;
  final String description;
  final double price;
  final int chapters;
  final DateTime date;
  final String id;
  final String author;
  final String type;
  Course({
    required this.title,
    required this.backgroundImage,
    required this.description,
    required this.price,
    required this.chapters,
    required this.date,
    required this.id,
    required this.author,
    required this.type,
  });

  Course copyWith({
    String? title,
    String? backgroundImage,
    String? description,
    double? price,
    int? chapters,
    DateTime? date,
    String? id,
    String? author,
    String? type,
  }) {
    return Course(
      title: title ?? this.title,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      description: description ?? this.description,
      price: price ?? this.price,
      chapters: chapters ?? this.chapters,
      date: date ?? this.date,
      id: id ?? this.id,
      author: author ?? this.author,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'backgroundImage': backgroundImage,
      'description': description,
      'price': price,
      'chapters': chapters,
      'date': date.millisecondsSinceEpoch,
      'id': id,
      'author': author,
      'type': type,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      title: map['title'] as String,
      backgroundImage: map['backgroundImage'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      chapters: map['chapters'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      id: map['id'] as String,
      author: map['author'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Course(title: $title, backgroundImage: $backgroundImage, description: $description, price: $price, chapters: $chapters, date: $date, id: $id, author: $author, type: $type)';
  }

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.backgroundImage == backgroundImage &&
        other.description == description &&
        other.price == price &&
        other.chapters == chapters &&
        other.date == date &&
        other.id == id &&
        other.author == author &&
        other.type == type;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        backgroundImage.hashCode ^
        description.hashCode ^
        price.hashCode ^
        chapters.hashCode ^
        date.hashCode ^
        id.hashCode ^
        author.hashCode ^
        type.hashCode;
  }
}
