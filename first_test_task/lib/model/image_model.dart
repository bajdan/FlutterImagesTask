class ImageModel{
  String id;
  String urlSmall;

  ImageModel({required this.id, required this.urlSmall});

  factory ImageModel.fromJson(Map<String, dynamic> json){
    return ImageModel(id: json['id'], urlSmall: json['urls']['small']);
  }
}