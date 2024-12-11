import 'package:linkyou/core/enums/socker_user_status_enum.dart';

class SocketUserStatus {
  final SockerUserStatusEnum status;
  final BigInt userId;

  SocketUserStatus({required this.status, required this.userId});

  factory SocketUserStatus.fromJson(Map<String, dynamic> json) {
    return SocketUserStatus(
      status: json['status'],
      userId: json['user_id'],
    );
  }
}
