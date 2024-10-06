import 'package:json_annotation/json_annotation.dart';

part 'array_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ArrayResponse<T> {
  @JsonKey(name: 'Success')
  final bool? status;

  @JsonKey(name: 'Description')
  final String? description;

  @JsonKey(name: 'Object', defaultValue: [])
  final List<T> data;

  @JsonKey(name: 'ObjectExtra')
  final ObjectExtra? objectExtra;

  ArrayResponse({
    this.status ,
    this.description,
    this.data = const [],
    this.objectExtra,
  });

  factory ArrayResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ArrayResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ArrayResponseToJson(this, toJsonT);
}


@JsonSerializable()
class ObjectExtra {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Search")
  dynamic search;
  @JsonKey(name: "Paging")
  Paging? paging;
  @JsonKey(name: "Export")
  dynamic objectExtraExport;
  @JsonKey(name: "IgnoreIds")
  dynamic ignoreIds;
  @JsonKey(name: "Columns")
  dynamic columns;
  @JsonKey(name: "Orders")
  List<Order>? orders;
  @JsonKey(name: "Filters")
  List<Filter>? filters;
  @JsonKey(name: "SearchFilters")
  List<String>? searchFilters;

  ObjectExtra({
    this.name,
    this.search,
    this.paging,
    this.objectExtraExport,
    this.ignoreIds,
    this.columns,
    this.orders,
    this.filters,
    this.searchFilters,
  });

  ObjectExtra copyWith({
    String? name,
    dynamic search,
    Paging? paging,
    dynamic objectExtraExport,
    dynamic ignoreIds,
    dynamic columns,
    List<Order>? orders,
    List<Filter>? filters,
    List<String>? searchFilters,
  }) =>
      ObjectExtra(
        name: name ?? this.name,
        search: search ?? this.search,
        paging: paging ?? this.paging,
        objectExtraExport: objectExtraExport ?? this.objectExtraExport,
        ignoreIds: ignoreIds ?? this.ignoreIds,
        columns: columns ?? this.columns,
        orders: orders ?? this.orders,
        filters: filters ?? this.filters,
        searchFilters: searchFilters ?? this.searchFilters,
      );

  factory ObjectExtra.fromJson(Map<String, dynamic> json) => _$ObjectExtraFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectExtraToJson(this);
}

@JsonSerializable()
class Filter {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Value")
  bool? value;
  @JsonKey(name: "Value2")
  dynamic value2;
  @JsonKey(name: "ColumnFilter")
  dynamic columnFilter;
  @JsonKey(name: "Compare")
  int? compare;

  Filter({
    this.name,
    this.value,
    this.value2,
    this.columnFilter,
    this.compare,
  });

  Filter copyWith({
    String? name,
    bool? value,
    dynamic value2,
    dynamic columnFilter,
    int? compare,
  }) =>
      Filter(
        name: name ?? this.name,
        value: value ?? this.value,
        value2: value2 ?? this.value2,
        columnFilter: columnFilter ?? this.columnFilter,
        compare: compare ?? this.compare,
      );

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Type")
  int? type;

  Order({
    this.name,
    this.type,
  });

  Order copyWith({
    String? name,
    int? type,
  }) =>
      Order(
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Paging {
  @JsonKey(name: "Size")
  int? size;
  @JsonKey(name: "Index")
  int? index;
  @JsonKey(name: "Total")
  int? total;
  @JsonKey(name: "Pages")
  int? pages;

  Paging({
    this.size,
    this.index,
    this.total,
    this.pages,
  });

  Paging copyWith({
    int? size,
    int? index,
    int? total,
    int? pages,
  }) =>
      Paging(
        size: size ?? this.size,
        index: index ?? this.index,
        total: total ?? this.total,
        pages: pages ?? this.pages,
      );

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);
}
