class PostsModel {
  PostsModel({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.meta,
    required this.categories,
    required this.tags,
    required this.classList,
    required this.acf,
    required this.yoastHead,
    required this.yoastHeadJson,
    required this.links,
  });

  final int? id;
  final DateTime? date;
  final DateTime? dateGmt;
  final Guid? guid;
  final DateTime? modified;
  final DateTime? modifiedGmt;
  final String? slug;
  final String? status;
  final String? type;
  final String? link;
  final Guid? title;
  final Content? content;
  final Content? excerpt;
  final int? author;
  final int? featuredMedia;
  final String? commentStatus;
  final String? pingStatus;
  final bool? sticky;
  final String? template;
  final String? format;
  final Meta? meta;
  final List<int> categories;
  final List<int> tags;
  final List<String> classList;
  final List<dynamic> acf;
  final String? yoastHead;
  final YoastHeadJson? yoastHeadJson;
  final Links? links;

  PostsModel copyWith({
    int? id,
    DateTime? date,
    DateTime? dateGmt,
    Guid? guid,
    DateTime? modified,
    DateTime? modifiedGmt,
    String? slug,
    String? status,
    String? type,
    String? link,
    Guid? title,
    Content? content,
    Content? excerpt,
    int? author,
    int? featuredMedia,
    String? commentStatus,
    String? pingStatus,
    bool? sticky,
    String? template,
    String? format,
    Meta? meta,
    List<int>? categories,
    List<int>? tags,
    List<String>? classList,
    List<dynamic>? acf,
    String? yoastHead,
    YoastHeadJson? yoastHeadJson,
    Links? links,
  }) {
    return PostsModel(
      id: id ?? this.id,
      date: date ?? this.date,
      dateGmt: dateGmt ?? this.dateGmt,
      guid: guid ?? this.guid,
      modified: modified ?? this.modified,
      modifiedGmt: modifiedGmt ?? this.modifiedGmt,
      slug: slug ?? this.slug,
      status: status ?? this.status,
      type: type ?? this.type,
      link: link ?? this.link,
      title: title ?? this.title,
      content: content ?? this.content,
      excerpt: excerpt ?? this.excerpt,
      author: author ?? this.author,
      featuredMedia: featuredMedia ?? this.featuredMedia,
      commentStatus: commentStatus ?? this.commentStatus,
      pingStatus: pingStatus ?? this.pingStatus,
      sticky: sticky ?? this.sticky,
      template: template ?? this.template,
      format: format ?? this.format,
      meta: meta ?? this.meta,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      classList: classList ?? this.classList,
      acf: acf ?? this.acf,
      yoastHead: yoastHead ?? this.yoastHead,
      yoastHeadJson: yoastHeadJson ?? this.yoastHeadJson,
      links: links ?? this.links,
    );
  }

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json["id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      dateGmt: DateTime.tryParse(json["date_gmt"] ?? ""),
      guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
      modified: DateTime.tryParse(json["modified"] ?? ""),
      modifiedGmt: DateTime.tryParse(json["modified_gmt"] ?? ""),
      slug: json["slug"],
      status: json["status"],
      type: json["type"],
      link: json["link"],
      title: json["title"] == null ? null : Guid.fromJson(json["title"]),
      content:
          json["content"] == null ? null : Content.fromJson(json["content"]),
      excerpt:
          json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
      author: json["author"],
      featuredMedia: json["featured_media"],
      commentStatus: json["comment_status"],
      pingStatus: json["ping_status"],
      sticky: json["sticky"],
      template: json["template"],
      format: json["format"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      categories: json["categories"] == null
          ? []
          : List<int>.from(json["categories"]!.map((x) => x)),
      tags: json["tags"] == null
          ? []
          : List<int>.from(json["tags"]!.map((x) => x)),
      classList: json["class_list"] == null
          ? []
          : List<String>.from(json["class_list"]!.map((x) => x)),
      acf: json["acf"] == null
          ? []
          : List<dynamic>.from(json["acf"]!.map((x) => x)),
      yoastHead: json["yoast_head"],
      yoastHeadJson: json["yoast_head_json"] == null
          ? null
          : YoastHeadJson.fromJson(json["yoast_head_json"]),
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "guid": guid?.toJson(),
        "modified": modified?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title?.toJson(),
        "content": content?.toJson(),
        "excerpt": excerpt?.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta?.toJson(),
        "categories": categories.map((x) => x).toList(),
        "tags": tags.map((x) => x).toList(),
        "class_list": classList.map((x) => x).toList(),
        "acf": acf.map((x) => x).toList(),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson?.toJson(),
        "_links": links?.toJson(),
      };

  @override
  String toString() {
    return "$id, $date, $dateGmt, $guid, $modified, $modifiedGmt, $slug, $status, $type, $link, $title, $content, $excerpt, $author, $featuredMedia, $commentStatus, $pingStatus, $sticky, $template, $format, $meta, $categories, $tags, $classList, $acf, $yoastHead, $yoastHeadJson, $links, ";
  }
}

class Content {
  Content({
    required this.rendered,
    required this.protected,
  });

