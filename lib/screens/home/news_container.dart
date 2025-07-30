import 'package:flutter/material.dart';
import 'package:khaber_box/provider/posts_provider.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (context, postsProvider, _) {
        if (postsProvider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (postsProvider.error != null) {
          return Center(
              child: Text("Error loading posts: ${postsProvider.error}"));
        }
        if (postsProvider.posts.isEmpty) {
          return Center(child: Text("No posts found."));
        }
    
        return ListView.builder(
          itemCount: postsProvider.posts.length,
          physics: NeverScrollableScrollPhysics(), // Add this
    
          itemBuilder: (context, index) {
            final post = postsProvider.posts[index];
            final title = post.title?.rendered ?? 'No Title';
            final imageUrl = (post.yoastHeadJson?.ogImage.isNotEmpty ?? false)
                ? post.yoastHeadJson!.ogImage.first.url
                : null;
    
            return ListTile(
              leading: (imageUrl != null && imageUrl.isNotEmpty)
                  ? Image.network(
                      imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image),
                    )
                  : SizedBox(width: 60, height: 60),
              title: Text(title),
            );
          },
        );
      },
    );
  }
}
