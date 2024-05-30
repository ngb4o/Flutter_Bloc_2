import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_2/features/counter/bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    counterBloc.add(CounterIncrementEvent());
    super.initState();
  }

  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Counter App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: (previous, current) => current is CounterActionState,
        buildWhen: (previous, current) => current is! CounterActionState,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Show Snackbar')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CounterIncrementState:
              final successState = state as CounterIncrementState;
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        successState.val.toString(),
                        style: TextStyle(fontSize: 70),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal),
                          onPressed: () {
                            counterBloc.add(CounterShowSnackbarEvent());
                          },
                          child: Text(
                            'Snackbar',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              );
            default:
              return Center(
                child: Text('Not found'),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(CounterIncrementEvent());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
