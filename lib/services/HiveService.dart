import 'package:hive/hive.dart';
part 'HiveService.g.dart';

@HiveType(typeId: 0)
class HiveService {

  @HiveField(0)
  int highScore;

  HiveService({this.highScore});
}