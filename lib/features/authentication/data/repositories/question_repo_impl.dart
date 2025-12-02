import 'package:x_deal/config/failures/failure.dart';
import 'package:x_deal/config/helpers/network_helper.dart';
import 'package:x_deal/config/network/model/response_model.dart';
import 'package:x_deal/features/authentication/data/data_source/question_remote_data_source.dart';
import 'package:x_deal/features/authentication/domain/repositories/question_repo.dart';
import 'package:dartz/dartz.dart';

class QuestionRepoImpl extends QuestionRepo{
  final QuestionRemoteDataSource questionRemoteDataSource;
  QuestionRepoImpl({required this.questionRemoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> getData({num? id, query})=>executeImpl(() => questionRemoteDataSource.getData(),);
}