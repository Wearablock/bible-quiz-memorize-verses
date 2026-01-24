// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $QuizHistoryTable extends QuizHistory
    with TableInfo<$QuizHistoryTable, QuizHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _selectedAnswerMeta = const VerificationMeta(
    'selectedAnswer',
  );
  @override
  late final GeneratedColumn<String> selectedAnswer = GeneratedColumn<String>(
    'selected_answer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _answeredAtMeta = const VerificationMeta(
    'answeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
    'answered_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    questionId,
    categoryId,
    isCorrect,
    selectedAnswer,
    answeredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('selected_answer')) {
      context.handle(
        _selectedAnswerMeta,
        selectedAnswer.isAcceptableOrUnknown(
          data['selected_answer']!,
          _selectedAnswerMeta,
        ),
      );
    }
    if (data.containsKey('answered_at')) {
      context.handle(
        _answeredAtMeta,
        answeredAt.isAcceptableOrUnknown(data['answered_at']!, _answeredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_answeredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      )!,
      selectedAnswer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_answer'],
      ),
      answeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}answered_at'],
      )!,
    );
  }

  @override
  $QuizHistoryTable createAlias(String alias) {
    return $QuizHistoryTable(attachedDatabase, alias);
  }
}

class QuizHistoryData extends DataClass implements Insertable<QuizHistoryData> {
  /// 자동 증가 ID
  final int id;

  /// 문제 ID (예: "q_geo_001")
  final String questionId;

  /// 카테고리 ID (예: "geography")
  final String categoryId;

  /// 정답 여부
  final bool isCorrect;

  /// 선택한 답 (null = 시간 초과 또는 스킵)
  final String? selectedAnswer;

  /// 답변 시간
  final DateTime answeredAt;
  const QuizHistoryData({
    required this.id,
    required this.questionId,
    required this.categoryId,
    required this.isCorrect,
    this.selectedAnswer,
    required this.answeredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question_id'] = Variable<String>(questionId);
    map['category_id'] = Variable<String>(categoryId);
    map['is_correct'] = Variable<bool>(isCorrect);
    if (!nullToAbsent || selectedAnswer != null) {
      map['selected_answer'] = Variable<String>(selectedAnswer);
    }
    map['answered_at'] = Variable<DateTime>(answeredAt);
    return map;
  }

  QuizHistoryCompanion toCompanion(bool nullToAbsent) {
    return QuizHistoryCompanion(
      id: Value(id),
      questionId: Value(questionId),
      categoryId: Value(categoryId),
      isCorrect: Value(isCorrect),
      selectedAnswer: selectedAnswer == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedAnswer),
      answeredAt: Value(answeredAt),
    );
  }

