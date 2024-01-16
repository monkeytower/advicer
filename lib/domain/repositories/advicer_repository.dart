import 'package:advicer/domain/entities/advice_Entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdvicerRepository {
  // Future<AdviceEntity>();
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi();
}
