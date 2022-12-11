class IDExistsOrFormatContentException implements Exception {

  const IDExistsOrFormatContentException(this.message, this.isId);

  factory IDExistsOrFormatContentException.idExists() =>
    const IDExistsOrFormatContentException('This id already exists', true);

  factory IDExistsOrFormatContentException.formatError() =>
    const IDExistsOrFormatContentException('The format of this dummy item is incorrect or their fields are empty', false);

  final String message;
  final bool isId;
}