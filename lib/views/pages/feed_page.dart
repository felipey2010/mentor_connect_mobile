import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/models.dart';
import 'package:mentor_hub_mobile/views/widgets/useravatar_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Post> posts = []; // Replace with your data source
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Create Post Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind?',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _createPost();
                  },
                ),
              ],
            ),
          ),
          // Posts List
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostItem(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _createPost() {
    final content = _postController.text.trim();
    if (content.isNotEmpty) {
      setState(() {
        posts.add(Post(
          id: DateTime.now().toString(),
          userId: 'current_user_id', // Replace with actual user ID
          content: content,
          status: PostStatus.public,
          createdAt: DateTime.now(),
          user: User(
            id: 'current_user_id',
            name: 'Felipey Mentor',
            username: 'felipey.',
            image: 'assets/images/user2.jpg',
          ),
          commentsCount: 0,
        ));
        _postController.clear();
      });
    }
  }
}

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  // ignore: library_private_types_in_public_api
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool _showComments = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Row(
              children: [
                UserAvatar(
                  imageUrl: widget.post.user.image,
                  name: widget.post.user.name,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.post.user.name),
                    Text('@${widget.post.user.username}'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            // Post Content
            Text(widget.post.content),
            SizedBox(height: 8),
            // Like and Comment Icons
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Handle like
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    setState(() {
                      _showComments = !_showComments;
                    });
                  },
                ),
              ],
            ),
            // Comments Section
            if (_showComments) ...[
              Divider(),
              Text('Comentários (${widget.post.commentsCount})'),
              SizedBox(height: 8.0),
              // Add Comment Input
              TextField(
                decoration: InputDecoration(
                  hintText: 'Escreva seu comentário...',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  // Handle comment submission
                },
              ),
              // Display Comments
              // Replace with actual comments list
              ListTile(
                leading: UserAvatar(
                  imageUrl: widget.post.user.image,
                  name: widget.post.user.name,
                ),
                title: Text(widget.post.user.name),
                subtitle: Text('Esse é um teste de comentário.'),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Editar'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Excluir'),
                    ),
                    PopupMenuItem(
                      value: 'report',
                      child: Text('Denunciar'),
                    ),
                  ],
                  onSelected: (value) {
                    // Handle comment actions
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
