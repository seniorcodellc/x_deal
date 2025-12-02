import '../../data/repositories/profile_repo_impl.dart';
import 'package:x_deal/exports.dart';

import '../repositories/profile_repo.dart';

class ProfileUseCases extends GenericUseCases{
  ProfileRepo profileRepo;
  ProfileUseCases({required this.profileRepo}):super(genericRepo:profileRepo);

}
