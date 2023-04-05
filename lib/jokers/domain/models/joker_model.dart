class JokerModel {
  List<dynamic>? categories;
  String? createdAt;
  String? iconUrl;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  JokerModel(
      {this.categories,
        this.createdAt,
        this.iconUrl,
        this.id,
        this.updatedAt,
        this.url,
        this.value});

  JokerModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = json['categories'];
    }
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

}
