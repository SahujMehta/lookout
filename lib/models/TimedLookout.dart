/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TimedLookout type in your schema. */
@immutable
class TimedLookout extends Model {
  static const classType = const _TimedLookoutModelType();
  final String id;
  final TemporalDateTime? _start;
  final TemporalTime? _length;
  final String? _name;
  final String? _description;
  final String? _email;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TimedLookoutModelIdentifier get modelIdentifier {
      return TimedLookoutModelIdentifier(
        id: id
      );
  }
  
  TemporalDateTime? get start {
    return _start;
  }
  
  TemporalTime? get length {
    return _length;
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  String? get email {
    return _email;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const TimedLookout._internal({required this.id, start, length, name, description, email, createdAt, updatedAt}): _start = start, _length = length, _name = name, _description = description, _email = email, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory TimedLookout({String? id, TemporalDateTime? start, TemporalTime? length, String? name, String? description, String? email}) {
    return TimedLookout._internal(
      id: id == null ? UUID.getUUID() : id,
      start: start,
      length: length,
      name: name,
      description: description,
      email: email);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimedLookout &&
      id == other.id &&
      _start == other._start &&
      _length == other._length &&
      _name == other._name &&
      _description == other._description &&
      _email == other._email;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TimedLookout {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("start=" + (_start != null ? _start!.format() : "null") + ", ");
    buffer.write("length=" + (_length != null ? _length!.format() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TimedLookout copyWith({TemporalDateTime? start, TemporalTime? length, String? name, String? description, String? email}) {
    return TimedLookout._internal(
      id: id,
      start: start ?? this.start,
      length: length ?? this.length,
      name: name ?? this.name,
      description: description ?? this.description,
      email: email ?? this.email);
  }
  
  TimedLookout.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _start = json['start'] != null ? TemporalDateTime.fromString(json['start']) : null,
      _length = json['length'] != null ? TemporalTime.fromString(json['length']) : null,
      _name = json['name'],
      _description = json['description'],
      _email = json['email'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'start': _start?.format(), 'length': _length?.format(), 'name': _name, 'description': _description, 'email': _email, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'start': _start, 'length': _length, 'name': _name, 'description': _description, 'email': _email, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<TimedLookoutModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<TimedLookoutModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField START = QueryField(fieldName: "start");
  static final QueryField LENGTH = QueryField(fieldName: "length");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TimedLookout";
    modelSchemaDefinition.pluralName = "TimedLookouts";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TimedLookout.START,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TimedLookout.LENGTH,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TimedLookout.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TimedLookout.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TimedLookout.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TimedLookoutModelType extends ModelType<TimedLookout> {
  const _TimedLookoutModelType();
  
  @override
  TimedLookout fromJson(Map<String, dynamic> jsonData) {
    return TimedLookout.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'TimedLookout';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [TimedLookout] in your schema.
 */
@immutable
class TimedLookoutModelIdentifier implements ModelIdentifier<TimedLookout> {
  final String id;

  /** Create an instance of TimedLookoutModelIdentifier using [id] the primary key. */
  const TimedLookoutModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TimedLookoutModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TimedLookoutModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}