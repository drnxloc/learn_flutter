import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/hooks/use_auto_hide_scroll.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'models/category.dart';

part 'main.g.dart';

void main() {
  runApp(
    const ProviderScope(
      child: HomePage(),
    ),
  );
}

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  @override
  set state(int newState) => super.state = newState;
  int update(int Function(int state) cb) => state = cb(state);
}

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: 'https://api.truyengo.com', headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  }));
}

@riverpod
class Categories extends _$Categories {
  @override
  Future<List<Category>> build() async {
    final cancelToken = CancelToken();
    ref.onDispose(() {
      cancelToken.cancel();
    });

    final dio = ref.watch(dioProvider);
    final result = await dio.get('/categories', cancelToken: cancelToken);
    final categories = (result.data["data"] as List<dynamic>)
        .map((c) => Category.fromJson(c))
        .toList();
    // ref.keepAlive();
    return categories;
  }

  void add() async {
    final previousState = await future;
    final dio = ref.read(dioProvider);
    try {
      state = const AsyncLoading();
      await dio.post('/categories', data: {'name': 'hehe'});
      state = AsyncData([
        ...previousState,
        const Category(id: 81, name: 'Hehe', description: 'abc')
      ]);
    } on Exception catch (ex, stackTrace) {
      state = AsyncError(ex, stackTrace);
    }
  }
}

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final (scrollController, hideFabController) = useAutoHideScroll();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              height: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ));
                    },
                    child: const Text('MyApp'),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FadeTransition(
            opacity: hideFabController,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final textController = TextEditingController(text: 'Solution 1');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hookTextController = useTextEditingController(text: 'Solution 2');
    final counter = ref.watch(counterProvider);
    // ref.listen(categoriesProvider, (previous, next) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Fetched API successfully'),
    //     ),
    //   );
    // });

    Future<void> refresh() async {
      ref.invalidate(categoriesProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar $counter'),
        actions: [
          IconButton(
            onPressed: refresh,
            icon: const Icon(Icons.replay),
          ),
          IconButton(
            onPressed: () => ref.read(counterProvider.notifier).state++,
            icon: const Icon(Icons.plus_one),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Hehe'),
            ),
            TextField(
              controller: hookTextController,
              decoration: const InputDecoration(labelText: 'Hehe'),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => refresh(),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final categories = ref.watch(categoriesProvider);
                    // return Container(
                    //   constraints: BoxConstraints(
                    //     minHeight: MediaQuery.of(context).size.height,
                    //   ),
                    //   child: categories.when(
                    //     data: (data) {
                    //       return Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: data.map((e) => Text(e.name)).toList(),
                    //       );
                    //     },
                    //     error: (error, stackTrace) => const Text('error'),
                    //     loading: () =>
                    //         const Center(child: CircularProgressIndicator()),
                    //   ),
                    // );

                    return Container(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: switch (categories) {
                          AsyncData(:final value) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: value.map((e) => Text(e.name)).toList(),
                            ),
                          AsyncError(:final error) =>
                            Center(child: Text('Error: $error')),
                          _ => const Center(child: CircularProgressIndicator()),
                        }
                        // categories.when(
                        //   data: (data) {
                        //     return Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: data.map((e) => Text(e.name)).toList(),
                        //     );
                        //   },
                        //   error: (error, stackTrace) => const Text('error'),
                        //   loading: () =>
                        //   const Center(child: CircularProgressIndicator()),
                        // ),
                        );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(categoriesProvider.notifier).add();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
