
class Product {
  int? id;
  String? name;
  String? slug;
  String? postAuthor;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? dateOnSaleFrom;
  String? dateOnSaleFromGmt;
  String? dateOnSaleTo;
  String? dateOnSaleToGmt;
  String? priceHtml;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<Download>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  int? stockQuantity;
  String? lowStockAmount;
  bool? inStock;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<int>? relatedIds;
  List<String>? upsellIds;
  List<String>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<Image>? images;
  int? menuOrder;
  List<MetaDatum>? metaData;
  Store? store;
  Links? links;

  Product({this.id, this.name, this.slug, this.postAuthor, this.permalink, this.dateCreated, this.dateCreatedGmt, this.dateModified,
    this.dateModifiedGmt, this.type, this.status, this.featured, this.catalogVisibility, this.description, this.shortDescription, this.sku,
    this.price, this.regularPrice, this.salePrice, this.dateOnSaleFrom, this.dateOnSaleFromGmt, this.dateOnSaleTo, this.dateOnSaleToGmt, this.priceHtml,
    this.onSale, this.purchasable, this.totalSales, this.virtual, this.downloadable, this.downloads, this.downloadLimit, this.downloadExpiry, this.externalUrl,
    this.buttonText, this.taxStatus, this.taxClass, this.manageStock, this.stockQuantity, this.lowStockAmount, this.inStock, this.backorders, this.backordersAllowed,
    this.backordered, this.soldIndividually, this.weight, this.dimensions, this.shippingRequired, this.shippingTaxable, this.shippingClass, this.shippingClassId,
    this.reviewsAllowed, this.averageRating, this.ratingCount, this.relatedIds, this.upsellIds, this.crossSellIds, this.parentId, this.purchaseNote, this.categories,
    this.images, this.menuOrder, this.metaData, this.store, this.links,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    name = json["name"] ?? '';
    slug = json["slug"] ?? '';
    postAuthor = json["post_author"] ?? '';
    permalink = json["permalink"] ?? '';
    dateCreated = json["date_created"] ?? '';
    dateCreatedGmt = json["date_created_gmt"] ?? '';
    dateModified = json["date_modified"] ?? '';
    dateModifiedGmt = json["date_modified_gmt"] ?? '';
    type = json["type"] ?? false;
    status = json["status"] ?? '';
    featured = json["featured"] ?? false;
    catalogVisibility = json["catalog_visibility"] ?? '';
    description = json["description"] ?? '';
    shortDescription = json["short_description"] ?? '';
    sku = json["sku"] ?? '';
    price = json["price"] ?? '';
    regularPrice = json["regular_price"] ?? '';
    salePrice = json["sale_price"] ?? '';
    dateOnSaleFrom = json["date_on_sale_from"] ?? '';
    dateOnSaleFromGmt = json["date_on_sale_from_gmt"] ?? '';
    dateOnSaleTo = json["date_on_sale_to"] ?? '';
    dateOnSaleToGmt = json["date_on_sale_to_gmt"] ?? '';
    priceHtml = json["price_html"] ?? '';
    onSale = json["on_sale"] ?? false;
    purchasable = json["purchasable"] ?? false;
    totalSales = json["total_sales"] ?? int;
    virtual = json["virtual"] ?? false;
    downloadable = json["downloadable"] ?? false;
    downloads = json["downloads"] == null ? [] : List<Download>.from(json["downloads"]!.map((x) => Download.fromJson(x)));
    downloadLimit = json["download_limit"] ?? 0;
    downloadExpiry = json["download_expiry"] ?? 0;
    externalUrl = json["external_url"] ?? '';
    buttonText = json["button_text"] ?? '';
    taxStatus = json["tax_status"] ?? '';
    taxClass = json["tax_class"] ?? '';
    manageStock = json["manage_stock"] ?? false;
    stockQuantity = json["stock_quantity"] ?? 0;
    lowStockAmount = json["low_stock_amount"].toString() ?? '';
    inStock = json["in_stock"] ?? false;
    backorders = json["backorders"] ?? '';
    backordersAllowed = json["backorders_allowed"] ?? false;
    backordered = json["backordered"] ?? false;
    soldIndividually = json["sold_individually"] ?? false;
    weight = json["weight"] ?? '';
    dimensions = json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]);
    shippingRequired = json["shipping_required"] ?? false;
    shippingTaxable = json["shipping_taxable"] ?? false;
    shippingClass = json["shipping_class"] ?? '';
    shippingClassId = json["shipping_class_id"] ?? 0;
    reviewsAllowed = json["reviews_allowed"] ?? false;
    averageRating = json["average_rating"] ?? '';
    ratingCount = json["rating_count"] ?? 0;
    relatedIds = json["related_ids"] == null ? [] : List<int>.from(json["related_ids"]!.map((x) => x));
    upsellIds = json["upsell_ids"] == null ? [] : List<String>.from(json["upsell_ids"]!.map((x) => x));
    crossSellIds = json["cross_sell_ids"] == null ? [] : List<String>.from(json["cross_sell_ids"]!.map((x) => x));
    parentId = json["parent_id"] ?? 0;
    purchaseNote = json["purchase_note"] ?? '';
    categories = json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x)));
    images = json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x)));
    menuOrder = json["menu_order"] ?? 0;
    metaData = json["meta_data"] == null ? [] : List<MetaDatum>.from(json["meta_data"]!.map((x) => MetaDatum.fromJson(x)));
    store = json["store"] == null ? null : Store.fromJson(json["store"]);
    links = json["_links"] == null ? null : Links.fromJson(json["_links"]);
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug,});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height,});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
  };
}

