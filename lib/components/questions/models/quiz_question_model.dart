class QuizQuestionModel {
  int id;
  String? content;
  String? file;
  String expectedAnswer;
  QuizQuestionModel({
    required this.id,
    required this.content,
    required this.file,
    required this.expectedAnswer,
  });
}
