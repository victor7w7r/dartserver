class NotFoundException implements Exception {

  const NotFoundException(this.message);

  factory NotFoundException.dummy(String id) =>
    NotFoundException('This dummy is not found with id $id');

  final String message;

}