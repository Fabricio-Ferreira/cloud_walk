// ignore_for_file: public_member_api_docs, sort_constructors_first

class GetListApodParams {
  final String title;
  final String? dateInitial;
  final String? dateFinal;
  final int? count;
  final int? offset;

  GetListApodParams({
    required this.title,
    this.dateInitial,
    this.dateFinal,
    this.count,
    this.offset,
  });
}