  final String? rendered;
  final bool? protected;

  Content copyWith({
    String? rendered,
    bool? protected,
  }) {
    return Content(
      rendered: rendered ?? this.rendered,
      protected: protected ?? this.protected,
    );
  }

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      rendered: json["rendered"],
      protected: json["protected"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };

  @override
  String toString() {
    return "$rendered, $protected, ";
  }
}

class Guid {
  Guid({
    required this.rendered,
  });

  final String? rendered;

  Guid copyWith({
    String? rendered,
  }) {
    return Guid(
      rendered: rendered ?? this.rendered,
    );
  }

  factory Guid.fromJson(Map<String, dynamic> json) {
    return Guid(
      rendered: json["rendered"],
    );
  }

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };

  @override
  String toString() {
    return "$rendered, ";
  }
}

class Links {
  Links({
    required this.self,
    required this.collection,
    required this.about,
    required this.author,
    required this.replies,
    required this.versionHistory,
    required this.predecessorVersion,
    required this.wpFeaturedmedia,
    required this.wpAttachment,
    required this.wpTerm,
    required this.curies,
  });

  final List<Self> self;
  final List<About> collection;
  final List<About> about;
  final List<AuthorElement> author;
  final List<AuthorElement> replies;
  final List<VersionHistory> versionHistory;
  final List<PredecessorVersion> predecessorVersion;
  final List<AuthorElement> wpFeaturedmedia;
  final List<About> wpAttachment;
  final List<WpTerm> wpTerm;
  final List<Cury> curies;

