import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable {
  final String? username;
  final String? email;
  final String? uid;
  final String? token;
  final String? pio;
  final String? pic;
  final List<dynamic>? whiteList;
  final List<dynamic>? blackList;
  final List<dynamic>? groups;
  final bool? isBanned;
  final bool? isPicShow;
  final bool? isPioShow;

  const UserModel({
    this.username,
    this.email,
    this.pio,
    this.pic,
    this.whiteList,
    this.blackList,
    this.isBanned,
    this.isPicShow,
    this.isPioShow,
    this.uid,
    this.token,
    this.groups,
  });

  factory UserModel.fromCredintial(UserCredential user, String tokin) {
    return UserModel(
      uid: user.user!.uid,
      blackList: const [],
      email: user.user!.email,
      isBanned: false,
      isPicShow: true,
      isPioShow: true,
      pic: null,
      pio: 'Fire Chat User',
      username: user.user!.displayName,
      whiteList: const [],
      token: tokin,
      groups: const [],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username']?.toString(),
        email: json['email']?.toString(),
        pio: json['pio']?.toString(),
        pic: json['pic']?.toString(),
        uid: json['uid']?.toString(),
        token: json['token']?.toString(),
        whiteList: List<dynamic>.from(json['whiteList'] ?? []),
        blackList: List<dynamic>.from(json['blackList'] ?? []),
        groups: List<dynamic>.from(json['groups'] ?? []),
        isBanned: json['isBanned']?.toString().contains("true"),
        isPicShow: json['isPicShow']?.toString().contains("true"),
        isPioShow: json['isPioShow']?.toString().contains("true"),
      );

  Map<String, dynamic> toJson() => {
        if (username != null) 'username': username,
        if (email != null) 'email': email,
        if (pio != null) 'pio': pio,
        if (pic != null) 'pic': pic,
        if (uid != null) 'uid': uid,
        if (token != null) 'token': token,
        if (whiteList != null) 'whiteList': whiteList,
        if (groups != null) 'groups': groups,
        if (blackList != null) 'blackList': blackList,
        if (isBanned != null) 'isBanned': isBanned,
        if (isPicShow != null) 'isPicShow': isPicShow,
        if (isPioShow != null) 'isPioShow': isPioShow,
      };

  UserModel copyWith({
    String? username,
    String? email,
    String? pio,
    String? pic,
    String? uid,
    String? token,
    List<dynamic>? whiteList,
    List<dynamic>? blackList,
    List<dynamic>? groups,
    bool? isBanned,
    bool? isPicShow,
    bool? isPioShow,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      pio: pio ?? this.pio,
      pic: pic ?? this.pic,
      uid: uid ?? this.uid,
      token: token ?? this.token,
      whiteList: whiteList ?? this.whiteList,
      blackList: blackList ?? this.blackList,
      groups: groups ?? this.groups,
      isBanned: isBanned ?? this.isBanned,
      isPicShow: isPicShow ?? this.isPicShow,
      isPioShow: isPioShow ?? this.isPioShow,
    );
  }

  @override
  List<Object?> get props {
    return [
      username,
      email,
      pio,
      pic,
      uid,
      token,
      whiteList,
      blackList,
      groups,
      isBanned,
      isPicShow,
      isPioShow,
    ];
  }
}
