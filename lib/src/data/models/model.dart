class WritingModel {
  final int id;
  final String number;
  final String title;
  final String question;

  WritingModel({
    required this.id,
    required this.number,
    required this.title,
    required this.question,
  });

  factory WritingModel.fromJson(Map<String, dynamic> json) {
    return WritingModel(
      id: json['id'],
      number: json['number'],
      title: json['title'],
      question: json['question'],
    );
  }
}


class ListeningSectionModel {
  final String title;
  final List<ListeningLesson> lessons;

  ListeningSectionModel({required this.title, required this.lessons});

  factory ListeningSectionModel.fromJson(Map<String, dynamic> json) {
    return ListeningSectionModel(
      title:   json['title'],
      lessons: (json['lessons'] as List)
          .map((e) => ListeningLesson.fromJson(e))
          .toList(),
    );
  }
}

class ListeningLesson {
  final String title;
  final String subtitle;
  final String audioUrl;      // ← renamed from audioAsset, now a Drive URL
  final String imageAsset;
  final List<ListeningQuestion> questions;

  ListeningLesson({
    required this.title,
    required this.subtitle,
    required this.audioUrl,
    required this.imageAsset,
    required this.questions,
  });

  factory ListeningLesson.fromJson(Map<String, dynamic> json) {
    return ListeningLesson(
      title:      json['title'],
      subtitle:   json['subtitle'],
      audioUrl:   json['audioUrl'],   // matches JSON key "audioUrl"
      imageAsset: json['imageAsset'],
      questions:  (json['questions'] as List)
          .map((e) => ListeningQuestion.fromJson(e))
          .toList(),
    );
  }
}

class ListeningQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  ListeningQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  factory ListeningQuestion.fromJson(Map<String, dynamic> json) {
    return ListeningQuestion(
      question:     json['question'],
      options:      List<String>.from(json['options']),
      correctIndex: json['correctIndex'],
    );
  }
}