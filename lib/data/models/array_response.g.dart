// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'array_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrayResponse<T> _$ArrayResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ArrayResponse<T>(
      status: json['Success'] as bool?,
      description: json['Description'] as String?,
      data: (json['Object'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      objectExtra: json['ObjectExtra'] == null
          ? null
          : ObjectExtra.fromJson(json['ObjectExtra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArrayResponseToJson<T>(
  ArrayResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'Success': instance.status,
      'Description': instance.description,
      'Object': instance.data.map(toJsonT).toList(),
      'ObjectExtra': instance.objectExtra,
    };

ObjectExtra _$ObjectExtraFromJson(Map<String, dynamic> json) => ObjectExtra(
      name: json['Name'] as String?,
      search: json['Search'],
      paging: json['Paging'] == null
          ? null
          : Paging.fromJson(json['Paging'] as Map<String, dynamic>),
      objectExtraExport: json['Export'],
      ignoreIds: json['IgnoreIds'],
      columns: json['Columns'],
      orders: (json['Orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: (json['Filters'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchFilters: (json['SearchFilters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ObjectExtraToJson(ObjectExtra instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Search': instance.search,
      'Paging': instance.paging,
      'Export': instance.objectExtraExport,
      'IgnoreIds': instance.ignoreIds,
      'Columns': instance.columns,
      'Orders': instance.orders,
      'Filters': instance.filters,
      'SearchFilters': instance.searchFilters,
    };

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      name: json['Name'] as String?,
      value: json['Value'] as bool?,
      value2: json['Value2'],
      columnFilter: json['ColumnFilter'],
      compare: (json['Compare'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
      'Value2': instance.value2,
      'ColumnFilter': instance.columnFilter,
      'Compare': instance.compare,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      name: json['Name'] as String?,
      type: (json['Type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'Name': instance.name,
      'Type': instance.type,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      size: (json['Size'] as num?)?.toInt(),
      index: (json['Index'] as num?)?.toInt(),
      total: (json['Total'] as num?)?.toInt(),
      pages: (json['Pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'Size': instance.size,
      'Index': instance.index,
      'Total': instance.total,
      'Pages': instance.pages,
    };
