class Message {
  String id;
  String senderID;
  String sendTime;
  bool readed;
  String image;
  String file;
  String text;

  Message({
    required this.id,
    required this.senderID,
    required this.text,
    required this.file,
    required this.image,
    required this.readed,
    required this.sendTime,
  });
}