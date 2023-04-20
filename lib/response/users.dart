// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.email,
        this.hp,
        this.firstname,
        this.lastname,
        this.grup,
        this.role,
        this.tglLahir,
        this.jenisKelamin,
        this.id,
        this.status,
        this.accountStatus,
        this.photo,
        this.toko,
    });

    String? email;
    String? hp;
    String? firstname;
    String? lastname;
    String? grup;
    String? role;
    DateTime? tglLahir;
    int? jenisKelamin;
    int? id;
    Status? status;
    Status? accountStatus;
    Photo? photo;
    Toko? toko;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        role: json["role"],
        tglLahir: json["tgl_lahir"] == null ? null : DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        id: json["id"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        accountStatus: json["account_status"] == null ? null : Status.fromJson(json["account_status"]),
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        toko: json["toko"] == null ? null : Toko.fromJson(json["toko"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "role": role,
        "tgl_lahir": "${tglLahir!.year.toString().padLeft(4, '0')}-${tglLahir!.month.toString().padLeft(2, '0')}-${tglLahir!.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "id": id,
        "status": status?.toJson(),
        "account_status": accountStatus?.toJson(),
        "photo": photo?.toJson(),
        "toko": toko?.toJson(),
    };
}

class Status {
    Status({
        this.kode,
        this.keterangan,
    });

    int? kode;
    String? keterangan;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        kode: json["kode"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
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
        this.uri,
    });

    int? id;
    String? filename;
    String? caption;
    int? width;
    int? height;
    String? contentType;
    String? uri;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        filename: json["filename"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        contentType: json["content_type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "caption": caption,
        "width": width,
        "height": height,
        "content_type": contentType,
        "uri": uri,
    };
}

class Toko {
    Toko({
        this.nama,
        this.jalan,
        this.kelurahan,
        this.kecamatan,
        this.kota,
        this.provinsi,
        this.kodepos,
        this.detailAlamat,
        this.longitude,
        this.latitude,
        this.telp,
        this.email,
        this.slogan,
        this.deskripsi,
        this.aturanBelanja,
        this.aturanRetur,
        this.id,
        this.status,
        this.logo,
    });

    String? nama;
    String? jalan;
    String? kelurahan;
    String? kecamatan;
    String? kota;
    String? provinsi;
    String? kodepos;
    String? detailAlamat;
    int? longitude;
    int? latitude;
    String? telp;
    String? email;
    String? slogan;
    String? deskripsi;
    String? aturanBelanja;
    String? aturanRetur;
    int? id;
    Status? status;
    List<Photo>? logo;

    factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        nama: json["nama"],
        jalan: json["jalan"],
        kelurahan: json["kelurahan"],
        kecamatan: json["kecamatan"],
        kota: json["kota"],
        provinsi: json["provinsi"],
        kodepos: json["kodepos"],
        detailAlamat: json["detail_alamat"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        telp: json["telp"],
        email: json["email"],
        slogan: json["slogan"],
        deskripsi: json["deskripsi"],
        aturanBelanja: json["aturan_belanja"],
        aturanRetur: json["aturan_retur"],
        id: json["id"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        logo: json["logo"] == null ? [] : List<Photo>.from(json["logo"]!.map((x) => Photo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "jalan": jalan,
        "kelurahan": kelurahan,
        "kecamatan": kecamatan,
        "kota": kota,
        "provinsi": provinsi,
        "kodepos": kodepos,
        "detail_alamat": detailAlamat,
        "longitude": longitude,
        "latitude": latitude,
        "telp": telp,
        "email": email,
        "slogan": slogan,
        "deskripsi": deskripsi,
        "aturan_belanja": aturanBelanja,
        "aturan_retur": aturanRetur,
        "id": id,
        "status": status?.toJson(),
        "logo": logo == null ? [] : List<dynamic>.from(logo!.map((x) => x.toJson())),
    };
}
