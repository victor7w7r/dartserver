import 'package:fpdart/fpdart.dart';

abstract class DummyRepository {

  Task<List<Map<String, Object?>>> findAll();
  TaskOption<Map<String, Object?>> findById(String id);
  TaskOption<Map<String, Object?>> saveNullCheck(Map<String, dynamic> dummy);
  TaskOption<Map<String, Object?>> replace(Map<String, dynamic> dummy, String id);
  TaskOption<String> delete(String id);
  Task<void> deleteAll();

}