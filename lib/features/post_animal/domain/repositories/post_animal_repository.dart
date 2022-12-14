import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/post_animal/domain/entities/post_animal_entity.dart';

abstract class PostAnimalRepository {
  Future<Either<Failure, PostAnimalEntity>> postAnimal({
    String? name,
    String? age,
    String? sex,
    required String species,
    String? breed,
    required String color,
    required String contact,
    required String city,
    required String countrystate,
    required String address,
    required String postType,
  });
}
