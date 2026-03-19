class LearningModel {
  final Map<String, WritingModel> writing;
  final Map<String, ListeningModel> listening;

  LearningModel({required this.writing, required this.listening});

  factory LearningModel.fromJson(Map<String, dynamic> json) {
    return LearningModel(
      writing: (json['writing'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, WritingModel.fromJson(value)),
      ),
      listening: (json['listening'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, ListeningModel.fromJson(value)),
      ),
    );
  }
}

class WritingModel {
  final String title;
  final String question;

  WritingModel({required this.title, required this.question});

  factory WritingModel.fromJson(Map<String, dynamic> json) {
    return WritingModel(title: json['title'], question: json['question']);
  }
}

class ListeningModel {
  final String audio;
  final List<QuestionModel> questions;

  ListeningModel({required this.audio, required this.questions});

  factory ListeningModel.fromJson(Map<String, dynamic> json) {
    return ListeningModel(
      audio: json['audio'],
      questions: (json['questions'] as List)
          .map((e) => QuestionModel.fromJson(e))
          .toList(),
    );
  }
}

class QuestionModel {
  final String question;
  final List<String> options;

  QuestionModel({required this.question, required this.options});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      options: List<String>.from(json['options']),
    );
  }
}
