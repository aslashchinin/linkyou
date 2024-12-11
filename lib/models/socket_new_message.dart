class SocketNewMessage {
  final BigInt userId;
  final BigInt messageId;
  final BigInt dialogId;

  SocketNewMessage({
    required this.userId,
    required this.messageId,
    required this.dialogId,
  });

  factory SocketNewMessage.fromJson(Map<String, dynamic> json) {
    return SocketNewMessage(
      userId: BigInt.from(json['userId']),
      messageId: BigInt.from(json['messageId']),
      dialogId: BigInt.from(json['dialogId']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dialogId': dialogId,
      'userId': userId,
      'messageId': messageId,
    };
  }
}
