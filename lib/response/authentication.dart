// To parse this JSON data, do
//
//     final authentication = authenticationFromJson(jsonString);

import 'dart:convert';

Authentication authenticationFromJson(String str) => Authentication.fromJson(json.decode(str));

String authenticationToJson(Authentication data) => json.encode(data.toJson());

class Authentication {
    Authentication({
        this.id,
        this.email,
        this.hp,
        this.firstname,
        this.lastname,
        this.grup,
        this.tglLahir,
        this.jenisKelamin,
        this.referralCode,
        this.status,
        this.accountStatus,
        this.officialRepresentative,
        this.photo,
        this.toko,
        this.createdAt,
        this.updatedAt,
        this.referredBy,
        this.statusBlokir,
    });

    int? id;
    String? email;
    String? hp;
    String? firstname;
    String? lastname;
    String? grup;
    DateTime? tglLahir;
    AccountStatus? jenisKelamin;
    String? referralCode;
    AccountStatus? status;
    AccountStatus? accountStatus;
    AccountStatus? officialRepresentative;
    Photo? photo;
    dynamic toko;
    CreatedAt? createdAt;
    dynamic updatedAt;
    dynamic referredBy;
    dynamic statusBlokir;

    factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        id: json["id"],
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        tglLahir: json["tgl_lahir"] == null ? null : DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: json["jenis_kelamin"] == null ? null : AccountStatus.fromJson(json["jenis_kelamin"]),
        referralCode: json["referral_code"],
        status: json["status"] == null ? null : AccountStatus.fromJson(json["status"]),
        accountStatus: json["account_status"] == null ? null : AccountStatus.fromJson(json["account_status"]),
        officialRepresentative: json["official_representative"] == null ? null : AccountStatus.fromJson(json["official_representative"]),
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        toko: json["toko"],
        createdAt: json["created_at"] == null ? null : CreatedAt.fromJson(json["created_at"]),
        updatedAt: json["updated_at"],
        referredBy: json["referred_by"],
        statusBlokir: json["status_blokir"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "tgl_lahir": "${tglLahir!.year.toString().padLeft(4, '0')}-${tglLahir!.month.toString().padLeft(2, '0')}-${tglLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin?.toJson(),
        "referral_code": referralCode,
        "status": status?.toJson(),
        "account_status": accountStatus?.toJson(),
        "official_representative": officialRepresentative?.toJson(),
        "photo": photo?.toJson(),
        "toko": toko,
        "created_at": createdAt?.toJson(),
        "updated_at": updatedAt,
        "referred_by": referredBy,
        "status_blokir": statusBlokir,
    };
}

class AccountStatus {
    AccountStatus({
        this.kode,
        this.keterangan,
    });

    int? kode;
    String? keterangan;

    factory AccountStatus.fromJson(Map<String, dynamic> json) => AccountStatus(
        kode: json["kode"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
    };
}

class CreatedAt {
    CreatedAt({
        this.waktu,
        this.waktuIndonesia,
    });

    DateTime? waktu;
    String? waktuIndonesia;

    factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
        waktu: json["waktu"] == null ? null : DateTime.parse(json["waktu"]),
        waktuIndonesia: json["waktu_indonesia"],
    );

    Map<String, dynamic> toJson() => {
        "waktu": waktu?.toIso8601String(),
        "waktu_indonesia": waktuIndonesia,
    };
}

class Photo {
    Photo({
        this.id,
        this.filename,
        this.caption,
        this.width,
        this.height,
        this.contentType,
        this.storage,
        this.uri,
    });

    int? id;
    String? filename;
    String? caption;
    int? width;
    int? height;
    String? contentType;
    String? storage;
    String? uri;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        filename: json["filename"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        contentType: json["content_type"],
        storage: json["storage"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "caption": caption,
        "width": width,
        "height": height,
        "content_type": contentType,
        "storage": storage,
        "uri": uri,
    };
}