class Download {
  String? id;
  String? name;
  String? file;

  Download({this.id, this.name, this.file,});

  factory Download.fromJson(Map<String, dynamic> json) => Download(
    id: json["id"],
    name: json["name"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "file": file,
  };
}

class Image {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;
  int? position;

  Image({this.id, this.dateCreated, this.dateCreatedGmt, this.dateModified, this.dateModifiedGmt, this.src, this.name, this.alt, this.position,});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] ?? 0,
    dateCreated: json["date_created"] ?? '',
    dateCreatedGmt: json["date_created_gmt"] ?? '',
    dateModified: json["date_modified"] ?? '',
    dateModifiedGmt: json["date_modified_gmt"] ?? '',
    src: json["src"] ?? '',
    name: json["name"] ?? '',
    alt: json["alt"] ?? '',
    position: json["position"] ?? 0,
  );
}

class Links {
  List<Collection>? self;
  List<Collection>? collection;

  Links({this.self, this.collection,});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<Collection>.from(json["self"]!.map((x) => Collection.fromJson(x))),
    collection: json["collection"] == null ? [] : List<Collection>.from(json["collection"]!.map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}

class Collection {
  String? href;

  Collection({this.href,});

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(href: json["href"],);

  Map<String, dynamic> toJson() => {"href": href,};
}

class MetaDatum {
  int? id;
  String? key;
  dynamic value;

  MetaDatum({this.id, this.key, this.value,});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"] ?? 0,
    key: json["key"] ?? '',
    value: json["value"],
  );
}

class Store {
  int? id;
  String? name;
  String? url;
  String? avatar;
  Address? address;

  Store({this.id, this.name, this.url, this.avatar, this.address,});

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"] ?? 0,
    name: json["name"] ?? '',
    url: json["url"] ?? '',
    avatar: json["avatar"] ?? '',
    address: json["address"] == null ? Address()  : Address.fromJson(json["address"]),
  );
}

class Address {
  String? street1, street2, city, zip, country, state;

  Address({this.street1, this.street2, this.city, this.zip, this.country, this.state,});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street1: json["street_1"] ?? '',
    street2: json["street_2"] ?? '',
    city: json["city"] ?? '',
    zip: json["zip"] ?? '',
    country: json["country"] ?? '',
    state: json["state"] ?? '',
  );
}
