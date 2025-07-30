class TagsModel {
  TagsModel({
    required this.id,
    required this.count,
    required this.description,
    required this.link,
    required this.name,
    required this.slug,
    required this.taxonomy,
    required this.meta,
    required this.yoastHead,
    required this.yoastHeadJson,
    required this.links,
  });

  final int? id;
  final int? count;
  final String? description;
  final String? link;
  final String? name;
  final String? slug;
  final String? taxonomy;
  final List<dynamic> meta;
  final String? yoastHead;
  final YoastHeadJson? yoastHeadJson;
  final Links? links;

  TagsModel copyWith({
    int? id,
    int? count,
    String? description,
    String? link,
    String? name,
    String? slug,
    String? taxonomy,
    List<dynamic>? meta,
    String? yoastHead,
    YoastHeadJson? yoastHeadJson,
    Links? links,
  }) {
    return TagsModel(
      id: id ?? this.id,
      count: count ?? this.count,
      description: description ?? this.description,
      link: link ?? this.link,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      taxonomy: taxonomy ?? this.taxonomy,
      meta: meta ?? this.meta,
      yoastHead: yoastHead ?? this.yoastHead,
      yoastHeadJson: yoastHeadJson ?? this.yoastHeadJson,
      links: links ?? this.links,
    );
  }

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      id: json["id"],
      count: json["count"],
      description: json["description"],
      link: json["link"],
      name: json["name"],
      slug: json["slug"],
      taxonomy: json["taxonomy"],
      meta: json["meta"] == null
          ? []
          : List<dynamic>.from(json["meta"]!.map((x) => x)),
      yoastHead: json["yoast_head"],
      yoastHeadJson: json["yoast_head_json"] == null
          ? null
          : YoastHeadJson.fromJson(json["yoast_head_json"]),
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "description": description,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomy,
        "meta": meta.map((x) => x).toList(),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson?.toJson(),
        "_links": links?.toJson(),
      };

  @override
  String toString() {
    return "$id, $count, $description, $link, $name, $slug, $taxonomy, $meta, $yoastHead, $yoastHeadJson, $links, ";
  }
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.wpPostType,
    required this.curies,
  });

  final List<Self> self;
  final List<About> collection;
  final List<About> about;
  final List<About> wpPostType;
  final List<Cury> curies;

  Links copyWith({
    List<Self>? self,
    List<About>? collection,
    List<About>? about,
    List<About>? wpPostType,
    List<Cury>? curies,
  }) {
    return Links(
      self: self ?? this.self,
      collection: collection ?? this.collection,
      about: about ?? this.about,
      wpPostType: wpPostType ?? this.wpPostType,
      curies: curies ?? this.curies,
    );
  }

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json["self"] == null
          ? []
          : List<Self>.from(json["self"]!.map((x) => Self.fromJson(x))),
      collection: json["collection"] == null
          ? []
          : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
      about: json["about"] == null
          ? []
          : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
      wpPostType: json["wp:post_type"] == null
          ? []
          : List<About>.from(
              json["wp:post_type"]!.map((x) => About.fromJson(x))),
      curies: json["curies"] == null
          ? []
          : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "self": self.map((x) => x.toJson()).toList(),
        "collection": collection.map((x) => x.toJson()).toList(),
        "about": about.map((x) => x.toJson()).toList(),
        "wp:post_type": wpPostType.map((x) => x.toJson()).toList(),
        "curies": curies.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$self, $collection, $about, $wpPostType, $curies, ";
  }
}

class About {
  About({
    required this.href,
  });

  final String? href;

  About copyWith({
    String? href,
  }) {
    return About(
      href: href ?? this.href,
    );
  }

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
      };

  @override
  String toString() {
    return "$href, ";
  }
}

class Cury {
  Cury({
    required this.name,
    required this.href,
    required this.templated,
  });

  final String? name;
  final String? href;
  final bool? templated;

  Cury copyWith({
    String? name,
    String? href,
    bool? templated,
  }) {
    return Cury(
      name: name ?? this.name,
      href: href ?? this.href,
      templated: templated ?? this.templated,
    );
  }

