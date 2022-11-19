class NotFoundOrFormatContentException implements Exception {
  NotFoundOrFormatContentException(this.message, this.notFound);
  final String message;
  final bool notFound;
}