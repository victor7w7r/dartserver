class IDExistsOrFormatContentException implements Exception {
  IDExistsOrFormatContentException(this.message, this.isId);
  final String message;
  final bool isId;
}