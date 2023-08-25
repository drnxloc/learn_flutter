import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/app/apps.dart';
import 'package:learn_flutter/pages/home/cubit/home_cubit.dart';
import 'package:learn_flutter/repositories/repositories.dart';
import 'package:learn_flutter/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storyRepository = StoryRepository(dio: AppDio().dio);
    return BlocProvider(
      create: (_) => HomeCubit(storyRepository: storyRepository)..getStories(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: AppStyles.h4.copyWith(
              color: Colors.red,
            ),
          ),
        ),
        body: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.stories.length,
          itemBuilder: (context, index) {
            return StoryOverview(story: state.stories[index]);
          },
        );
      },
    );
  }
}
