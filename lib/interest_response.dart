class InterestResponse {
  int? code;
  String? status;
  String? description;
  List<Interests>? interests;

  InterestResponse({this.code, this.status, this.description, this.interests});

  InterestResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    description = json['description'];
    if (json['interests'] != null) {
      interests = <Interests>[];
      json['interests'].forEach((v) {
        interests!.add(Interests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['description'] = description;
    if (interests != null) {
      data['interests'] = interests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Interests {
  int? createdAt;
  int? updatedAt;
  String? id;
  String? name;
  String? icon;

  Interests({this.createdAt, this.updatedAt, this.id, this.name, this.icon});

  Interests.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}