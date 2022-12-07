class Image {
    Image({
         this.albumId,
         this.id,
         this.title,
         this.url,
         this.thumbnailUrl,
    });

    int? albumId;
    int? id;
    String? title;
    String? url;
    String? thumbnailUrl;

    Image copyWith({
        int? albumId,
        int? id,
        String? title,
        String? url,
        String? thumbnailUrl,
    }) => 
        Image(
            albumId: albumId ?? this.albumId,
            id: id ?? this.id,
            title: title ?? this.title,
            url: url ?? this.url,
            thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        );

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
