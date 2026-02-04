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

class $StudyRecordsTable extends StudyRecords
    with TableInfo<$StudyRecordsTable, StudyRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudyRecordsTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextReviewAtMeta = const VerificationMeta(
    'nextReviewAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextReviewAt = GeneratedColumn<DateTime>(
    'next_review_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastStudiedAtMeta = const VerificationMeta(
    'lastStudiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastStudiedAt =
      GeneratedColumn<DateTime>(
        'last_studied_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _correctCountMeta = const VerificationMeta(
    'correctCount',
  );
  @override
  late final GeneratedColumn<int> correctCount = GeneratedColumn<int>(
    'correct_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _wrongCountMeta = const VerificationMeta(
    'wrongCount',
  );
  @override
  late final GeneratedColumn<int> wrongCount = GeneratedColumn<int>(
    'wrong_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
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
  List<GeneratedColumn> get $columns => [
    id,
    questionId,
    categoryId,
    level,
    nextReviewAt,
    lastStudiedAt,
    correctCount,
    wrongCount,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudyRecord> instance, {
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
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('next_review_at')) {
      context.handle(
        _nextReviewAtMeta,
        nextReviewAt.isAcceptableOrUnknown(
          data['next_review_at']!,
          _nextReviewAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextReviewAtMeta);
    }
    if (data.containsKey('last_studied_at')) {
      context.handle(
        _lastStudiedAtMeta,
        lastStudiedAt.isAcceptableOrUnknown(
          data['last_studied_at']!,
          _lastStudiedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastStudiedAtMeta);
    }
    if (data.containsKey('correct_count')) {
      context.handle(
        _correctCountMeta,
        correctCount.isAcceptableOrUnknown(
          data['correct_count']!,
          _correctCountMeta,
        ),
      );
    }
    if (data.containsKey('wrong_count')) {
      context.handle(
        _wrongCountMeta,
        wrongCount.isAcceptableOrUnknown(data['wrong_count']!, _wrongCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudyRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudyRecord(
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
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      nextReviewAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review_at'],
      )!,
      lastStudiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_studied_at'],
      )!,
      correctCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}correct_count'],
      )!,
      wrongCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wrong_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StudyRecordsTable createAlias(String alias) {
    return $StudyRecordsTable(attachedDatabase, alias);
  }
}

class StudyRecord extends DataClass implements Insertable<StudyRecord> {
  /// 자동 증가 ID
  final int id;

  /// 문제 ID (예: "q_love_001") - 고유값
  final String questionId;

  /// 카테고리 ID (예: "love")
  final String categoryId;

  /// 현재 레벨 (0: 오답, 1~4: 학습중, 5: 마스터리)
  final int level;

  /// 다음 복습 예정 시간
  final DateTime nextReviewAt;

  /// 마지막 학습 시간
  final DateTime lastStudiedAt;

  /// 정답 횟수
  final int correctCount;

  /// 오답 횟수
  final int wrongCount;

  /// 생성 시간
  final DateTime createdAt;

  /// 수정 시간
  final DateTime updatedAt;
  const StudyRecord({
    required this.id,
    required this.questionId,
    required this.categoryId,
    required this.level,
    required this.nextReviewAt,
    required this.lastStudiedAt,
    required this.correctCount,
    required this.wrongCount,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question_id'] = Variable<String>(questionId);
    map['category_id'] = Variable<String>(categoryId);
    map['level'] = Variable<int>(level);
    map['next_review_at'] = Variable<DateTime>(nextReviewAt);
    map['last_studied_at'] = Variable<DateTime>(lastStudiedAt);
    map['correct_count'] = Variable<int>(correctCount);
    map['wrong_count'] = Variable<int>(wrongCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StudyRecordsCompanion toCompanion(bool nullToAbsent) {
    return StudyRecordsCompanion(
      id: Value(id),
      questionId: Value(questionId),
      categoryId: Value(categoryId),
      level: Value(level),
      nextReviewAt: Value(nextReviewAt),
      lastStudiedAt: Value(lastStudiedAt),
      correctCount: Value(correctCount),
      wrongCount: Value(wrongCount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory StudyRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudyRecord(
      id: serializer.fromJson<int>(json['id']),
      questionId: serializer.fromJson<String>(json['questionId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      level: serializer.fromJson<int>(json['level']),
      nextReviewAt: serializer.fromJson<DateTime>(json['nextReviewAt']),
      lastStudiedAt: serializer.fromJson<DateTime>(json['lastStudiedAt']),
      correctCount: serializer.fromJson<int>(json['correctCount']),
      wrongCount: serializer.fromJson<int>(json['wrongCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionId': serializer.toJson<String>(questionId),
      'categoryId': serializer.toJson<String>(categoryId),
      'level': serializer.toJson<int>(level),
      'nextReviewAt': serializer.toJson<DateTime>(nextReviewAt),
      'lastStudiedAt': serializer.toJson<DateTime>(lastStudiedAt),
      'correctCount': serializer.toJson<int>(correctCount),
      'wrongCount': serializer.toJson<int>(wrongCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StudyRecord copyWith({
    int? id,
    String? questionId,
    String? categoryId,
    int? level,
    DateTime? nextReviewAt,
    DateTime? lastStudiedAt,
    int? correctCount,
    int? wrongCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => StudyRecord(
    id: id ?? this.id,
    questionId: questionId ?? this.questionId,
    categoryId: categoryId ?? this.categoryId,
    level: level ?? this.level,
    nextReviewAt: nextReviewAt ?? this.nextReviewAt,
    lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
    correctCount: correctCount ?? this.correctCount,
    wrongCount: wrongCount ?? this.wrongCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StudyRecord copyWithCompanion(StudyRecordsCompanion data) {
    return StudyRecord(
      id: data.id.present ? data.id.value : this.id,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      level: data.level.present ? data.level.value : this.level,
      nextReviewAt: data.nextReviewAt.present
          ? data.nextReviewAt.value
          : this.nextReviewAt,
      lastStudiedAt: data.lastStudiedAt.present
          ? data.lastStudiedAt.value
          : this.lastStudiedAt,
      correctCount: data.correctCount.present
          ? data.correctCount.value
          : this.correctCount,
      wrongCount: data.wrongCount.present
          ? data.wrongCount.value
          : this.wrongCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudyRecord(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('level: $level, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastStudiedAt: $lastStudiedAt, ')
          ..write('correctCount: $correctCount, ')
          ..write('wrongCount: $wrongCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    questionId,
    categoryId,
    level,
    nextReviewAt,
    lastStudiedAt,
    correctCount,
    wrongCount,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudyRecord &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.categoryId == this.categoryId &&
          other.level == this.level &&
          other.nextReviewAt == this.nextReviewAt &&
          other.lastStudiedAt == this.lastStudiedAt &&
          other.correctCount == this.correctCount &&
          other.wrongCount == this.wrongCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StudyRecordsCompanion extends UpdateCompanion<StudyRecord> {
  final Value<int> id;
  final Value<String> questionId;
  final Value<String> categoryId;
  final Value<int> level;
  final Value<DateTime> nextReviewAt;
  final Value<DateTime> lastStudiedAt;
  final Value<int> correctCount;
  final Value<int> wrongCount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StudyRecordsCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.level = const Value.absent(),
    this.nextReviewAt = const Value.absent(),
    this.lastStudiedAt = const Value.absent(),
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StudyRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String questionId,
    required String categoryId,
    this.level = const Value.absent(),
    required DateTime nextReviewAt,
    required DateTime lastStudiedAt,
    this.correctCount = const Value.absent(),
    this.wrongCount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : questionId = Value(questionId),
       categoryId = Value(categoryId),
       nextReviewAt = Value(nextReviewAt),
       lastStudiedAt = Value(lastStudiedAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<StudyRecord> custom({
    Expression<int>? id,
    Expression<String>? questionId,
    Expression<String>? categoryId,
    Expression<int>? level,
    Expression<DateTime>? nextReviewAt,
    Expression<DateTime>? lastStudiedAt,
    Expression<int>? correctCount,
    Expression<int>? wrongCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (categoryId != null) 'category_id': categoryId,
      if (level != null) 'level': level,
      if (nextReviewAt != null) 'next_review_at': nextReviewAt,
      if (lastStudiedAt != null) 'last_studied_at': lastStudiedAt,
      if (correctCount != null) 'correct_count': correctCount,
      if (wrongCount != null) 'wrong_count': wrongCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StudyRecordsCompanion copyWith({
    Value<int>? id,
    Value<String>? questionId,
    Value<String>? categoryId,
    Value<int>? level,
    Value<DateTime>? nextReviewAt,
    Value<DateTime>? lastStudiedAt,
    Value<int>? correctCount,
    Value<int>? wrongCount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StudyRecordsCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      categoryId: categoryId ?? this.categoryId,
      level: level ?? this.level,
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      lastStudiedAt: lastStudiedAt ?? this.lastStudiedAt,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (nextReviewAt.present) {
      map['next_review_at'] = Variable<DateTime>(nextReviewAt.value);
    }
    if (lastStudiedAt.present) {
      map['last_studied_at'] = Variable<DateTime>(lastStudiedAt.value);
    }
    if (correctCount.present) {
      map['correct_count'] = Variable<int>(correctCount.value);
    }
    if (wrongCount.present) {
      map['wrong_count'] = Variable<int>(wrongCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudyRecordsCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('level: $level, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastStudiedAt: $lastStudiedAt, ')
          ..write('correctCount: $correctCount, ')
          ..write('wrongCount: $wrongCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuizHistoryTable quizHistory = $QuizHistoryTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  late final $StudyRecordsTable studyRecords = $StudyRecordsTable(this);
  late final QuizHistoryDao quizHistoryDao = QuizHistoryDao(
    this as AppDatabase,
  );
  late final UserSettingsDao userSettingsDao = UserSettingsDao(
    this as AppDatabase,
  );
  late final StudyRecordDao studyRecordDao = StudyRecordDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    quizHistory,
    userSettings,
    studyRecords,
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
typedef $$StudyRecordsTableCreateCompanionBuilder =
    StudyRecordsCompanion Function({
      Value<int> id,
      required String questionId,
      required String categoryId,
      Value<int> level,
      required DateTime nextReviewAt,
      required DateTime lastStudiedAt,
      Value<int> correctCount,
      Value<int> wrongCount,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$StudyRecordsTableUpdateCompanionBuilder =
    StudyRecordsCompanion Function({
      Value<int> id,
      Value<String> questionId,
      Value<String> categoryId,
      Value<int> level,
      Value<DateTime> nextReviewAt,
      Value<DateTime> lastStudiedAt,
      Value<int> correctCount,
      Value<int> wrongCount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$StudyRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $StudyRecordsTable> {
  $$StudyRecordsTableFilterComposer({
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

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastStudiedAt => $composableBuilder(
    column: $table.lastStudiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get correctCount => $composableBuilder(
    column: $table.correctCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wrongCount => $composableBuilder(
    column: $table.wrongCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudyRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudyRecordsTable> {
  $$StudyRecordsTableOrderingComposer({
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

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastStudiedAt => $composableBuilder(
    column: $table.lastStudiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get correctCount => $composableBuilder(
    column: $table.correctCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wrongCount => $composableBuilder(
    column: $table.wrongCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudyRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudyRecordsTable> {
  $$StudyRecordsTableAnnotationComposer({
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

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastStudiedAt => $composableBuilder(
    column: $table.lastStudiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get correctCount => $composableBuilder(
    column: $table.correctCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wrongCount => $composableBuilder(
    column: $table.wrongCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$StudyRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudyRecordsTable,
          StudyRecord,
          $$StudyRecordsTableFilterComposer,
          $$StudyRecordsTableOrderingComposer,
          $$StudyRecordsTableAnnotationComposer,
          $$StudyRecordsTableCreateCompanionBuilder,
          $$StudyRecordsTableUpdateCompanionBuilder,
          (
            StudyRecord,
            BaseReferences<_$AppDatabase, $StudyRecordsTable, StudyRecord>,
          ),
          StudyRecord,
          PrefetchHooks Function()
        > {
  $$StudyRecordsTableTableManager(_$AppDatabase db, $StudyRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudyRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudyRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudyRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<DateTime> nextReviewAt = const Value.absent(),
                Value<DateTime> lastStudiedAt = const Value.absent(),
                Value<int> correctCount = const Value.absent(),
                Value<int> wrongCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StudyRecordsCompanion(
                id: id,
                questionId: questionId,
                categoryId: categoryId,
                level: level,
                nextReviewAt: nextReviewAt,
                lastStudiedAt: lastStudiedAt,
                correctCount: correctCount,
                wrongCount: wrongCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String questionId,
                required String categoryId,
                Value<int> level = const Value.absent(),
                required DateTime nextReviewAt,
                required DateTime lastStudiedAt,
                Value<int> correctCount = const Value.absent(),
                Value<int> wrongCount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => StudyRecordsCompanion.insert(
                id: id,
                questionId: questionId,
                categoryId: categoryId,
                level: level,
                nextReviewAt: nextReviewAt,
                lastStudiedAt: lastStudiedAt,
                correctCount: correctCount,
                wrongCount: wrongCount,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudyRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudyRecordsTable,
      StudyRecord,
      $$StudyRecordsTableFilterComposer,
      $$StudyRecordsTableOrderingComposer,
      $$StudyRecordsTableAnnotationComposer,
      $$StudyRecordsTableCreateCompanionBuilder,
      $$StudyRecordsTableUpdateCompanionBuilder,
      (
        StudyRecord,
        BaseReferences<_$AppDatabase, $StudyRecordsTable, StudyRecord>,
      ),
      StudyRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuizHistoryTableTableManager get quizHistory =>
      $$QuizHistoryTableTableManager(_db, _db.quizHistory);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
  $$StudyRecordsTableTableManager get studyRecords =>
      $$StudyRecordsTableTableManager(_db, _db.studyRecords);
}
