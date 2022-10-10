// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortenLinkResponse _$ShortenLinkResponseFromJson(Map<String, dynamic> json) =>
    ShortenLinkResponse(
      json['alias'] as String,
      LinksResponse.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShortenLinkResponseToJson(
        ShortenLinkResponse instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      '_links': instance.links,
    };

LinksResponse _$LinksResponseFromJson(Map<String, dynamic> json) =>
    LinksResponse(
      json['self'] as String,
      json['short'] as String,
    );

Map<String, dynamic> _$LinksResponseToJson(LinksResponse instance) =>
    <String, dynamic>{
      'self': instance.self,
      'short': instance.short,
    };
