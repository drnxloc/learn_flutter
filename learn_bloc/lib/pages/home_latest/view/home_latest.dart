import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/pages/home_latest/home_latest.dart';

class HomeLatestPage extends StatelessWidget {
  const HomeLatestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeLatestBloc(),
      child: const HomeLatestView(),
    );
  }
}

class HomeLatestView extends StatefulWidget {
  const HomeLatestView({super.key});

  @override
  State<HomeLatestView> createState() => _HomeLatestViewState();
}

class _HomeLatestViewState extends State<HomeLatestView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void handleClear() {
    usernameController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLatestBloc, HomeLatestState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Home Latest")),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 15,
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      label: Text("Username"),
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeLatestBloc>().add(
                            SubmitEvent(
                              username: usernameController.text,
                              password: passwordController.text,
                              onClear: handleClear,
                            ),
                          );
                    },
                    child: const Text("Login"),
                  ),
                  Text(state.message),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
