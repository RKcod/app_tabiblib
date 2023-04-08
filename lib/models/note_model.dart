import 'dart:convert';

class NoteModel {
  final String title;
  final String content;
  final DateTime dateCreated;
  NoteModel({
    required this.title,
    required this.content,
    required this.dateCreated,
  });

  NoteModel copyWith({
    String? title,
    String? content,
    DateTime? dateCreated,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'NoteModel(title: $title, content: $content, dateCreated: $dateCreated)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.title == title &&
        other.content == content &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode ^ dateCreated.hashCode;
}
