import 'package:hive/hive.dart';

part 'interest_hive.g.dart';

@HiveType(typeId: 0)
class InterestHive extends HiveObject{
  @HiveField(0)
  late String? id;
  @HiveField(1)
  late int? createdAt;
  @HiveField(2)
  late int? updatedAt;
  @HiveField(3)
  late String? name;
  @HiveField(4)
  late String? icon;
}
