class NotFoundOrFormatContentException implements Exception {

  const NotFoundOrFormatContentException(this.message, this.notFound);

  factory NotFoundOrFormatContentException.notFound(String id) =>
    NotFoundOrFormatContentException('This dummy object is not found with id $id', true);

  factory NotFoundOrFormatContentException.formatError() =>
    const NotFoundOrFormatContentException('The format of this dummy item is incorrect or their fields are empty', false);

  final String message;
  final bool notFound;
}