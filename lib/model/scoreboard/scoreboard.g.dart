// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScoreboardModelCollection on Isar {
  IsarCollection<ScoreboardModel> get scoreboardModels => this.collection();
}

const ScoreboardModelSchema = CollectionSchema(
  name: r'ScoreboardModel',
  id: 4355511326639681724,
  properties: {
    r'cards': PropertySchema(
      id: 0,
      name: r'cards',
      type: IsarType.long,
    ),
    r'round': PropertySchema(
      id: 1,
      name: r'round',
      type: IsarType.long,
    )
  },
  estimateSize: _scoreboardModelEstimateSize,
  serialize: _scoreboardModelSerialize,
  deserialize: _scoreboardModelDeserialize,
  deserializeProp: _scoreboardModelDeserializeProp,
  idName: r'scoreboardID',
  indexes: {},
  links: {
    r'players': LinkSchema(
      id: -6290171309174993964,
      name: r'players',
      target: r'PlayerModel',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _scoreboardModelGetId,
  getLinks: _scoreboardModelGetLinks,
  attach: _scoreboardModelAttach,
  version: '3.1.0+1',
);

int _scoreboardModelEstimateSize(
  ScoreboardModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scoreboardModelSerialize(
  ScoreboardModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cards);
  writer.writeLong(offsets[1], object.round);
}

ScoreboardModel _scoreboardModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScoreboardModel();
  object.cards = reader.readLong(offsets[0]);
  object.round = reader.readLong(offsets[1]);
  object.scoreboardID = id;
  return object;
}

P _scoreboardModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scoreboardModelGetId(ScoreboardModel object) {
  return object.scoreboardID;
}

List<IsarLinkBase<dynamic>> _scoreboardModelGetLinks(ScoreboardModel object) {
  return [object.players];
}

void _scoreboardModelAttach(
    IsarCollection<dynamic> col, Id id, ScoreboardModel object) {
  object.scoreboardID = id;
  object.players
      .attach(col, col.isar.collection<PlayerModel>(), r'players', id);
}

extension ScoreboardModelQueryWhereSort
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QWhere> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterWhere>
      anyScoreboardID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScoreboardModelQueryWhere
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QWhereClause> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterWhereClause>
      scoreboardIDEqualTo(Id scoreboardID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: scoreboardID,
        upper: scoreboardID,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterWhereClause>
      scoreboardIDNotEqualTo(Id scoreboardID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: scoreboardID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: scoreboardID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: scoreboardID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: scoreboardID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterWhereClause>
      scoreboardIDGreaterThan(Id scoreboardID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: scoreboardID, includeLower: include),
      );
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterWhereClause>
      scoreboardIDLessThan(Id scoreboardID, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: scoreboardID, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterWhereClause>
      scoreboardIDBetween(
    Id lowerScoreboardID,
    Id upperScoreboardID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerScoreboardID,
        includeLower: includeLower,
        upper: upperScoreboardID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScoreboardModelQueryFilter
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QFilterCondition> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      cardsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cards',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      cardsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cards',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      cardsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cards',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      cardsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cards',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      roundEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'round',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      roundGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'round',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      roundLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'round',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      roundBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'round',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      scoreboardIDEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scoreboardID',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      scoreboardIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scoreboardID',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      scoreboardIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scoreboardID',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      scoreboardIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scoreboardID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScoreboardModelQueryObject
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QFilterCondition> {}

extension ScoreboardModelQueryLinks
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QFilterCondition> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition> players(
      FilterQuery<PlayerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'players');
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      playersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', length, true, length, true);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      playersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', 0, true, 0, true);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      playersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', 0, false, 999999, true);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      playersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', 0, true, length, include);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      playersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'players', length, include, 999999, true);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterFilterCondition>
      playersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'players', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ScoreboardModelQuerySortBy
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QSortBy> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy> sortByCards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cards', Sort.asc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy>
      sortByCardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cards', Sort.desc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy> sortByRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.asc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy>
      sortByRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.desc);
    });
  }
}

extension ScoreboardModelQuerySortThenBy
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QSortThenBy> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy> thenByCards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cards', Sort.asc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy>
      thenByCardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cards', Sort.desc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy> thenByRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.asc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy>
      thenByRoundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'round', Sort.desc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy>
      thenByScoreboardID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreboardID', Sort.asc);
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QAfterSortBy>
      thenByScoreboardIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreboardID', Sort.desc);
    });
  }
}

extension ScoreboardModelQueryWhereDistinct
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QDistinct> {
  QueryBuilder<ScoreboardModel, ScoreboardModel, QDistinct> distinctByCards() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cards');
    });
  }

  QueryBuilder<ScoreboardModel, ScoreboardModel, QDistinct> distinctByRound() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'round');
    });
  }
}

extension ScoreboardModelQueryProperty
    on QueryBuilder<ScoreboardModel, ScoreboardModel, QQueryProperty> {
  QueryBuilder<ScoreboardModel, int, QQueryOperations> scoreboardIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreboardID');
    });
  }

  QueryBuilder<ScoreboardModel, int, QQueryOperations> cardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cards');
    });
  }

  QueryBuilder<ScoreboardModel, int, QQueryOperations> roundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'round');
    });
  }
}
