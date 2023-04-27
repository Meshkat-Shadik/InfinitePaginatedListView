import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_v_2/application/providers.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 500,
        color: Colors.grey[300],

        //this is the efficient way to build a listview with riverpod
        //it will only build the items that are visible on the screen
        //and will rebuild them when they are scrolled off the screen

        child: ListView.builder(
          //no need to specify the number of items
          //it will build as many items as needed
          //efficient when the number of items is unknown

          itemBuilder: (context, index) {
            //10 items per page
            final page = index ~/ 10 + 1;
            final itemIndex = index % 10;

            final posts = ref.watch(postsProvider(page: page));

            return posts.when(
              data: (posts) {
                //if it reaches the end of the list
                if (itemIndex >= posts.length) {
                  return null;
                }
                final post = posts[itemIndex];

                //passing the post to the provider scope
                //because we want to use the post in the ListItem widget
                //instead of passing it as a parameter
                //in that way the listitem doesn't rebuild

                return ProviderScope(
                  overrides: [
                    postProvider.overrideWithValue(post),
                  ],
                  //see? no need to pass the post as a parameter
                  //and also it is constant
                  child: const ListItem(),
                );
              },
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () {
                //only show the loading indicator for the first item
                //because other than first item, all other case will be null
                if (itemIndex != 0) return null;
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final post = ref.watch(postProvider);
      return ListTile(
        title: Text(post.title!),
        subtitle: Text(post.body!),
      );
    });
  }
}
