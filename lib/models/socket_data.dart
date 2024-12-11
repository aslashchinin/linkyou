class SocketData {
  final String cmd;
  final dynamic data;

  SocketData({
    required this.cmd,
    required this.data,
  });

  factory SocketData.fromJson(Map<String, dynamic> json) {
    return SocketData(
      cmd: json['cmd'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cmd': cmd,
      'data': data,
    };
  }
}