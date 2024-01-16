import 'package:advicer/domain/entities/advice_Entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advicer_repository.dart';
import 'package:dartz/dartz.dart';

class AdvicerUsecases {
  final AdvicerRepository advicerRepository;

  AdvicerUsecases({required this.advicerRepository});

  // AdvicerUsecases({required this.advicerRepository});

  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    return await advicerRepository.getAdviceFromApi();
  }

  // final AdvicerUsecases {
  //   final AdvicerRepository advicerRepository = AdvicerRepositoryImpl();
  // }
}
