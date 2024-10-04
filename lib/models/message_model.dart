class Message {
  final String messageText;
  final String id;
  Message(this.messageText, this.id);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['message'], jsonData['id']);
  }
}
