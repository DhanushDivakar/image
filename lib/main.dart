import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/bloc/image_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageBlocBloc()..add(GetImages()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0 &&
          !context.read<ImageBlocBloc>().state.isLoading) {
        BlocProvider.of<ImageBlocBloc>(context).add(GetImages());
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("RoyalMart"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
      ),
      body: BlocBuilder<ImageBlocBloc, ImageBlocState>(
        builder: (context, state) {
          if (state.isLoading && state.images.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.images.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.images.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          trailing: Text('${index + 1}'),
                          title: Text('${state.images[index].title}'));
                    },
                  ),
                ),
                if (state.isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 6.0,
                      ),
                    ),
                  )
              ],
            );
          }
          return const Center(child: Text("hggvyhghghbhg"));
        },
      ),
    );
  }
}
