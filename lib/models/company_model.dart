class CompanyModel{
  int id;
  String? logo;
  String name;

  CompanyModel({required this.id, this.logo, required this.name});

  factory CompanyModel.fromJson(Map<String,dynamic> json){
    return CompanyModel(id: json['id'], name: json['name'], logo: json['logo_path']);
  }
}