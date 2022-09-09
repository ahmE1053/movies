// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMovieCollection on Isar {
  IsarCollection<Movie> get movies => getCollection();
}

const MovieSchema = CollectionSchema(
  name: 'Movie',
  schema:
      '{"name":"Movie","idName":"id","properties":[{"name":"backgroundPath","type":"String"},{"name":"genreIds","type":"LongList"},{"name":"hashCode","type":"Long"},{"name":"overview","type":"String"},{"name":"posterPath","type":"String"},{"name":"releaseDate","type":"String"},{"name":"stringify","type":"Bool"},{"name":"title","type":"String"},{"name":"voteAverage","type":"Double"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'backgroundPath': 0,
    'genreIds': 1,
    'hashCode': 2,
    'overview': 3,
    'posterPath': 4,
    'releaseDate': 5,
    'stringify': 6,
    'title': 7,
    'voteAverage': 8
  },
  listProperties: {'genreIds'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _movieGetId,
  getLinks: _movieGetLinks,
  attachLinks: _movieAttachLinks,
  serializeNative: _movieSerializeNative,
  deserializeNative: _movieDeserializeNative,
  deserializePropNative: _movieDeserializePropNative,
  serializeWeb: _movieSerializeWeb,
  deserializeWeb: _movieDeserializeWeb,
  deserializePropWeb: _movieDeserializePropWeb,
  version: 3,
);

int? _movieGetId(Movie object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _movieGetLinks(Movie object) {
  return [];
}

void _movieSerializeNative(
    IsarCollection<Movie> collection,
    IsarRawObject rawObj,
    Movie object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.backgroundPath;
  final _backgroundPath = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_backgroundPath.length) as int;
  final value1 = object.genreIds;
  dynamicSize += (value1.length) * 8;
  final _genreIds = value1;
  final value2 = object.hashCode;
  final _hashCode = value2;
  final value3 = object.overview;
  final _overview = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_overview.length) as int;
  final value4 = object.posterPath;
  final _posterPath = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_posterPath.length) as int;
  final value5 = object.releaseDate;
  final _releaseDate = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_releaseDate.length) as int;
  final value6 = object.stringify;
  final _stringify = value6;
  final value7 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_title.length) as int;
  final value8 = object.voteAverage;
  final _voteAverage = value8;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _backgroundPath);
  writer.writeLongList(offsets[1], _genreIds);
  writer.writeLong(offsets[2], _hashCode);
  writer.writeBytes(offsets[3], _overview);
  writer.writeBytes(offsets[4], _posterPath);
  writer.writeBytes(offsets[5], _releaseDate);
  writer.writeBool(offsets[6], _stringify);
  writer.writeBytes(offsets[7], _title);
  writer.writeDouble(offsets[8], _voteAverage);
}

Movie _movieDeserializeNative(IsarCollection<Movie> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Movie(
    backgroundPath: reader.readString(offsets[0]),
    genreIds: reader.readLongList(offsets[1]) ?? [],
    id: id,
    overview: reader.readString(offsets[3]),
    posterPath: reader.readString(offsets[4]),
    releaseDate: reader.readString(offsets[5]),
    title: reader.readString(offsets[7]),
    voteAverage: reader.readDouble(offsets[8]),
  );
  return object;
}

P _movieDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _movieSerializeWeb(IsarCollection<Movie> collection, Movie object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'backgroundPath', object.backgroundPath);
  IsarNative.jsObjectSet(jsObj, 'genreIds', object.genreIds);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'overview', object.overview);
  IsarNative.jsObjectSet(jsObj, 'posterPath', object.posterPath);
  IsarNative.jsObjectSet(jsObj, 'releaseDate', object.releaseDate);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'voteAverage', object.voteAverage);
  return jsObj;
}

Movie _movieDeserializeWeb(IsarCollection<Movie> collection, dynamic jsObj) {
  final object = Movie(
    backgroundPath: IsarNative.jsObjectGet(jsObj, 'backgroundPath') ?? '',
    genreIds: (IsarNative.jsObjectGet(jsObj, 'genreIds') as List?)
            ?.map((e) => e ?? double.negativeInfinity)
            .toList()
            .cast<int>() ??
        [],
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    overview: IsarNative.jsObjectGet(jsObj, 'overview') ?? '',
    posterPath: IsarNative.jsObjectGet(jsObj, 'posterPath') ?? '',
    releaseDate: IsarNative.jsObjectGet(jsObj, 'releaseDate') ?? '',
    title: IsarNative.jsObjectGet(jsObj, 'title') ?? '',
    voteAverage:
        IsarNative.jsObjectGet(jsObj, 'voteAverage') ?? double.negativeInfinity,
  );
  return object;
}

