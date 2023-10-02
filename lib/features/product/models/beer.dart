import 'package:json_annotation/json_annotation.dart';

part 'beer.g.dart';

@JsonSerializable(nullable: true)
class Beer {
  int? id;
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  double? abv;
  double? ibu;
  double? targetFg;
  double? targetOg;
  double? ebc;
  double? srm;
  double? ph;
  double? attenuationLevel;
  Volume? volume;
  Volume? boilVolume;
  Method? method;
  Ingredients? ingredients;
  List<String>? foodPairing;
  String? brewersTips;
  String? contributedBy;


@JsonKey(ignore: true)
  Beer({
    this.id,
    this.name,
    this.tagline,
    this.firstBrewed,
    this.description,
    this.imageUrl,
    this.abv,
    this.ibu,
    this.targetFg,
    this.targetOg,
    this.ebc,
    this.srm,
    this.ph,
    this.attenuationLevel,
    this.volume,
    this.boilVolume,
    this.method,
    this.ingredients,
    this.foodPairing,
    this.brewersTips,
    this.contributedBy,
  });

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  Map<String, dynamic> toJson() => _$BeerToJson(this);
}

@JsonSerializable(nullable: true)
class Volume {
  double? value;
  String? unit;

  Volume({
    this.value,
    this.unit,
  });

   factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

@JsonSerializable(nullable: true)
class Method {
  List<MashTemp>? mashTemp;
  Fermentation? fermentation;
  String? twist;

  Method({
    this.mashTemp,
    this.fermentation,
    this.twist,
  });

   factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

@JsonSerializable(nullable: true)
class MashTemp {
  Temp? temp;
  int? duration;

  MashTemp({
    this.temp,
    this.duration,
  });

   factory MashTemp.fromJson(Map<String, dynamic> json) => _$MashTempFromJson(json);

  Map<String, dynamic> toJson() => _$MashTempToJson(this);
}

@JsonSerializable(nullable: true)
class Temp {
  double? value;
  String? unit;

  Temp({
    this.value,
    this.unit,
  });

   factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}

@JsonSerializable(nullable: true)
class Fermentation {
  Temp? temp;

  Fermentation({
    this.temp,
  });

   factory Fermentation.fromJson(Map<String, dynamic> json) => _$FermentationFromJson(json);

  Map<String, dynamic> toJson() => _$FermentationToJson(this);
}

@JsonSerializable(nullable: true)
class Ingredients {
  List<Malt>? malt;
  List<Hop>? hops;
  String? yeast;

  Ingredients({
    this.malt,
    this.hops,
    this.yeast,
  });

   factory Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}

@JsonSerializable(nullable: true)
class Malt {
  String? name;
  Amount? amount;

  Malt({
    this.name,
    this.amount,
  });

   factory Malt.fromJson(Map<String, dynamic> json) => _$MaltFromJson(json);

  Map<String, dynamic> toJson() => _$MaltToJson(this);
}

@JsonSerializable(nullable: true)
class Hop {
  String? name;
  Amount? amount;
  String? add;
  String? attribute;

  Hop({
    this.name,
    this.amount,
    this.add,
    this.attribute,
  });

   factory Hop.fromJson(Map<String, dynamic> json) => _$HopFromJson(json);

  Map<String, dynamic> toJson() => _$HopToJson(this);
}

@JsonSerializable(nullable: true)
class Amount {
  double? value;
  String? unit;

  Amount({
    this.value,
    this.unit,
  });

   factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}