  Links copyWith({
    List<Self>? self,
    List<About>? collection,
    List<About>? about,
    List<AuthorElement>? author,
    List<AuthorElement>? replies,
    List<VersionHistory>? versionHistory,
    List<PredecessorVersion>? predecessorVersion,
    List<AuthorElement>? wpFeaturedmedia,
    List<About>? wpAttachment,
    List<WpTerm>? wpTerm,
    List<Cury>? curies,
  }) {
    return Links(
      self: self ?? this.self,
      collection: collection ?? this.collection,
      about: about ?? this.about,
      author: author ?? this.author,
      replies: replies ?? this.replies,
      versionHistory: versionHistory ?? this.versionHistory,
      predecessorVersion: predecessorVersion ?? this.predecessorVersion,
      wpFeaturedmedia: wpFeaturedmedia ?? this.wpFeaturedmedia,
      wpAttachment: wpAttachment ?? this.wpAttachment,
      wpTerm: wpTerm ?? this.wpTerm,
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
      author: json["author"] == null
          ? []
          : List<AuthorElement>.from(
              json["author"]!.map((x) => AuthorElement.fromJson(x))),
      replies: json["replies"] == null
          ? []
          : List<AuthorElement>.from(
              json["replies"]!.map((x) => AuthorElement.fromJson(x))),
      versionHistory: json["version-history"] == null
          ? []
          : List<VersionHistory>.from(
              json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
      predecessorVersion: json["predecessor-version"] == null
          ? []
          : List<PredecessorVersion>.from(json["predecessor-version"]!
              .map((x) => PredecessorVersion.fromJson(x))),
      wpFeaturedmedia: json["wp:featuredmedia"] == null
          ? []
          : List<AuthorElement>.from(
              json["wp:featuredmedia"]!.map((x) => AuthorElement.fromJson(x))),
      wpAttachment: json["wp:attachment"] == null
          ? []
          : List<About>.from(
              json["wp:attachment"]!.map((x) => About.fromJson(x))),
      wpTerm: json["wp:term"] == null
          ? []
          : List<WpTerm>.from(json["wp:term"]!.map((x) => WpTerm.fromJson(x))),
      curies: json["curies"] == null
          ? []
          : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "self": self.map((x) => x.toJson()).toList(),
        "collection": collection.map((x) => x.toJson()).toList(),
        "about": about.map((x) => x.toJson()).toList(),
        "author": author.map((x) => x.toJson()).toList(),
        "replies": replies.map((x) => x.toJson()).toList(),
        "version-history": versionHistory.map((x) => x.toJson()).toList(),
        "predecessor-version":
            predecessorVersion.map((x) => x.toJson()).toList(),
        "wp:featuredmedia": wpFeaturedmedia.map((x) => x.toJson()).toList(),
        "wp:attachment": wpAttachment.map((x) => x.toJson()).toList(),
        "wp:term": wpTerm.map((x) => x.toJson()).toList(),
        "curies": curies.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$self, $collection, $about, $author, $replies, $versionHistory, $predecessorVersion, $wpFeaturedmedia, $wpAttachment, $wpTerm, $curies, ";
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

class AuthorElement {
  AuthorElement({
    required this.embeddable,
    required this.href,
  });

  final bool? embeddable;
  final String? href;

  AuthorElement copyWith({
    bool? embeddable,
    String? href,
  }) {
    return AuthorElement(
      embeddable: embeddable ?? this.embeddable,
      href: href ?? this.href,
    );
  }

  factory AuthorElement.fromJson(Map<String, dynamic> json) {
    return AuthorElement(
      embeddable: json["embeddable"],
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };

  @override
  String toString() {
    return "$embeddable, $href, ";
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

class PredecessorVersion {
  PredecessorVersion({
    required this.id,
    required this.href,
  });

  final int? id;
  final String? href;

  PredecessorVersion copyWith({
    int? id,
    String? href,
  }) {
    return PredecessorVersion(
      id: id ?? this.id,
      href: href ?? this.href,
    );
  }

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) {
    return PredecessorVersion(
      id: json["id"],
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };

  @override
  String toString() {
    return "$id, $href, ";
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

class VersionHistory {
  VersionHistory({
    required this.count,
    required this.href,
  });

  final int? count;
  final String? href;

  VersionHistory copyWith({
    int? count,
    String? href,
  }) {
    return VersionHistory(
      count: count ?? this.count,
      href: href ?? this.href,
    );
  }

  factory VersionHistory.fromJson(Map<String, dynamic> json) {
    return VersionHistory(
      count: json["count"],
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };

  @override
  String toString() {
    return "$count, $href, ";
  }
}

class WpTerm {
  WpTerm({
    required this.taxonomy,
    required this.embeddable,
    required this.href,
  });

  final String? taxonomy;
  final bool? embeddable;
  final String? href;

  WpTerm copyWith({
    String? taxonomy,
    bool? embeddable,
    String? href,
  }) {
    return WpTerm(
      taxonomy: taxonomy ?? this.taxonomy,
      embeddable: embeddable ?? this.embeddable,
      href: href ?? this.href,
    );
  }

  factory WpTerm.fromJson(Map<String, dynamic> json) {
    return WpTerm(
      taxonomy: json["taxonomy"],
      embeddable: json["embeddable"],
      href: json["href"],
    );
  }

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };

  @override
  String toString() {
    return "$taxonomy, $embeddable, $href, ";
  }
}

class Meta {
  Meta({
    required this.acfChanged,
    required this.footnotes,
  });

  final bool? acfChanged;
  final String? footnotes;

  Meta copyWith({
    bool? acfChanged,
    String? footnotes,
  }) {
    return Meta(
      acfChanged: acfChanged ?? this.acfChanged,
      footnotes: footnotes ?? this.footnotes,
    );
  }

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      acfChanged: json["_acf_changed"],
      footnotes: json["footnotes"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_acf_changed": acfChanged,
        "footnotes": footnotes,
      };

  @override
  String toString() {
    return "$acfChanged, $footnotes, ";
  }
}

class YoastHeadJson {
  YoastHeadJson({
    required this.title,
    required this.description,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogDescription,
    required this.ogUrl,
    required this.ogSiteName,
    required this.articlePublishedTime,
    required this.articleModifiedTime,
    required this.ogImage,
    required this.author,
    required this.twitterCard,
    required this.twitterMisc,
    required this.schema,
  });

  final String? title;
  final String? description;
  final Robots? robots;
  final String? canonical;
  final String? ogLocale;
  final String? ogType;
  final String? ogTitle;
  final String? ogDescription;
  final String? ogUrl;
  final String? ogSiteName;
  final DateTime? articlePublishedTime;
  final DateTime? articleModifiedTime;
  final List<OgImage> ogImage;
  final String? author;
  final String? twitterCard;
  final TwitterMisc? twitterMisc;
  final Schema? schema;

  YoastHeadJson copyWith({
    String? title,
    String? description,
    Robots? robots,
    String? canonical,
    String? ogLocale,
    String? ogType,
    String? ogTitle,
    String? ogDescription,
    String? ogUrl,
    String? ogSiteName,
    DateTime? articlePublishedTime,
    DateTime? articleModifiedTime,
    List<OgImage>? ogImage,
    String? author,
    String? twitterCard,
    TwitterMisc? twitterMisc,
    Schema? schema,
  }) {
    return YoastHeadJson(
      title: title ?? this.title,
      description: description ?? this.description,
      robots: robots ?? this.robots,
      canonical: canonical ?? this.canonical,
      ogLocale: ogLocale ?? this.ogLocale,
      ogType: ogType ?? this.ogType,
      ogTitle: ogTitle ?? this.ogTitle,
      ogDescription: ogDescription ?? this.ogDescription,
      ogUrl: ogUrl ?? this.ogUrl,
      ogSiteName: ogSiteName ?? this.ogSiteName,
      articlePublishedTime: articlePublishedTime ?? this.articlePublishedTime,
      articleModifiedTime: articleModifiedTime ?? this.articleModifiedTime,
      ogImage: ogImage ?? this.ogImage,
      author: author ?? this.author,
      twitterCard: twitterCard ?? this.twitterCard,
      twitterMisc: twitterMisc ?? this.twitterMisc,
      schema: schema ?? this.schema,
    );
  }

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) {
    return YoastHeadJson(
      title: json["title"],
      description: json["description"],
      robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
      canonical: json["canonical"],
      ogLocale: json["og_locale"],
      ogType: json["og_type"],
      ogTitle: json["og_title"],
      ogDescription: json["og_description"],
      ogUrl: json["og_url"],
      ogSiteName: json["og_site_name"],
      articlePublishedTime:
          DateTime.tryParse(json["article_published_time"] ?? ""),
      articleModifiedTime:
          DateTime.tryParse(json["article_modified_time"] ?? ""),
      ogImage: json["og_image"] == null
          ? []
          : List<OgImage>.from(
              json["og_image"]!.map((x) => OgImage.fromJson(x))),
      author: json["author"],
      twitterCard: json["twitter_card"],
      twitterMisc: json["twitter_misc"] == null
          ? null
          : TwitterMisc.fromJson(json["twitter_misc"]),
      schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_published_time": articlePublishedTime?.toIso8601String(),
        "article_modified_time": articleModifiedTime?.toIso8601String(),
        "og_image": ogImage.map((x) => x.toJson()).toList(),
        "author": author,
        "twitter_card": twitterCard,
        "twitter_misc": twitterMisc?.toJson(),
        "schema": schema?.toJson(),
      };

  @override
  String toString() {
    return "$title, $description, $robots, $canonical, $ogLocale, $ogType, $ogTitle, $ogDescription, $ogUrl, $ogSiteName, $articlePublishedTime, $articleModifiedTime, $ogImage, $author, $twitterCard, $twitterMisc, $schema, ";
  }
}

class OgImage {
  OgImage({
    required this.width,
    required this.height,
    required this.url,
    required this.type,
  });

  final int? width;
  final int? height;
  final String? url;
  final String? type;

  OgImage copyWith({
    int? width,
    int? height,
    String? url,
    String? type,
  }) {
    return OgImage(
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
      type: type ?? this.type,
    );
  }

  factory OgImage.fromJson(Map<String, dynamic> json) {
    return OgImage(
      width: json["width"],
      height: json["height"],
      url: json["url"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": type,
      };

  @override
  String toString() {
    return "$width, $height, $url, $type, ";
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
    required this.isPartOf,
    required this.author,
    required this.headline,
    required this.datePublished,
    required this.dateModified,
    required this.mainEntityOfPage,
    required this.wordCount,
    required this.commentCount,
    required this.publisher,
    required this.image,
    required this.thumbnailUrl,
    required this.keywords,
    required this.articleSection,
    required this.inLanguage,
    required this.potentialAction,
    required this.url,
    required this.name,
    required this.primaryImageOfPage,
    required this.description,
    required this.breadcrumb,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.caption,
    required this.itemListElement,
    required this.logo,
    required this.sameAs,
  });

  final dynamic type;
  final String? id;
  final Breadcrumb? isPartOf;
  final GraphAuthor? author;
  final String? headline;
  final DateTime? datePublished;
  final DateTime? dateModified;
  final Breadcrumb? mainEntityOfPage;
  final int? wordCount;
  final int? commentCount;
  final Breadcrumb? publisher;
  final Image? image;
  final String? thumbnailUrl;
  final List<String> keywords;
  final List<String> articleSection;
  final String? inLanguage;
  final List<PotentialAction> potentialAction;
  final String? url;
  final String? name;
  final Breadcrumb? primaryImageOfPage;
  final String? description;
  final Breadcrumb? breadcrumb;
  final String? contentUrl;
  final int? width;
  final int? height;
  final String? caption;
  final List<ItemListElement> itemListElement;
  final Breadcrumb? logo;
  final List<String> sameAs;

  Graph copyWith({
    dynamic type,
    String? id,
    Breadcrumb? isPartOf,
    GraphAuthor? author,
    String? headline,
    DateTime? datePublished,
    DateTime? dateModified,
    Breadcrumb? mainEntityOfPage,
    int? wordCount,
    int? commentCount,
    Breadcrumb? publisher,
    Image? image,
    String? thumbnailUrl,
    List<String>? keywords,
    List<String>? articleSection,
    String? inLanguage,
    List<PotentialAction>? potentialAction,
    String? url,
    String? name,
    Breadcrumb? primaryImageOfPage,
    String? description,
    Breadcrumb? breadcrumb,
    String? contentUrl,
    int? width,
    int? height,
    String? caption,
    List<ItemListElement>? itemListElement,
    Breadcrumb? logo,
    List<String>? sameAs,
  }) {
    return Graph(
      type: type ?? this.type,
      id: id ?? this.id,
      isPartOf: isPartOf ?? this.isPartOf,
      author: author ?? this.author,
      headline: headline ?? this.headline,
      datePublished: datePublished ?? this.datePublished,
      dateModified: dateModified ?? this.dateModified,
      mainEntityOfPage: mainEntityOfPage ?? this.mainEntityOfPage,
      wordCount: wordCount ?? this.wordCount,
      commentCount: commentCount ?? this.commentCount,
      publisher: publisher ?? this.publisher,
      image: image ?? this.image,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      keywords: keywords ?? this.keywords,
      articleSection: articleSection ?? this.articleSection,
      inLanguage: inLanguage ?? this.inLanguage,
      potentialAction: potentialAction ?? this.potentialAction,
      url: url ?? this.url,
      name: name ?? this.name,
      primaryImageOfPage: primaryImageOfPage ?? this.primaryImageOfPage,
      description: description ?? this.description,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      contentUrl: contentUrl ?? this.contentUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      caption: caption ?? this.caption,
      itemListElement: itemListElement ?? this.itemListElement,
      logo: logo ?? this.logo,
      sameAs: sameAs ?? this.sameAs,
    );
  }

  factory Graph.fromJson(Map<String, dynamic> json) {
    return Graph(
      type: json["@type"],
      id: json["@id"],
      isPartOf: json["isPartOf"] == null
          ? null
          : Breadcrumb.fromJson(json["isPartOf"]),
      author:
          json["author"] == null ? null : GraphAuthor.fromJson(json["author"]),
      headline: json["headline"],
      datePublished: DateTime.tryParse(json["datePublished"] ?? ""),
      dateModified: DateTime.tryParse(json["dateModified"] ?? ""),
      mainEntityOfPage: json["mainEntityOfPage"] == null
          ? null
          : Breadcrumb.fromJson(json["mainEntityOfPage"]),
      wordCount: json["wordCount"],
      commentCount: json["commentCount"],
      publisher: json["publisher"] == null
          ? null
          : Breadcrumb.fromJson(json["publisher"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      thumbnailUrl: json["thumbnailUrl"],
      keywords: json["keywords"] == null
          ? []
          : List<String>.from(json["keywords"]!.map((x) => x)),
      articleSection: json["articleSection"] == null
          ? []
          : List<String>.from(json["articleSection"]!.map((x) => x)),
      inLanguage: json["inLanguage"],
      potentialAction: json["potentialAction"] == null
          ? []
          : List<PotentialAction>.from(
              json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
      url: json["url"],
      name: json["name"],
      primaryImageOfPage: json["primaryImageOfPage"] == null
          ? null
          : Breadcrumb.fromJson(json["primaryImageOfPage"]),
      description: json["description"],
      breadcrumb: json["breadcrumb"] == null
          ? null
          : Breadcrumb.fromJson(json["breadcrumb"]),
      contentUrl: json["contentUrl"],
      width: json["width"],
      height: json["height"],
      caption: json["caption"],
      itemListElement: json["itemListElement"] == null
          ? []
          : List<ItemListElement>.from(
              json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
      logo: json["logo"] == null ? null : Breadcrumb.fromJson(json["logo"]),
      sameAs: json["sameAs"] == null
          ? []
          : List<String>.from(json["sameAs"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "isPartOf": isPartOf?.toJson(),
        "author": author?.toJson(),
        "headline": headline,
        "datePublished": datePublished?.toIso8601String(),
        "dateModified": dateModified?.toIso8601String(),
        "mainEntityOfPage": mainEntityOfPage?.toJson(),
        "wordCount": wordCount,
        "commentCount": commentCount,
        "publisher": publisher?.toJson(),
        "image": image?.toJson(),
        "thumbnailUrl": thumbnailUrl,
        "keywords": keywords.map((x) => x).toList(),
        "articleSection": articleSection.map((x) => x).toList(),
        "inLanguage": inLanguage,
        "potentialAction": potentialAction.map((x) => x.toJson()).toList(),
        "url": url,
        "name": name,
        "primaryImageOfPage": primaryImageOfPage?.toJson(),
        "description": description,
        "breadcrumb": breadcrumb?.toJson(),
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": caption,
        "itemListElement": itemListElement.map((x) => x.toJson()).toList(),
        "logo": logo?.toJson(),
        "sameAs": sameAs.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$type, $id, $isPartOf, $author, $headline, $datePublished, $dateModified, $mainEntityOfPage, $wordCount, $commentCount, $publisher, $image, $thumbnailUrl, $keywords, $articleSection, $inLanguage, $potentialAction, $url, $name, $primaryImageOfPage, $description, $breadcrumb, $contentUrl, $width, $height, $caption, $itemListElement, $logo, $sameAs, ";
  }
}

class GraphAuthor {
  GraphAuthor({
    required this.name,
    required this.id,
  });

  final String? name;
  final String? id;

  GraphAuthor copyWith({
    String? name,
    String? id,
  }) {
    return GraphAuthor(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  factory GraphAuthor.fromJson(Map<String, dynamic> json) {
    return GraphAuthor(
      name: json["name"],
      id: json["@id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "@id": id,
      };

  @override
  String toString() {
    return "$name, $id, ";
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
    required this.id,
    required this.type,
    required this.inLanguage,
    required this.url,
    required this.contentUrl,
    required this.width,
    required this.height,
    required this.caption,
  });

  final String? id;
  final String? type;
  final String? inLanguage;
  final String? url;
  final String? contentUrl;
  final int? width;
  final int? height;
  final String? caption;

  Image copyWith({
    String? id,
    String? type,
    String? inLanguage,
    String? url,
    String? contentUrl,
    int? width,
    int? height,
    String? caption,
  }) {
    return Image(
      id: id ?? this.id,
      type: type ?? this.type,
      inLanguage: inLanguage ?? this.inLanguage,
      url: url ?? this.url,
      contentUrl: contentUrl ?? this.contentUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      caption: caption ?? this.caption,
    );
  }

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["@id"],
      type: json["@type"],
      inLanguage: json["inLanguage"],
      url: json["url"],
      contentUrl: json["contentUrl"],
      width: json["width"],
      height: json["height"],
      caption: json["caption"],
    );
  }

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "inLanguage": inLanguage,
        "url": url,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "caption": caption,
      };

  @override
  String toString() {
    return "$id, $type, $inLanguage, $url, $contentUrl, $width, $height, $caption, ";
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
    required this.name,
    required this.target,
    required this.queryInput,
  });

  final String? type;
  final String? name;
  final dynamic target;
  final QueryInput? queryInput;

  PotentialAction copyWith({
    String? type,
    String? name,
    dynamic target,
    QueryInput? queryInput,
  }) {
    return PotentialAction(
      type: type ?? this.type,
      name: name ?? this.name,
      target: target ?? this.target,
      queryInput: queryInput ?? this.queryInput,
    );
  }

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return PotentialAction(
      type: json["@type"],
      name: json["name"],
      target: json["target"],
      queryInput: json["query-input"] == null
          ? null
          : QueryInput.fromJson(json["query-input"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "@type": type,
        "name": name,
        "target": target,
        "query-input": queryInput?.toJson(),
      };

  @override
  String toString() {
    return "$type, $name, $target, $queryInput, ";
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

class TargetClass {
  TargetClass({
    required this.type,
    required this.urlTemplate,
  });

  final String? type;
  final String? urlTemplate;

  TargetClass copyWith({
    String? type,
    String? urlTemplate,
  }) {
    return TargetClass(
      type: type ?? this.type,
      urlTemplate: urlTemplate ?? this.urlTemplate,
    );
  }

  factory TargetClass.fromJson(Map<String, dynamic> json) {
    return TargetClass(
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

class TwitterMisc {
  TwitterMisc({
    required this.twitterMisc,
    required this.empty,
  });

  final String? twitterMisc;
  final String? empty;

  TwitterMisc copyWith({
    String? twitterMisc,
    String? empty,
  }) {
    return TwitterMisc(
      twitterMisc: twitterMisc ?? this.twitterMisc,
      empty: empty ?? this.empty,
    );
  }

  factory TwitterMisc.fromJson(Map<String, dynamic> json) {
    return TwitterMisc(
      twitterMisc: json["द्वारा लिखित"],
      empty: json["अनुमानित पढ़ने का समय"],
    );
  }

  Map<String, dynamic> toJson() => {
        "द्वारा लिखित": twitterMisc,
        "अनुमानित पढ़ने का समय": empty,
      };

  @override
  String toString() {
    return "$twitterMisc, $empty, ";
  }
}
