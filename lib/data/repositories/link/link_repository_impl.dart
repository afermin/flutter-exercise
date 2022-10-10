import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nubank_exercise/data/apis/link_api.dart';
import 'package:nubank_exercise/data/repositories/link/link_repository.dart';
import 'package:nubank_exercise/domain/entities/link.dart';
import 'package:nubank_exercise/domain/models/failure.dart';

@Injectable(as: LinkRepository)
class LinkRepositoryImpl extends LinkRepository {
  LinkRepositoryImpl(this.linkApi);

  final LinkApi linkApi;

  @override
  Future<Either<Failure, Link>> shortenLink(String link) async {
    final response = await linkApi.shortenLink(link);

    return response.map(
      (shortenLinkResponse) => Link(
        alias: shortenLinkResponse.alias,
        self: shortenLinkResponse.links.self,
        short: shortenLinkResponse.links.short,
      ),
    );
  }
}
