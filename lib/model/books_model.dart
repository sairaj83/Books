// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

class BookModel {
  BookModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  String? kind;
  int? totalItems;
  List<Item>? items;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json["kind"] ?? json["kind"],
        totalItems: json["totalItems"] ?? json["totalItems"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}

class Item {
  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Kind? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"] == null ? null : kindValues.map[json["kind"]],
        id: json["id"] ?? json["id"],
        etag: json["etag"] ?? json["etag"],
        selfLink: json["selfLink"] ?? json["selfLink"],
        volumeInfo: json["volumeInfo"] == null ? null : VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: json["saleInfo"] == null ? null : SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: json["accessInfo"] == null ? null : AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
      );
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  Country? country;
  Viewability? viewability;
  bool? embeddable;
  bool? publicDomain;
  TextToSpeechPermission? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"] == null ? null : countryValues.map[json["country"]],
        viewability: json["viewability"] == null ? null : viewabilityValues.map[json["viewability"]],
        embeddable: json["embeddable"] ?? json["embeddable"],
        publicDomain: json["publicDomain"] ?? json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"] == null ? null : textToSpeechPermissionValues.map[json["textToSpeechPermission"]],
        epub: json["epub"] == null ? null : Epub.fromJson(json["epub"]),
        pdf: json["pdf"] == null ? null : Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"] ?? json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"] ?? json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"] ?? json["quoteSharingAllowed"],
      );
}

enum AccessViewStatus { SAMPLE, NONE }

final accessViewStatusValues = EnumValues({"NONE": AccessViewStatus.NONE, "SAMPLE": AccessViewStatus.SAMPLE});

enum Country { IN }

final countryValues = EnumValues({"IN": Country.IN});

class Epub {
  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  bool? isAvailable;
  String? acsTokenLink;

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"] ?? json["isAvailable"],
        acsTokenLink: json["acsTokenLink"] ?? json["acsTokenLink"],
      );
}

enum TextToSpeechPermission { ALLOWED }

final textToSpeechPermissionValues = EnumValues({"ALLOWED": TextToSpeechPermission.ALLOWED});

enum Viewability { PARTIAL, NO_PAGES }

final viewabilityValues = EnumValues({"NO_PAGES": Viewability.NO_PAGES, "PARTIAL": Viewability.PARTIAL});

enum Kind { BOOKS_VOLUME }

final kindValues = EnumValues({"books#volume": Kind.BOOKS_VOLUME});

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  Country? country;
  Saleability? saleability;
  bool? isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"] == null ? null : countryValues.map[json["country"]],
        saleability: json["saleability"] == null ? null : saleabilityValues.map[json["saleability"]],
        isEbook: json["isEbook"] ?? json["isEbook"],
        listPrice: json["listPrice"] == null ? null : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null ? null : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"] ?? json["buyLink"],
        offers: json["offers"] == null ? null : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  var amount;
  String? currencyCode;

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice(
        amount: json["amount"] ?? json["amount"],
        currencyCode: json["currencyCode"] ?? json["currencyCode"],
      );
}

class Offer {
  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  int? finskyOfferType;
  OfferListPrice? listPrice;
  OfferListPrice? retailPrice;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"] ?? json["finskyOfferType"],
        listPrice: json["listPrice"] == null ? null : OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null ? null : OfferListPrice.fromJson(json["retailPrice"]),
      );
}

class OfferListPrice {
  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  int? amountInMicros;
  String? currencyCode;

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"] ?? json["amountInMicros"],
        currencyCode: json["currencyCode"] ?? json["currencyCode"],
      );
}

enum Saleability { NOT_FOR_SALE, FOR_SALE }

final saleabilityValues = EnumValues({"FOR_SALE": Saleability.FOR_SALE, "NOT_FOR_SALE": Saleability.NOT_FOR_SALE});

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  String? textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"] ?? json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet ?? textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  PrintType? printType;
  List<String>? categories;
  var averageRating;
  int? ratingsCount;
  MaturityRating? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  Language? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"] ?? json["title"],
        subtitle: json["subtitle"] ?? json["subtitle"],
        authors: json["authors"] == null ? null : List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] ?? json["publisher"],
        publishedDate: json["publishedDate"] ?? json["publishedDate"],
        description: json["description"] ?? json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null ? null : List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: json["readingModes"] == null ? null : ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"] ?? json["pageCount"],
        printType: json["printType"] == null ? null : printTypeValues.map[json["printType"]],
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        averageRating: json["averageRating"] ?? json["averageRating"],
        ratingsCount: json["ratingsCount"] ?? json["ratingsCount"],
        maturityRating: json["maturityRating"] == null ? null : maturityRatingValues.map[json["maturityRating"]],
        allowAnonLogging: json["allowAnonLogging"] ?? json["allowAnonLogging"],
        contentVersion: json["contentVersion"] ?? json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null ? null : PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"] == null ? null : languageValues.map[json["language"]],
        previewLink: json["previewLink"] ?? json["previewLink"],
        infoLink: json["infoLink"] ?? json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"] ?? json["canonicalVolumeLink"],
      );
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String? smallThumbnail;
  String? thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"] ?? json["smallThumbnail"],
        thumbnail: json["thumbnail"] ?? json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail ?? smallThumbnail,
        "thumbnail": thumbnail ?? thumbnail,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  Type? type;
  String? identifier;

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        identifier: json["identifier"] ?? json["identifier"],
      );
}

enum Type { ISBN_13, ISBN_10, OTHER }

final typeValues = EnumValues({"ISBN_10": Type.ISBN_10, "ISBN_13": Type.ISBN_13, "OTHER": Type.OTHER});

enum Language { EN }

final languageValues = EnumValues({"en": Language.EN});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues = EnumValues({"NOT_MATURE": MaturityRating.NOT_MATURE});

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"] ?? json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"] ?? json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles ?? containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles ?? containsImageBubbles,
      };
}

enum PrintType { BOOK }

final printTypeValues = EnumValues({"BOOK": PrintType.BOOK});

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  bool? text;
  bool? image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"] ?? json["text"],
        image: json["image"] ?? json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text ?? text,
        "image": image ?? image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
