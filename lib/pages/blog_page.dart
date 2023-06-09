import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

int count =0;
Color defaultColor = Colors.deepPurpleAccent;
var colors = [
  Colors.red,
  Colors.blue,
  Colors.purple,
  Colors.yellow,
  Colors.green

  ];

 @override
 void initState() {
   super.initState();

   var rnd = Random().nextInt(colors.length);
   setState(() {
      defaultColor = colors[rnd];
    });
 }
  
  Future<List<dynamic>> fetchBlogPosts() async {
  final url = Uri.parse('https://api.hashnode.com/');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'query': '''
        query {
          user(username: "helpichirag") {
            publication {
              posts {
                title
                brief
                slug
              }
            }
          }
        }
      ''',
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final posts = data['data']['user']['publication']['posts'];
    return posts;
  } else {
    throw Exception('Failed to fetch blog posts');
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:FutureBuilder<List<dynamic>>(
  future: fetchBlogPosts(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator(
        strokeWidth: 3,
      ));
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      final posts = snapshot.data;
      return ListView.builder(
        itemCount: posts!.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.all(38.0),
            child: Container(
              decoration: BoxDecoration(
                color: defaultColor,
                border: Border.all(width: 1, color: Colors.grey.shade900),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: ListTile(
                selectedColor: Colors.deepPurpleAccent,
                textColor: Colors.black,
                title: Text(post['title']),
                subtitle: Text(post['brief']),
                trailing: Text("@helpichirag"),
                onTap: () {
                  // Handle tap on blog post
                },
              ),
            ),
          );
        },
      );
    }
  },
)

    );
  }
}