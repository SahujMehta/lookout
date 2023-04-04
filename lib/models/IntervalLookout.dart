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


/** This is an auto generated class representing the IntervalLookout type in your schema. */
@immutable
class IntervalLookout extends Model {
  static const classType = const _IntervalLookoutModelType();
  final String id;
  final TemporalDateTime? _start;
  final TemporalDateTime? _end;
  final TemporalTime? _length;
  final String? _name;
  final String? _description;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  IntervalLookoutModelIdentifier get modelIdentifier {
      return IntervalLookoutModelIdentifier(
        id: id
      );
  }
  
  TemporalDateTime? get start {
    return _start;
  }
  
  TemporalDateTime? get end {
    return _end;
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
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const IntervalLookout._internal({required this.id, start, end, length, name, description, createdAt, updatedAt}): _start = start, _end = end, _length = length, _name = name, _description = description, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory IntervalLookout({String? id, TemporalDateTime? start, TemporalDateTime? end, TemporalTime? length, String? name, String? description}) {
    return IntervalLookout._internal(
      id: id == null ? UUID.getUUID() : id,
      start: start,
      end: end,
      length: length,
      name: name,
      description: description);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntervalLookout &&
      id == other.id &&
      _start == other._start &&
      _end == other._end &&
      _length == other._length &&
      _name == other._name &&
      _description == other._description;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("IntervalLookout {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("start=" + (_start != null ? _start!.format() : "null") + ", ");
    buffer.write("end=" + (_end != null ? _end!.format() : "null") + ", ");
    buffer.write("length=" + (_length != null ? _length!.format() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  IntervalLookout copyWith({TemporalDateTime? start, TemporalDateTime? end, TemporalTime? length, String? name, String? description}) {
    return IntervalLookout._internal(
      id: id,
      start: start ?? this.start,
      end: end ?? this.end,
      length: length ?? this.length,
      name: name ?? this.name,
      description: description ?? this.description);
  }
  
  IntervalLookout.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _start = json['start'] != null ? TemporalDateTime.fromString(json['start']) : null,
      _end = json['end'] != null ? TemporalDateTime.fromString(json['end']) : null,
      _length = json['length'] != null ? TemporalTime.fromString(json['length']) : null,
      _name = json['name'],
      _description = json['description'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'start': _start?.format(), 'end': _end?.format(), 'length': _length?.format(), 'name': _name, 'description': _description, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'start': _start, 'end': _end, 'length': _length, 'name': _name, 'description': _description, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<IntervalLookoutModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<IntervalLookoutModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField START = QueryField(fieldName: "start");
  static final QueryField END = QueryField(fieldName: "end");
  static final QueryField LENGTH = QueryField(fieldName: "length");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "IntervalLookout";
    modelSchemaDefinition.pluralName = "IntervalLookouts";
    
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
      key: IntervalLookout.START,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: IntervalLookout.END,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: IntervalLookout.LENGTH,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: IntervalLookout.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: IntervalLookout.DESCRIPTION,
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

class _IntervalLookoutModelType extends ModelType<IntervalLookout> {
  const _IntervalLookoutModelType();
  
  @override
  IntervalLookout fromJson(Map<String, dynamic> jsonData) {
    return IntervalLookout.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'IntervalLookout';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [IntervalLookout] in your schema.
 */
@immutable
class IntervalLookoutModelIdentifier implements ModelIdentifier<IntervalLookout> {
  final String id;

  /** Create an instance of IntervalLookoutModelIdentifier using [id] the primary key. */
  const IntervalLookoutModelIdentifier({
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
  String toString() => 'IntervalLookoutModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is IntervalLookoutModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}