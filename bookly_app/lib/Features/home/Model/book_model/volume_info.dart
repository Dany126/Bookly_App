import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  List<String>? categories;
  String? publishedDate;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title = 'Unknown Title',
    this.authors = const [],
    this.categories = const [],
    this.publishedDate = 'Unknown Date',
    this.industryIdentifiers = const [],
    this.readingModes,
    this.pageCount = 0,
    this.printType = 'Unknown',
    this.maturityRating = 'Unknown',
    this.allowAnonLogging = false,
    this.contentVersion = '1.0.0',
    this.panelizationSummary,
    this.imageLinks,
    this.language = 'Unknown',
    this.previewLink = '',
    this.infoLink = '',
    this.canonicalVolumeLink = '',
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String? ?? 'Unknown Title',

    authors:
        (json['authors'] as List?)?.map((e) => e.toString()).toList() ?? [],

    categories:
        (json['categories'] as List?)?.map((e) => e.toString()).toList() ?? [],

    publishedDate: json['publishedDate'] as String? ?? 'Unknown Date',

    industryIdentifiers:
        (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],

    readingModes: json['readingModes'] == null
        ? null
        : ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),

    pageCount: json['pageCount'] as int? ?? 0,

    printType: json['printType'] as String? ?? 'Unknown',

    maturityRating: json['maturityRating'] as String? ?? 'Unknown',

    allowAnonLogging: json['allowAnonLogging'] as bool? ?? false,

    contentVersion: json['contentVersion'] as String? ?? '1.0.0',

    panelizationSummary: json['panelizationSummary'] == null
        ? null
        : PanelizationSummary.fromJson(
            json['panelizationSummary'] as Map<String, dynamic>,
          ),

    imageLinks: json['imageLinks'] == null
        ? null
        : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),

    language: json['language'] as String? ?? 'Unknown',

    previewLink: json['previewLink'] as String? ?? '',

    infoLink: json['infoLink'] as String? ?? '',

    canonicalVolumeLink: json['canonicalVolumeLink'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    'categories': categories,
    'publishedDate': publishedDate,
    'industryIdentifiers': industryIdentifiers?.map((e) => e.toJson()).toList(),
    'readingModes': readingModes?.toJson(),
    'pageCount': pageCount,
    'printType': printType,
    'maturityRating': maturityRating,
    'allowAnonLogging': allowAnonLogging,
    'contentVersion': contentVersion,
    'panelizationSummary': panelizationSummary?.toJson(),
    'imageLinks': imageLinks?.toJson(),
    'language': language,
    'previewLink': previewLink,
    'infoLink': infoLink,
    'canonicalVolumeLink': canonicalVolumeLink,
  };
}
