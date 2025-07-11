// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerModelCollection on Isar {
  IsarCollection<PlayerModel> get playerModels => this.collection();
}

const PlayerModelSchema = CollectionSchema(
  name: r'PlayerModel',
  id: 3033771222070140078,
  properties: {
    r'color': PropertySchema(
      id: 0,
      name: r'color',
      type: IsarType.long,
    ),
    r'count': PropertySchema(
      id: 1,
      name: r'count',
      type: IsarType.long,
    ),
    r'dealer': PropertySchema(
      id: 2,
      name: r'dealer',
      type: IsarType.bool,
    ),
    r'historyCount': PropertySchema(
      id: 3,
      name: r'historyCount',
      type: IsarType.longList,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'picture': PropertySchema(
      id: 5,
      name: r'picture',
      type: IsarType.string,
    ),
    r'points': PropertySchema(
      id: 6,
      name: r'points',
      type: IsarType.long,
    )
  },
  estimateSize: _playerModelEstimateSize,
  serialize: _playerModelSerialize,
  deserialize: _playerModelDeserialize,
  deserializeProp: _playerModelDeserializeProp,
  idName: r'playerID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _playerModelGetId,
  getLinks: _playerModelGetLinks,
  attach: _playerModelAttach,
  version: '3.1.0+1',
);

int _playerModelEstimateSize(
  PlayerModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.historyCount.length * 8;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.picture.length * 3;
  return bytesCount;
}

void _playerModelSerialize(
  PlayerModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeLong(offsets[1], object.count);
  writer.writeBool(offsets[2], object.dealer);
  writer.writeLongList(offsets[3], object.historyCount);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.picture);
  writer.writeLong(offsets[6], object.points);
}

PlayerModel _playerModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerModel(
    name: reader.readString(offsets[4]),
  );
  object.color = reader.readLong(offsets[0]);
  object.count = reader.readLong(offsets[1]);
  object.dealer = reader.readBool(offsets[2]);
  object.historyCount = reader.readLongList(offsets[3]) ?? [];
  object.picture = reader.readString(offsets[5]);
  object.playerID = id;
  object.points = reader.readLong(offsets[6]);
  return object;
}

P _playerModelDeserializeProp<P>(
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
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playerModelGetId(PlayerModel object) {
  return object.playerID;
}

List<IsarLinkBase<dynamic>> _playerModelGetLinks(PlayerModel object) {
  return [];
}

void _playerModelAttach(
    IsarCollection<dynamic> col, Id id, PlayerModel object) {
  object.playerID = id;
}

extension PlayerModelQueryWhereSort
    on QueryBuilder<PlayerModel, PlayerModel, QWhere> {
  QueryBuilder<PlayerModel, PlayerModel, QAfterWhere> anyPlayerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlayerModelQueryWhere
    on QueryBuilder<PlayerModel, PlayerModel, QWhereClause> {
  QueryBuilder<PlayerModel, PlayerModel, QAfterWhereClause> playerIDEqualTo(
      Id playerID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: playerID,
        upper: playerID,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterWhereClause> playerIDNotEqualTo(
      Id playerID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: playerID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: playerID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: playerID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: playerID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterWhereClause> playerIDGreaterThan(
      Id playerID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: playerID, includeLower: include),
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterWhereClause> playerIDLessThan(
      Id playerID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: playerID, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterWhereClause> playerIDBetween(
    Id lowerPlayerID,
    Id upperPlayerID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerPlayerID,
        includeLower: includeLower,
        upper: upperPlayerID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlayerModelQueryFilter
    on QueryBuilder<PlayerModel, PlayerModel, QFilterCondition> {
  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> colorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      colorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> colorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> colorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> countEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> dealerEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dealer',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'historyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'historyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'historyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'historyCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyCount',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyCount',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyCount',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyCount',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyCount',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      historyCountLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'historyCount',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pictureEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      pictureGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'picture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pictureLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'picture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pictureBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'picture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      pictureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'picture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pictureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'picture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pictureContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'picture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pictureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'picture',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      pictureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picture',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      pictureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'picture',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> playerIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerID',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      playerIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerID',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      playerIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerID',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> playerIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pointsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition>
      pointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterFilterCondition> pointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'points',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlayerModelQueryObject
    on QueryBuilder<PlayerModel, PlayerModel, QFilterCondition> {}

extension PlayerModelQueryLinks
    on QueryBuilder<PlayerModel, PlayerModel, QFilterCondition> {}

extension PlayerModelQuerySortBy
    on QueryBuilder<PlayerModel, PlayerModel, QSortBy> {
  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByDealer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealer', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByDealerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealer', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByPictureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }
}

extension PlayerModelQuerySortThenBy
    on QueryBuilder<PlayerModel, PlayerModel, QSortThenBy> {
  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByDealer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealer', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByDealerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dealer', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByPicture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByPictureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picture', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByPlayerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerID', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByPlayerIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerID', Sort.desc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QAfterSortBy> thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }
}

extension PlayerModelQueryWhereDistinct
    on QueryBuilder<PlayerModel, PlayerModel, QDistinct> {
  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByDealer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dealer');
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByHistoryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'historyCount');
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByPicture(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'picture', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayerModel, PlayerModel, QDistinct> distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }
}

extension PlayerModelQueryProperty
    on QueryBuilder<PlayerModel, PlayerModel, QQueryProperty> {
  QueryBuilder<PlayerModel, int, QQueryOperations> playerIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerID');
    });
  }

  QueryBuilder<PlayerModel, int, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<PlayerModel, int, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<PlayerModel, bool, QQueryOperations> dealerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dealer');
    });
  }

  QueryBuilder<PlayerModel, List<int>, QQueryOperations>
      historyCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'historyCount');
    });
  }

  QueryBuilder<PlayerModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PlayerModel, String, QQueryOperations> pictureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'picture');
    });
  }

  QueryBuilder<PlayerModel, int, QQueryOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }
}
