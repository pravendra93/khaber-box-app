import 'package:flutter/material.dart';
import 'package:khaber_box/data/models/tags_model.dart' as tags_model;
import 'package:khaber_box/provider/category_provider.dart';
import 'package:khaber_box/provider/posts_provider.dart';
import 'package:khaber_box/provider/tags_provider.dart';
import 'package:khaber_box/screens/home/breaking_news.dart';
import 'package:khaber_box/screens/home/top_bar.dart';
import 'package:khaber_box/screens/home/topic_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TagsProvider>(context, listen: false).fetchTags();
      Provider.of<PostsProvider>(context, listen: false).fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer2<CategoryProvider, TagsProvider>(
          builder: (context, categoryProvider, tagsProvider, _) {
            if (categoryProvider.isLoading || tagsProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (tagsProvider.error != null) {
              return Center(
                  child: Text("Error loading tags: ${tagsProvider.error}"));
            }
            if (tagsProvider.tags.isEmpty) {
              return const Center(child: Text("No tags found."));
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TopSection(
                    tags: tagsProvider.tags,
                    selectedIndex: tagsProvider.selectedIndex,
                    onTagSelected: (index) {
                      tagsProvider.selectTag(index);
                      // Optionally trigger posts filtering here
                    },
                  ),
                ),
                const PostsListSliver(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/icons/ad.png",
                              height: 120,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.note_alt_outlined,
                                  size: 22,
                                  color: Color(0xffbb0707),
                                ),
                                Text(
                                  "Big News",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "More",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffbb0707),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Color(0xffbb0707),
                                )
                              ],
                            )
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final List<tags_model.TagsModel> tags;
  final int selectedIndex;
  final ValueChanged<int> onTagSelected;

  const TopSection({
    super.key,
    required this.tags,
    required this.selectedIndex,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TopBar(),
        const SizedBox(height: 5),
        Image.asset("assets/logo/khaberbox-logo.png"),
        const SizedBox(height: 5),
        HorizontalTagSelector(
          tags: tags,
          selectedIndex: selectedIndex,
          onTagSelected: onTagSelected,
        ),
        const SizedBox(height: 15),
        const BreakingNews(),
        const SizedBox(height: 10),
        TagsTopicRow(tags: tags),
        const SizedBox(height: 10),
      ],
    );
  }
}

class HorizontalTagSelector extends StatelessWidget {
  final List<tags_model.TagsModel> tags;
  final int selectedIndex;
  final ValueChanged<int> onTagSelected;

  const HorizontalTagSelector({
    super.key,
    required this.tags,
    required this.selectedIndex,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: const Color(0xff173882),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        shrinkWrap: true,
        // physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final bool isSelected = index == selectedIndex;
          final tagName = tags[index].name ?? "Unnamed";

          return GestureDetector(
            onTap: () => onTagSelected(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xff102b6b)
                          : Colors.transparent,
                    ),
                    child: Text(
                      tagName,
                      style: TextStyle(
                        fontSize: 15,
                        color: isSelected
                            ? const Color.fromARGB(255, 159, 170, 195)
                            : Colors.white,
                        fontWeight:
                            isSelected ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.ease,
                    height: 3,
                    width: isSelected ? 70 : 0,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TagsTopicRow extends StatelessWidget {
  final List<tags_model.TagsModel> tags;

  const TagsTopicRow({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff7f9fa),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios_new),
            Expanded(
              child: ClipRect(
                child: SizedBox(
                  height: 30,
                  child: ListView.builder(
                    itemCount: tags.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => TopicCard(
                      text: tags[index].name ?? '',
                    ),
                  ),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class PostsListSliver extends StatelessWidget {
  const PostsListSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (context, postsProvider, _) {
        if (postsProvider.isLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (postsProvider.error != null) {
          return SliverFillRemaining(
            child: Center(
                child: Text("Error loading posts: ${postsProvider.error}")),
          );
        }
        if (postsProvider.posts.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text("No posts found.")),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = postsProvider.posts[index];
              final title = post.title?.rendered ?? 'No Title';
              final description = post.excerpt?.rendered ??
                  ''; // assuming description available here
              final imageUrl = (post.yoastHeadJson?.ogImage.isNotEmpty ?? false)
                  ? post.yoastHeadJson!.ogImage.first.url
                  : null;

              if (index == 0) {
                // Special big post display for the first post
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (imageUrl != null && imageUrl.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 100),
                          ),
                        ),
                      const SizedBox(height: 12),
                      // Description might contain HTML, strip tags or use Html widget if you have flutter_html package
                      Text(
                        // Strip HTML tags if necessary - here simplified
                        description.replaceAll(RegExp(r'<[^>]*>'), ''),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                    ],
                  ),
                );
              } else {
                // Normal smaller ListTile posts for the rest
                return ListTile(
                  leading: (imageUrl != null && imageUrl.isNotEmpty)
                      ? Image.network(
                          imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        )
                      : const SizedBox(width: 60, height: 60),
                  title: Text(title),
                );
              }
            },
            childCount: postsProvider.posts.length,
          ),
        );
      },
    );
  }
}