  factory QuizHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizHistoryData(
      id: serializer.fromJson<int>(json['id']),
      questionId: serializer.fromJson<String>(json['questionId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      selectedAnswer: serializer.fromJson<String?>(json['selectedAnswer']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionId': serializer.toJson<String>(questionId),
      'categoryId': serializer.toJson<String>(categoryId),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'selectedAnswer': serializer.toJson<String?>(selectedAnswer),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  QuizHistoryData copyWith({
    int? id,
    String? questionId,
    String? categoryId,
    bool? isCorrect,
    Value<String?> selectedAnswer = const Value.absent(),
    DateTime? answeredAt,
  }) => QuizHistoryData(
    id: id ?? this.id,
    questionId: questionId ?? this.questionId,
    categoryId: categoryId ?? this.categoryId,
    isCorrect: isCorrect ?? this.isCorrect,
    selectedAnswer: selectedAnswer.present
        ? selectedAnswer.value
        : this.selectedAnswer,
    answeredAt: answeredAt ?? this.answeredAt,
  );
  QuizHistoryData copyWithCompanion(QuizHistoryCompanion data) {
    return QuizHistoryData(
      id: data.id.present ? data.id.value : this.id,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      selectedAnswer: data.selectedAnswer.present
          ? data.selectedAnswer.value
          : this.selectedAnswer,
      answeredAt: data.answeredAt.present
          ? data.answeredAt.value
          : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizHistoryData(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('selectedAnswer: $selectedAnswer, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    questionId,
    categoryId,
    isCorrect,
    selectedAnswer,
    answeredAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizHistoryData &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.categoryId == this.categoryId &&
          other.isCorrect == this.isCorrect &&
          other.selectedAnswer == this.selectedAnswer &&
          other.answeredAt == this.answeredAt);
}

class QuizHistoryCompanion extends UpdateCompanion<QuizHistoryData> {
  final Value<int> id;
  final Value<String> questionId;
  final Value<String> categoryId;
  final Value<bool> isCorrect;
  final Value<String?> selectedAnswer;
  final Value<DateTime> answeredAt;
  const QuizHistoryCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.selectedAnswer = const Value.absent(),
    this.answeredAt = const Value.absent(),
  });
  QuizHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String questionId,
    required String categoryId,
    required bool isCorrect,
    this.selectedAnswer = const Value.absent(),
    required DateTime answeredAt,
  }) : questionId = Value(questionId),
       categoryId = Value(categoryId),
       isCorrect = Value(isCorrect),
       answeredAt = Value(answeredAt);
  static Insertable<QuizHistoryData> custom({
    Expression<int>? id,
    Expression<String>? questionId,
    Expression<String>? categoryId,
    Expression<bool>? isCorrect,
    Expression<String>? selectedAnswer,
    Expression<DateTime>? answeredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (categoryId != null) 'category_id': categoryId,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (selectedAnswer != null) 'selected_answer': selectedAnswer,
      if (answeredAt != null) 'answered_at': answeredAt,
    });
  }

  QuizHistoryCompanion copyWith({
    Value<int>? id,
    Value<String>? questionId,
    Value<String>? categoryId,
    Value<bool>? isCorrect,
    Value<String?>? selectedAnswer,
    Value<DateTime>? answeredAt,
  }) {
    return QuizHistoryCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      categoryId: categoryId ?? this.categoryId,
      isCorrect: isCorrect ?? this.isCorrect,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      answeredAt: answeredAt ?? this.answeredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (selectedAnswer.present) {
      map['selected_answer'] = Variable<String>(selectedAnswer.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizHistoryCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('selectedAnswer: $selectedAnswer, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  /// 설정 키 (Primary Key)
  final String key;

  /// 설정 값 (JSON 문자열 가능)
  final String value;

  /// 수정 시간
  final DateTime updatedAt;
  const UserSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      UserSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserSetting copyWithCompanion(UserSettingsCompanion data) {
    return UserSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<UserSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UserSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuizHistoryTable quizHistory = $QuizHistoryTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  late final QuizHistoryDao quizHistoryDao = QuizHistoryDao(
    this as AppDatabase,
  );
  late final UserSettingsDao userSettingsDao = UserSettingsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    quizHistory,
    userSettings,
  ];
}

typedef $$QuizHistoryTableCreateCompanionBuilder =
    QuizHistoryCompanion Function({
      Value<int> id,
      required String questionId,
      required String categoryId,
      required bool isCorrect,
      Value<String?> selectedAnswer,
      required DateTime answeredAt,
    });
typedef $$QuizHistoryTableUpdateCompanionBuilder =
    QuizHistoryCompanion Function({
      Value<int> id,
      Value<String> questionId,
      Value<String> categoryId,
      Value<bool> isCorrect,
      Value<String?> selectedAnswer,
      Value<DateTime> answeredAt,
    });

class $$QuizHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $QuizHistoryTable> {
  $$QuizHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedAnswer => $composableBuilder(
    column: $table.selectedAnswer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $QuizHistoryTable> {
  $$QuizHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedAnswer => $composableBuilder(
    column: $table.selectedAnswer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizHistoryTable> {
  $$QuizHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<String> get selectedAnswer => $composableBuilder(
    column: $table.selectedAnswer,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => column,
  );
}

class $$QuizHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuizHistoryTable,
          QuizHistoryData,
          $$QuizHistoryTableFilterComposer,
          $$QuizHistoryTableOrderingComposer,
          $$QuizHistoryTableAnnotationComposer,
          $$QuizHistoryTableCreateCompanionBuilder,
          $$QuizHistoryTableUpdateCompanionBuilder,
          (
            QuizHistoryData,
            BaseReferences<_$AppDatabase, $QuizHistoryTable, QuizHistoryData>,
          ),
          QuizHistoryData,
          PrefetchHooks Function()
        > {
  $$QuizHistoryTableTableManager(_$AppDatabase db, $QuizHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<bool> isCorrect = const Value.absent(),
                Value<String?> selectedAnswer = const Value.absent(),
                Value<DateTime> answeredAt = const Value.absent(),
              }) => QuizHistoryCompanion(
                id: id,
                questionId: questionId,
                categoryId: categoryId,
                isCorrect: isCorrect,
                selectedAnswer: selectedAnswer,
                answeredAt: answeredAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String questionId,
                required String categoryId,
                required bool isCorrect,
                Value<String?> selectedAnswer = const Value.absent(),
                required DateTime answeredAt,
              }) => QuizHistoryCompanion.insert(
                id: id,
                questionId: questionId,
                categoryId: categoryId,
                isCorrect: isCorrect,
                selectedAnswer: selectedAnswer,
                answeredAt: answeredAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuizHistoryTable,
      QuizHistoryData,
      $$QuizHistoryTableFilterComposer,
      $$QuizHistoryTableOrderingComposer,
      $$QuizHistoryTableAnnotationComposer,
      $$QuizHistoryTableCreateCompanionBuilder,
      $$QuizHistoryTableUpdateCompanionBuilder,
      (
        QuizHistoryData,
        BaseReferences<_$AppDatabase, $QuizHistoryTable, QuizHistoryData>,
      ),
      QuizHistoryData,
      PrefetchHooks Function()
    >;
typedef $$UserSettingsTableCreateCompanionBuilder =
    UserSettingsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UserSettingsTableUpdateCompanionBuilder =
    UserSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UserSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSettingsTable,
          UserSetting,
          $$UserSettingsTableFilterComposer,
          $$UserSettingsTableOrderingComposer,
          $$UserSettingsTableAnnotationComposer,
          $$UserSettingsTableCreateCompanionBuilder,
          $$UserSettingsTableUpdateCompanionBuilder,
          (
            UserSetting,
            BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>,
          ),
          UserSetting,
          PrefetchHooks Function()
        > {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSettingsTable,
      UserSetting,
      $$UserSettingsTableFilterComposer,
      $$UserSettingsTableOrderingComposer,
      $$UserSettingsTableAnnotationComposer,
      $$UserSettingsTableCreateCompanionBuilder,
      $$UserSettingsTableUpdateCompanionBuilder,
      (
        UserSetting,
        BaseReferences<_$AppDatabase, $UserSettingsTable, UserSetting>,
      ),
      UserSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuizHistoryTableTableManager get quizHistory =>
      $$QuizHistoryTableTableManager(_db, _db.quizHistory);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
}
