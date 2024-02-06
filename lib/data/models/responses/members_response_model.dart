
import 'package:meta/meta.dart';
import 'dart:convert';

class MemberResponModel {
  final List<Members> data;
  final Meta meta;

  MemberResponModel({
    required this.data,
    required this.meta,
  });

  factory MemberResponModel.fromJson(String str) =>
      MemberResponModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MemberResponModel.fromMap(Map<String, dynamic> json) =>
      MemberResponModel(
        data: List<Members>.from(json["data"].map((x) => Members.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class Members {
  final int id;
  final DatumAttributes attributes;

  Members({
    required this.id,
    required this.attributes,
  });

  factory Members.fromJson(String str) => Members.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Members.fromMap(Map<String, dynamic> json) => Members(
        id: json["id"],
        attributes: DatumAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class DatumAttributes {
  final String nama;
  final String noMember;
  final String alamat;
  final String noTelepon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final Foto foto;

  DatumAttributes({
    required this.nama,
    required this.noMember,
    required this.alamat,
    required this.noTelepon,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.foto,
  });

  factory DatumAttributes.fromJson(String str) =>
      DatumAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumAttributes.fromMap(Map<String, dynamic> json) => DatumAttributes(
        nama: json["nama"],
        noMember: json["no_member"],
        alamat: json["alamat"],
        noTelepon: json["no_telepon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        foto: Foto.fromMap(json["foto"]),
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "no_member": noMember,
        "alamat": alamat,
        "no_telepon": noTelepon,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "foto": foto.toMap(),
      };
}

class Foto {
  final Data data;

  Foto({
    required this.data,
  });

  factory Foto.fromJson(String str) => Foto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Foto.fromMap(Map<String, dynamic> json) => Foto(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final int id;
  final DataAttributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class DataAttributes {
  final String name;
  final dynamic alternativeText;
  final dynamic caption;
  final int width;
  final int height;
  final Formats formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final dynamic previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  DataAttributes({
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataAttributes.fromJson(String str) =>
      DataAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataAttributes.fromMap(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toMap(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Formats {
  final Large thumbnail;
  final Large medium;
  final Large small;
  final Large large;

  Formats({
    required this.thumbnail,
    required this.medium,
    required this.small,
    required this.large,
  });

  factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        thumbnail: Large.fromMap(json["thumbnail"]),
        medium: Large.fromMap(json["medium"]),
        small: Large.fromMap(json["small"]),
        large: Large.fromMap(json["large"]),
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail.toMap(),
        "medium": medium.toMap(),
        "small": small.toMap(),
        "large": large.toMap(),
      };
}

class Large {
  final String name;
  final String hash;
  final String ext;
  final String mime;
  final dynamic path;
  final int width;
  final int height;
  final double size;
  final String url;

  Large({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.path,
    required this.width,
    required this.height,
    required this.size,
    required this.url,
  });

  factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Large.fromMap(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
      };
}

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination.toMap(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

