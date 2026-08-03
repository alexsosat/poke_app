import "package:flutter_common_classes/flutter_common_classes.dart";
import "package:get_it/get_it.dart";

import "../../business/entities/pokemon_entity.dart";
import "../../business/enums/list_sort_types_enum.dart";
import "../../business/use_cases/get_pokemon_list.dart";
import "../../data/models/params/pokemon_list_params.dart";

/// Cubit to handle the loading state of the pokemon list information
class PokemonListCubit extends AutoLoaderCubit<List<PokemonEntity>> {
  /// Cubit to handle the loading state of the pokemon list information
  PokemonListCubit();

  /// Params for the pokemon list
  PokemonListParams params = PokemonListParams(
    limit: 20,
    offset: 0,
    sort: ListSortTypesEnum.id,
  );

  @override
  Future<Either<Failure, List<PokemonEntity>>> callUseCase() async =>
      GetPokemonList(repository: GetIt.I.get()).call(params: params);

  /// Changes the pokemon sorting logic
  void changePokemonSortType(ListSortTypesEnum sort) {
    params = PokemonListParams(
      sort: sort,
      offset: 0,
      limit: 20,
    );
    getInfo();
  }

  /// Queries the pokemon list with the given search term
  void changePokemonSearch(String? search) {
    params = PokemonListParams(
      sort: params.sort,
      offset: 0,
      limit: 20,
      search: search,
    );
    getInfo();
  }
}
