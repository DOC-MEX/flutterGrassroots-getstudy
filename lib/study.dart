// To parse this JSON data, do
//
//     final studyGrassroots = studyGrassrootsFromJson(jsonString);

import 'dart:convert';

StudyGrassroots studyGrassrootsFromJson(String str) =>
    StudyGrassroots.fromJson(json.decode(str));

String studyGrassrootsToJson(StudyGrassroots data) =>
    json.encode(data.toJson());

class StudyGrassroots {
  StudyGrassroots({
    required this.header,
    required this.results,
  });

  Header header;
  List<StudyGrassrootsResult> results;

  factory StudyGrassroots.fromJson(Map<String, dynamic> json) =>
      StudyGrassroots(
        header: Header.fromJson(json["header"]),
        results: List<StudyGrassrootsResult>.from(
            json["results"].map((x) => StudyGrassrootsResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    required this.schema,
  });

  Schema schema;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        schema: Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "schema": schema.toJson(),
      };
}

class Schema {
  Schema({
    required this.soSoftwareVersion,
  });

  String soSoftwareVersion;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        soSoftwareVersion: json["so:softwareVersion"],
      );

  Map<String, dynamic> toJson() => {
        "so:softwareVersion": soSoftwareVersion,
      };
}

class StudyGrassrootsResult {
  StudyGrassrootsResult({
    required this.serviceName,
    required this.status,
    required this.statusText,
    required this.results,
  });

  String serviceName;
  int status;
  String statusText;
  List<ResultResult> results;

  factory StudyGrassrootsResult.fromJson(Map<String, dynamic> json) =>
      StudyGrassrootsResult(
        serviceName: json["service_name"],
        status: json["status"],
        statusText: json["status_text"],
        results: List<ResultResult>.from(
            json["results"].map((x) => ResultResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service_name": serviceName,
        "status": status,
        "status_text": statusText,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ResultResult {
  ResultResult({
    required this.protocol,
    required this.title,
    required this.data,
  });

  String protocol;
  String title;
  Data data;

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
        protocol: json["protocol"],
        title: json["title"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "protocol": protocol,
        "title": title,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.soName,
    this.soDescription,
    this.growingConditions, // make it optional
    required this.studyDesign,
    this.phenotypeGatheringNotes,
    this.soUrl, // make it optional
    this.plotWidth,
    this.plotLength,
    this.numRows,
    this.numColumns,
    this.numReplicates,
    this.plotHorizontalGap,
    this.plotVerticalGap,
    this.plotBlockRows,
    this.plotBlockColumns,
    this.plotBlockHorizontalGap,
    this.plotBlockVerticalGap,
    required this.treatmentFactors,
    this.sowingYear,
    this.harvestYear,
  });

  String soName;
  String? soDescription;
  dynamic growingConditions;
  String studyDesign;
  dynamic phenotypeGatheringNotes;
  String? soUrl;
  double? plotWidth;
  double? plotLength;
  int? numRows;
  int? numColumns;
  int? numReplicates;
  double? plotHorizontalGap;
  double? plotVerticalGap;
  int? plotBlockRows;
  int? plotBlockColumns;
  double? plotBlockHorizontalGap;
  double? plotBlockVerticalGap;
  List<TreatmentFactor> treatmentFactors;
  int? sowingYear;
  int? harvestYear;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        soName: json["so:name"],
        soDescription: json["so:description"],
        growingConditions: json["growing_conditions"],
        studyDesign: json["study_design"],
        phenotypeGatheringNotes: json["phenotype_gathering_notes"],
        soUrl: json["so:url"],
        plotWidth: json["plot_width"]?.toDouble(),
        plotLength: json["plot_length"]?.toDouble(),
        numRows: json["num_rows"],
        numColumns: json["num_columns"],
        numReplicates: json["num_replicates"],
        plotHorizontalGap: json["plot_horizontal_gap"]?.toDouble(),
        plotVerticalGap: json["plot_vertical_gap"]?.toDouble(),
        plotBlockRows: json["plot_block_rows"],
        plotBlockColumns: json["plot_block_columns"],
        plotBlockHorizontalGap: json["plot_block_horizontal_gap"]?.toDouble(),
        plotBlockVerticalGap: json["plot_block_vertical_gap"]?.toDouble(),
        treatmentFactors: List<TreatmentFactor>.from(
            json["treatment_factors"].map((x) => TreatmentFactor.fromJson(x))),
        sowingYear: json["sowing_year"],
        harvestYear: json["harvest_year"],
      );

  Map<String, dynamic> toJson() => {
        "so:name": soName,
        "so:description": soDescription,
        "growing_conditions": growingConditions,
        "study_design": studyDesign,
        "phenotype_gathering_notes": phenotypeGatheringNotes,
        "so:url": soUrl,
        "plot_width": plotWidth,
        "plot_length": plotLength,
        "num_rows": numRows,
        "num_columns": numColumns,
        "num_replicates": numReplicates,
        "plot_horizontal_gap": plotHorizontalGap,
        "plot_vertical_gap": plotVerticalGap,
        "plot_block_rows": plotBlockRows,
        "plot_block_columns": plotBlockColumns,
        "plot_block_horizontal_gap": plotBlockHorizontalGap,
        "plot_block_vertical_gap": plotBlockVerticalGap,
        "treatment_factors":
            List<dynamic>.from(treatmentFactors.map((x) => x.toJson())),
        "sowing_year": sowingYear,
        "harvest_year": harvestYear,
      };
}

class TreatmentFactor {
  TreatmentFactor({
    required this.values,
    required this.studyId,
    required this.treatment,
    required this.studyName,
  });

  List<Value> values;
  StudyId studyId;
  Treatment treatment;
  String studyName;

  factory TreatmentFactor.fromJson(Map<String, dynamic> json) =>
      TreatmentFactor(
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
        studyId: StudyId.fromJson(json["study_id"]),
        treatment: Treatment.fromJson(json["treatment"]),
        studyName: json["study_name"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
        "study_id": studyId.toJson(),
        "treatment": treatment.toJson(),
        "study_name": studyName,
      };
}

class StudyId {
  StudyId({
    required this.oid,
  });

  String oid;

  factory StudyId.fromJson(Map<String, dynamic> json) => StudyId(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class Treatment {
  Treatment({
    required this.soSameAs,
    required this.soName,
    required this.soDescription,
    required this.synonyms,
    required this.id,
    required this.type,
    required this.typeDescription,
  });

  String soSameAs;
  String soName;
  String soDescription;
  List<String> synonyms;
  StudyId id;
  String type;
  String typeDescription;

  factory Treatment.fromJson(Map<String, dynamic> json) => Treatment(
        soSameAs: json["so:sameAs"],
        soName: json["so:name"],
        soDescription: json["so:description"],
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        id: StudyId.fromJson(json["_id"]),
        type: json["@type"],
        typeDescription: json["type_description"],
      );

  Map<String, dynamic> toJson() => {
        "so:sameAs": soSameAs,
        "so:name": soName,
        "so:description": soDescription,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "_id": id.toJson(),
        "@type": type,
        "type_description": typeDescription,
      };
}

class Value {
  Value({
    required this.label,
    required this.value,
  });

  String label;
  String value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        label: json["Label"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Label": label,
        "Value": value,
      };
}
