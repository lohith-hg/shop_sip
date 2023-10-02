// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map<String, dynamic> json) => Beer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      tagline: json['tagline'] as String?,
      firstBrewed: json['first_brewed'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      abv: (json['abv'] as num?)?.toDouble(),
      ibu: (json['ibu'] as num?)?.toDouble(),
      targetFg: (json['target_fg'] as num?)?.toDouble(),
      targetOg: (json['target_og'] as num?)?.toDouble(),
      ebc: (json['ebc'] as num?)?.toDouble(),
      srm: (json['srm'] as num?)?.toDouble(),
      ph: (json['ph'] as num?)?.toDouble(),
      attenuationLevel: (json['attenuation_level'] as num?)?.toDouble(),
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
      boilVolume: json['boilVolume'] == null
          ? null
          : Volume.fromJson(json['boilVolume'] as Map<String, dynamic>),
      method: json['method'] == null
          ? null
          : Method.fromJson(json['method'] as Map<String, dynamic>),
      ingredients: json['ingredients'] == null
          ? null
          : Ingredients.fromJson(json['ingredients'] as Map<String, dynamic>),
      foodPairing: (json['foodPairing'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      brewersTips: json['brewersTips'] as String?,
      contributedBy: json['contributedBy'] as String?,
    );

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'firstBrewed': instance.firstBrewed,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'abv': instance.abv,
      'ibu': instance.ibu,
      'targetFg': instance.targetFg,
      'targetOg': instance.targetOg,
      'ebc': instance.ebc,
      'srm': instance.srm,
      'ph': instance.ph,
      'attenuationLevel': instance.attenuationLevel,
      'volume': instance.volume,
      'boilVolume': instance.boilVolume,
      'method': instance.method,
      'ingredients': instance.ingredients,
      'foodPairing': instance.foodPairing,
      'brewersTips': instance.brewersTips,
      'contributedBy': instance.contributedBy,
    };

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      mashTemp: (json['mashTemp'] as List<dynamic>?)
          ?.map((e) => MashTemp.fromJson(e as Map<String, dynamic>))
          .toList(),
      fermentation: json['fermentation'] == null
          ? null
          : Fermentation.fromJson(json['fermentation'] as Map<String, dynamic>),
      twist: json['twist'] as String?,
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'mashTemp': instance.mashTemp,
      'fermentation': instance.fermentation,
      'twist': instance.twist,
    };

MashTemp _$MashTempFromJson(Map<String, dynamic> json) => MashTemp(
      temp: json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$MashTempToJson(MashTemp instance) => <String, dynamic>{
      'temp': instance.temp,
      'duration': instance.duration,
    };

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

Fermentation _$FermentationFromJson(Map<String, dynamic> json) => Fermentation(
      temp: json['temp'] == null
          ? null
          : Temp.fromJson(json['temp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FermentationToJson(Fermentation instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      malt: (json['malt'] as List<dynamic>?)
          ?.map((e) => Malt.fromJson(e as Map<String, dynamic>))
          .toList(),
      hops: (json['hops'] as List<dynamic>?)
          ?.map((e) => Hop.fromJson(e as Map<String, dynamic>))
          .toList(),
      yeast: json['yeast'] as String?,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'malt': instance.malt,
      'hops': instance.hops,
      'yeast': instance.yeast,
    };

Malt _$MaltFromJson(Map<String, dynamic> json) => Malt(
      name: json['name'] as String?,
      amount: json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaltToJson(Malt instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

Hop _$HopFromJson(Map<String, dynamic> json) => Hop(
      name: json['name'] as String?,
      amount: json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      add: json['add'] as String?,
      attribute: json['attribute'] as String?,
    );

Map<String, dynamic> _$HopToJson(Hop instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'add': instance.add,
      'attribute': instance.attribute,
    };

Amount _$AmountFromJson(Map<String, dynamic> json) => Amount(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };
