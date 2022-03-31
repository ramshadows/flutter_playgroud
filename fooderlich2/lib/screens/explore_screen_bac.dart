import 'package:flutter/material.dart';
import 'package:fooderlich2/api/mock_fooderlich_service.dart';
import 'package:fooderlich2/components/components.dart';
import 'package:fooderlich2/models/models.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();

  String message = "";

  // ScrollController _scrollController;
  ScrollController? _controller;

  // scrollListener() , which is the function callback that will listen to 
  //the scroll offsets
  _scrollListener() {
    // Check the scroll offset to see if the position is greater than or equal 
    //to the maxScrollExtent . If so, the user has scrolled to the very bottom.
    if (_controller!.offset >= _controller!.position.maxScrollExtent &&
        !_controller!.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
      });
    }

    // Check if the scroll offset is less than or equal to minScrollExtent . 
    //If so, the user has scrolled to the very top
    if (_controller!.offset <= _controller!.position.minScrollExtent &&
        !_controller!.position.outOfRange) {
      setState(() {
        message = "reach the top";
      });
    }
  }

  // We instantiate it within our initState method, in the following way
  @override
  void initState() {
    // initialize the scroll controller
    _controller = ScrollController();
    // You add a listener to the controller. Every time the user scrolls,
    // scrollListener() will get called
    _controller!.addListener(_scrollListener);
    super.initState();
  }

  /*
  The framework calls dispose() when you permanently remove the object and its
  state from the tree. It’s important to remember to handle any memory cleanup, such
  as unsubscribing from streams and disposing of animations or controllers. In this
  case, you’re removing the scroll listener.
  
   */
  @override
  void dispose() {
    _controller!.removeListener(_scrollListener);
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Within the widget’s build() , you create a FutureBuilder
    return FutureBuilder(
      /*
      The FutureBuilder takes in a Future as a parameter. getExploreData()
      creates a future that will, in turn, return an ExploreData instance. 
      That instance will contain two lists, todayRecipes and friendPosts
      */
      future: mockService.getExploreData(),
      // Within builder , you use snapshot to check the current state of
      //the Future .
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // snapshot.data returns ExploreData , from which you extract
          //todayRecipes to pass to the list view.
          //final recipes = snapshot.data?.todayRecipes ?? [];
          // primary ListView will hold the other two ListView s as children -
          // Nested ListView
          return ListView(
            scrollDirection: Axis.vertical,
            controller: _controller,
            children: <Widget>[
              TodayRecipeListView(
                recipes: snapshot.data?.todayRecipes ?? [],
              ),
              const SizedBox(
                height: 16,
              ),
              // Here, you create a FriendPostListView and extract
              //friendPosts from ExploreData
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? [],
              ),
            ],
          );

          //return TodayRecipeListView(recipes: recipes);
        } else {
          // The future is still loading, so you show a spinner to let the user
          //know something is happening.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
