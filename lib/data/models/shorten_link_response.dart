import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shorten_link_response.g.dart';

@JsonSerializable()
class ShortenLinkResponse extends Equatable {
  const ShortenLinkResponse(this.alias, this.links);

  factory ShortenLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortenLinkResponseFromJson(json);

  final String alias;
  @JsonKey(name: "_links")
  final LinksResponse links;

  @override
  List<Object?> get props => [alias, links];
}

@JsonSerializable()
class LinksResponse extends Equatable {
  const LinksResponse(this.self, this.short);

  factory LinksResponse.fromJson(Map<String, dynamic> json) =>
      _$LinksResponseFromJson(json);

  final String self;
  final String short;

  @override
  List<Object?> get props => [self, short];
}
