// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Course {
  final String title;
  final String backgroundImage;
  final String description;
  final double price;
  final DateTime date;
  final String id;
  final String author;
  final String type;
  Course({
    required this.title,
    required this.backgroundImage,
    required this.description,
    required this.price,
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
    return 'Course(title: $title, backgroundImage: $backgroundImage, description: $description, price: $price, date: $date, id: $id, author: $author, type: $type)';
  }

  @override
  bool operator ==(covariant Course other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.backgroundImage == backgroundImage &&
        other.description == description &&
        other.price == price &&
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
        date.hashCode ^
        id.hashCode ^
        author.hashCode ^
        type.hashCode;
  }

  static Course dummyData = Course(
    type: 'PHY',
    author: 'John Kennedy',
    backgroundImage:
        'https://images.unsplash.com/photo-1610720707798-6fe21dc165ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2030&q=80',
    date: DateTime.now(),
    description:
        'Exercitation pariatur sit occaecat exercitation aliqua nostrud pariatur nulla ut. Ad consectetur proident cillum eu sunt est ut. Occaecat anim officia cupidatat reprehenderit tempor sint laboris eu magna. Aliquip sunt pariatur aute minim laboris qui dolor Lorem enim ex dolore commodo sunt. Ipsum adipisicing proident veniam duis laborum aute ullamco ipsum sunt dolore reprehenderit esse ea pariatur. Mollit irure in incididunt commodo magna anim excepteur ullamco laborum sint nulla ea amet.',
    id: '01',
    price: 100,
    title: 'Nuclear Physics',
  );
}
