class ListTileModel {
  final String imageUrl;
  final String title;
  final String description;

  ListTileModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory ListTileModel.fromJson(jsonData) {
    return ListTileModel(
      imageUrl: jsonData['imageUrl'], //2
      title: jsonData['text'], //4
      description: jsonData['task'], //1

      //3
    );
  }
}
