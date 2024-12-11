enum SocketPacketEnum {
  userOnline('user_online'),
  userOffline('user_offline'),
  newMessage('message_new'),
  newVisit('visit_new');

  final String value;

  const SocketPacketEnum(this.value);
}
