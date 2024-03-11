// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizQuestionModel {
  int id;
  String? content;
  String? file;
  String expectedAnswer;
  bool answerInCombine;
  QuizQuestionModel({
    required this.id,
    required this.content,
    required this.file,
    required this.expectedAnswer,
    this.answerInCombine = false,
  });

  QuizQuestionModel copyWith({
    int? id,
    String? content,
    String? file,
    String? expectedAnswer,
    bool? answerInCombine,
  }) {
    return QuizQuestionModel(
      id: id ?? this.id,
      content: content ?? this.content,
      file: file ?? this.file,
      expectedAnswer: expectedAnswer ?? this.expectedAnswer,
      answerInCombine: answerInCombine ?? this.answerInCombine,
    );
  }
}
