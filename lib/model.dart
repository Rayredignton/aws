class CityModel{

  final name;
  final state;
  final description;
  final mayor;
  final population;

  

  CityModel({this.description,this.mayor,this.name,this.population,this.state});

  factory CityModel.fromJson(final json){
    return CityModel(
      name: json["name"],
      state: json["state"],
      description: json["description"],
      mayor: json["mayor"],
      population: json[" population"]
    );
  }

} 