P _movieDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'backgroundPath':
      return (IsarNative.jsObjectGet(jsObj, 'backgroundPath') ?? '') as P;
    case 'genreIds':
      return ((IsarNative.jsObjectGet(jsObj, 'genreIds') as List?)
              ?.map((e) => e ?? double.negativeInfinity)
              .toList()
              .cast<int>() ??
          []) as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'overview':
      return (IsarNative.jsObjectGet(jsObj, 'overview') ?? '') as P;
    case 'posterPath':
      return (IsarNative.jsObjectGet(jsObj, 'posterPath') ?? '') as P;
    case 'releaseDate':
      return (IsarNative.jsObjectGet(jsObj, 'releaseDate') ?? '') as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    case 'voteAverage':
      return (IsarNative.jsObjectGet(jsObj, 'voteAverage') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _movieAttachLinks(IsarCollection col, int id, Movie object) {}

extension MovieQueryWhereSort on QueryBuilder<Movie, Movie, QWhere> {
  QueryBuilder<Movie, Movie, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension MovieQueryWhere on QueryBuilder<Movie, Movie, QWhereClause> {
  QueryBuilder<Movie, Movie, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Movie, Movie, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Movie, Movie, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Movie, Movie, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension MovieQueryFilter on QueryBuilder<Movie, Movie, QFilterCondition> {
  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'backgroundPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'backgroundPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'backgroundPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'backgroundPath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'backgroundPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'backgroundPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'backgroundPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> backgroundPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'backgroundPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> genreIdsAnyEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'genreIds',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> genreIdsAnyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'genreIds',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> genreIdsAnyLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'genreIds',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> genreIdsAnyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'genreIds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'overview',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'overview',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'overview',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'overview',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'overview',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'overview',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'overview',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> overviewMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'overview',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'posterPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'posterPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'posterPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'posterPath',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'posterPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'posterPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'posterPath',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> posterPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'posterPath',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'releaseDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'releaseDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'releaseDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'releaseDate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'releaseDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'releaseDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'releaseDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> releaseDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'releaseDate',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> voteAverageGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'voteAverage',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> voteAverageLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'voteAverage',
      value: value,
    ));
  }

  QueryBuilder<Movie, Movie, QAfterFilterCondition> voteAverageBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'voteAverage',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }
}

extension MovieQueryLinks on QueryBuilder<Movie, Movie, QFilterCondition> {}

extension MovieQueryWhereSortBy on QueryBuilder<Movie, Movie, QSortBy> {
  QueryBuilder<Movie, Movie, QAfterSortBy> sortByBackgroundPath() {
    return addSortByInternal('backgroundPath', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByBackgroundPathDesc() {
    return addSortByInternal('backgroundPath', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByOverview() {
    return addSortByInternal('overview', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByOverviewDesc() {
    return addSortByInternal('overview', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByPosterPath() {
    return addSortByInternal('posterPath', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByPosterPathDesc() {
    return addSortByInternal('posterPath', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByReleaseDate() {
    return addSortByInternal('releaseDate', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByReleaseDateDesc() {
    return addSortByInternal('releaseDate', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByVoteAverage() {
    return addSortByInternal('voteAverage', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> sortByVoteAverageDesc() {
    return addSortByInternal('voteAverage', Sort.desc);
  }
}

extension MovieQueryWhereSortThenBy on QueryBuilder<Movie, Movie, QSortThenBy> {
  QueryBuilder<Movie, Movie, QAfterSortBy> thenByBackgroundPath() {
    return addSortByInternal('backgroundPath', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByBackgroundPathDesc() {
    return addSortByInternal('backgroundPath', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByOverview() {
    return addSortByInternal('overview', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByOverviewDesc() {
    return addSortByInternal('overview', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByPosterPath() {
    return addSortByInternal('posterPath', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByPosterPathDesc() {
    return addSortByInternal('posterPath', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByReleaseDate() {
    return addSortByInternal('releaseDate', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByReleaseDateDesc() {
    return addSortByInternal('releaseDate', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByVoteAverage() {
    return addSortByInternal('voteAverage', Sort.asc);
  }

  QueryBuilder<Movie, Movie, QAfterSortBy> thenByVoteAverageDesc() {
    return addSortByInternal('voteAverage', Sort.desc);
  }
}

extension MovieQueryWhereDistinct on QueryBuilder<Movie, Movie, QDistinct> {
  QueryBuilder<Movie, Movie, QDistinct> distinctByBackgroundPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('backgroundPath',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByOverview(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('overview', caseSensitive: caseSensitive);
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByPosterPath(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('posterPath', caseSensitive: caseSensitive);
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByReleaseDate(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('releaseDate', caseSensitive: caseSensitive);
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<Movie, Movie, QDistinct> distinctByVoteAverage() {
    return addDistinctByInternal('voteAverage');
  }
}

extension MovieQueryProperty on QueryBuilder<Movie, Movie, QQueryProperty> {
  QueryBuilder<Movie, String, QQueryOperations> backgroundPathProperty() {
    return addPropertyNameInternal('backgroundPath');
  }

  QueryBuilder<Movie, List<int>, QQueryOperations> genreIdsProperty() {
    return addPropertyNameInternal('genreIds');
  }

  QueryBuilder<Movie, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Movie, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Movie, String, QQueryOperations> overviewProperty() {
    return addPropertyNameInternal('overview');
  }

  QueryBuilder<Movie, String, QQueryOperations> posterPathProperty() {
    return addPropertyNameInternal('posterPath');
  }

  QueryBuilder<Movie, String, QQueryOperations> releaseDateProperty() {
    return addPropertyNameInternal('releaseDate');
  }

  QueryBuilder<Movie, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<Movie, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<Movie, double, QQueryOperations> voteAverageProperty() {
    return addPropertyNameInternal('voteAverage');
  }
}
