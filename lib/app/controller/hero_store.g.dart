// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HeroStore on _HeroStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_HeroStoreBase.loading'))
      .value;

  late final _$heroesAtom =
      Atom(name: '_HeroStoreBase.heroes', context: context);

  @override
  ObservableList<Hero> get heroes {
    _$heroesAtom.reportRead();
    return super.heroes;
  }

  @override
  set heroes(ObservableList<Hero> value) {
    _$heroesAtom.reportWrite(value, super.heroes, () {
      super.heroes = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_HeroStoreBase._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$fetchHeroesAsyncAction =
      AsyncAction('_HeroStoreBase.fetchHeroes', context: context);

  @override
  Future<void> fetchHeroes() {
    return _$fetchHeroesAsyncAction.run(() => super.fetchHeroes());
  }

  @override
  String toString() {
    return '''
heroes: ${heroes},
loading: ${loading}
    ''';
  }
}