  factory Cury.fromJson(Map<String, dynamic> json) {
    return Cury(
      name: json["name"],
      href: json["href"],
      templated: json["templated"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };

  @override
  String toString() {
    return "$name, $href, $templated, ";
  }
}

class Self {
  Self({
    required this.href,
    required this.targetHints,
  });

  final String? href;
  final TargetHints? targetHints;

  Self copyWith({
    String? href,
    TargetHints? targetHints,
  }) {
    return Self(
      href: href ?? this.href,
      targetHints: targetHints ?? this.targetHints,
    );
  }

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json["href"],
      targetHints: json["targetHints"] == null
          ? null
          : TargetHints.fromJson(json["targetHints"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "href": href,
        "targetHints": targetHints?.toJson(),
      };

  @override
  String toString() {
    return "$href, $targetHints, ";
  }
}

class TargetHints {
  TargetHints({
    required this.allow,
  });

  final List<String> allow;

  TargetHints copyWith({
    List<String>? allow,
  }) {
    return TargetHints(
      allow: allow ?? this.allow,
    );
  }

  factory TargetHints.fromJson(Map<String, dynamic> json) {
    return TargetHints(
      allow: json["allow"] == null
          ? []
          : List<String>.from(json["allow"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "allow": allow.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$allow, ";
  }
}

class YoastHeadJson {
  YoastHeadJson({
    required this.title,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogUrl,
    required this.ogSiteName,
    required this.twitterCard,
    required this.schema,
  });

  final String? title;
  final Robots? robots;
  final String? canonical;
  final String? ogLocale;
  final String? ogType;
  final String? ogTitle;
  final String? ogUrl;
  final String? ogSiteName;
  final String? twitterCard;
  final Schema? schema;

  YoastHeadJson copyWith({
    String? title,
    Robots? robots,
    String? canonical,
    String? ogLocale,
    String? ogType,
    String? ogTitle,
    String? ogUrl,
    String? ogSiteName,
    String? twitterCard,
    Schema? schema,
  }) {
    return YoastHeadJson(
      title: title ?? this.title,
      robots: robots ?? this.robots,
      canonical: canonical ?? this.canonical,
      ogLocale: ogLocale ?? this.ogLocale,
      ogType: ogType ?? this.ogType,
      ogTitle: ogTitle ?? this.ogTitle,
      ogUrl: ogUrl ?? this.ogUrl,
      ogSiteName: ogSiteName ?? this.ogSiteName,
      twitterCard: twitterCard ?? this.twitterCard,
      schema: schema ?? this.schema,
    );
  }

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) {
    return YoastHeadJson(
      title: json["title"],
      robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
      canonical: json["canonical"],
      ogLocale: json["og_locale"],
      ogType: json["og_type"],
      ogTitle: json["og_title"],
      ogUrl: json["og_url"],
      ogSiteName: json["og_site_name"],
      twitterCard: json["twitter_card"],
      schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "twitter_card": twitterCard,
        "schema": schema?.toJson(),
      };

  @override
  String toString() {
    return "$title, $robots, $canonical, $ogLocale, $ogType, $ogTitle, $ogUrl, $ogSiteName, $twitterCard, $schema, ";
  }
}

class Robots {
  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  final String? index;
  final String? follow;
  final String? maxSnippet;
  final String? maxImagePreview;
  final String? maxVideoPreview;

  Robots copyWith({
    String? index,
    String? follow,
    String? maxSnippet,
    String? maxImagePreview,
    String? maxVideoPreview,
  }) {
    return Robots(
      index: index ?? this.index,
      follow: follow ?? this.follow,
      maxSnippet: maxSnippet ?? this.maxSnippet,
      maxImagePreview: maxImagePreview ?? this.maxImagePreview,
      maxVideoPreview: maxVideoPreview ?? this.maxVideoPreview,
    );
  }

  factory Robots.fromJson(Map<String, dynamic> json) {
    return Robots(
      index: json["index"],
      follow: json["follow"],
      maxSnippet: json["max-snippet"],
      maxImagePreview: json["max-image-preview"],
      maxVideoPreview: json["max-video-preview"],
    );
  }

  Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
      };

  @override
  String toString() {
    return "$index, $follow, $maxSnippet, $maxImagePreview, $maxVideoPreview, ";
  }
}

class Schema {
  Schema({
    required this.context,
    required this.graph,
  });

  final String? context;
  final List<Graph> graph;

  Schema copyWith({
    String? context,
    List<Graph>? graph,
  }) {
    return Schema(
      context: context ?? this.context,
      graph: graph ?? this.graph,
    );
  }

  factory Schema.fromJson(Map<String, dynamic> json) {
    return Schema(
      context: json["@context"],
      graph: json["@graph"] == null
          ? []
          : List<Graph>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$context, $graph, ";
  }
}

class Graph {
  Graph({
    required this.type,
    required this.id,
    required this.url,
    required this.name,
    required this.isPartOf,
    required this.breadcrumb,
    required this.inLanguage,
    required this.itemListElement,
    required this.description,
    required this.publisher,
    required this.potentialAction,
    required this.image,
    required this.logo,
    required this.sameAs,
  });

  final dynamic type;
  final String? id;
  final String? url;
  final String? name;
  final Breadcrumb? isPartOf;
  final Breadcrumb? breadcrumb;
  final String? inLanguage;
  final List<ItemListElement> itemListElement;
  final String? description;
  final Breadcrumb? publisher;
  final List<PotentialAction> potentialAction;
  final Image? image;
  final Breadcrumb? logo;
  final List<String> sameAs;

  Graph copyWith({
    dynamic type,
    String? id,
    String? url,
    String? name,
    Breadcrumb? isPartOf,
    Breadcrumb? breadcrumb,
    String? inLanguage,
    List<ItemListElement>? itemListElement,
    String? description,
    Breadcrumb? publisher,
    List<PotentialAction>? potentialAction,
    Image? image,
    Breadcrumb? logo,
    List<String>? sameAs,
  }) {
    return Graph(
      type: type ?? this.type,
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      isPartOf: isPartOf ?? this.isPartOf,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      inLanguage: inLanguage ?? this.inLanguage,
      itemListElement: itemListElement ?? this.itemListElement,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      potentialAction: potentialAction ?? this.potentialAction,
      image: image ?? this.image,
      logo: logo ?? this.logo,
      sameAs: sameAs ?? this.sameAs,
    );
  }

  factory Graph.fromJson(Map<String, dynamic> json) {
    return Graph(
      type: json["@type"],
      id: json["@id"],
      url: json["url"],
      name: json["name"],
      isPartOf: json["isPartOf"] == null
          ? null
          : Breadcrumb.fromJson(json["isPartOf"]),
      breadcrumb: json["breadcrumb"] == null
          ? null
          : Breadcrumb.fromJson(json["breadcrumb"]),
      inLanguage: json["inLanguage"],
      itemListElement: json["itemListElement"] == null
          ? []
          : List<ItemListElement>.from(
              json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
      description: json["description"],
      publisher: json["publisher"] == null
          ? null
          : Breadcrumb.fromJson(json["publisher"]),
      potentialAction: json["potentialAction"] == null
          ? []
          : List<PotentialAction>.from(
              json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      logo: json["logo"] == null ? null : Breadcrumb.fromJson(json["logo"]),
      sameAs: json["sameAs"] == null
          ? []
          : List<String>.from(json["sameAs"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "url": url,
        "name": name,
        "isPartOf": isPartOf?.toJson(),
        "breadcrumb": breadcrumb?.toJson(),
        "inLanguage": inLanguage,
        "itemListElement": itemListElement.map((x) => x.toJson()).toList(),
        "description": description,
        "publisher": publisher?.toJson(),
        "potentialAction": potentialAction.map((x) => x.toJson()).toList(),
        "image": image?.toJson(),
        "logo": logo?.toJson(),
        "sameAs": sameAs.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$type, $id, $url, $name, $isPartOf, $breadcrumb, $inLanguage, $itemListElement, $description, $publisher, $potentialAction, $image, $logo, $sameAs, ";
  }
}

class Breadcrumb {
  Breadcrumb({
    required this.id,
  });

  final String? id;

  Breadcrumb copyWith({
    String? id,
  }) {
    return Breadcrumb(
      id: id ?? this.id,
    );
  }

  factory Breadcrumb.fromJson(Map<String, dynamic> json) {
    return Breadcrumb(
      id: json["@id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "@id": id,
      };

  @override
  String toString() {
    return "$id, ";
  }
}

class Image {
  Image({
    required this.type,
    required this.inLanguage,
    required this.id,
    required this.url,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.caption,
  });

  final String? type;
  final String? inLanguage;
  final String? id;
  final String? url;
  final String? contentUrl;
  final int? width;
  final int? height;
  final String? caption;

  Image copyWith({
    String? type,
    String? inLanguage,
    String? id,
    String? url,
    String? contentUrl,
    int? width,
    int? height,
    String? caption,
  }) {
    return Image(
      type: type ?? this.type,
      inLanguage: inLanguage ?? this.inLanguage,
      id: id ?? this.id,
      url: url ?? this.url,
      contentUrl: contentUrl ?? this.contentUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      caption: caption ?? this.caption,
    );
  }

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      type: json["@type"],
      inLanguage: json["inLanguage"],
      id: json["@id"],
      url: json["url"],
      contentUrl: json["contentUrl"],
      width: json["width"],
      height: json["height"],
      caption: json["caption"],
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "inLanguage": inLanguage,
        "@id": id,
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": caption,
      };

  @override
  String toString() {
    return "$type, $inLanguage, $id, $url, $contentUrl, $width, $height, $caption, ";
  }
}

class ItemListElement {
  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    required this.item,
  });

  final String? type;
  final int? position;
  final String? name;
  final String? item;

  ItemListElement copyWith({
    String? type,
    int? position,
    String? name,
    String? item,
  }) {
    return ItemListElement(
      type: type ?? this.type,
      position: position ?? this.position,
      name: name ?? this.name,
      item: item ?? this.item,
    );
  }

  factory ItemListElement.fromJson(Map<String, dynamic> json) {
    return ItemListElement(
      type: json["@type"],
      position: json["position"],
      name: json["name"],
      item: json["item"],
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
      };

  @override
  String toString() {
    return "$type, $position, $name, $item, ";
  }
}

class PotentialAction {
  PotentialAction({
    required this.type,
    required this.target,
    required this.queryInput,
  });

  final String? type;
  final Target? target;
  final QueryInput? queryInput;

  PotentialAction copyWith({
    String? type,
    Target? target,
    QueryInput? queryInput,
  }) {
    return PotentialAction(
      type: type ?? this.type,
      target: target ?? this.target,
      queryInput: queryInput ?? this.queryInput,
    );
  }

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return PotentialAction(
      type: json["@type"],
      target: json["target"] == null ? null : Target.fromJson(json["target"]),
      queryInput: json["query-input"] == null
          ? null
          : QueryInput.fromJson(json["query-input"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target?.toJson(),
        "query-input": queryInput?.toJson(),
      };

  @override
  String toString() {
    return "$type, $target, $queryInput, ";
  }
}

class QueryInput {
  QueryInput({
    required this.type,
    required this.valueRequired,
    required this.valueName,
  });

  final String? type;
  final bool? valueRequired;
  final String? valueName;

  QueryInput copyWith({
    String? type,
    bool? valueRequired,
    String? valueName,
  }) {
    return QueryInput(
      type: type ?? this.type,
      valueRequired: valueRequired ?? this.valueRequired,
      valueName: valueName ?? this.valueName,
    );
  }

  factory QueryInput.fromJson(Map<String, dynamic> json) {
    return QueryInput(
      type: json["@type"],
      valueRequired: json["valueRequired"],
      valueName: json["valueName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "valueRequired": valueRequired,
        "valueName": valueName,
      };

  @override
  String toString() {
    return "$type, $valueRequired, $valueName, ";
  }
}

class Target {
  Target({
    required this.type,
    required this.urlTemplate,
  });

  final String? type;
  final String? urlTemplate;

  Target copyWith({
    String? type,
    String? urlTemplate,
  }) {
    return Target(
      type: type ?? this.type,
      urlTemplate: urlTemplate ?? this.urlTemplate,
    );
  }

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      type: json["@type"],
      urlTemplate: json["urlTemplate"],
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
      };

  @override
  String toString() {
    return "$type, $urlTemplate, ";
  }
}
