import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:isar/isar.dart';
import 'package:movies/Movie%20Module/domain/entities/movie.dart';
import 'package:movies/core/providers/main_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<void> initialize;
  late Future<bool> checkConnection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection = () async {
      bool value = true;

      if ((await Connectivity().checkConnectivity()) !=
          ConnectivityResult.none) {
        try {
          final result = await InternetAddress.lookup('example.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            value = true;
          }
        } on SocketException catch (_) {
          value = false;
        }
      } else {
        value = false;
      }
      if (!value) {
        final movies = (await Isar.open(
          schemas: [MovieSchema],
          directory: (await getApplicationDocumentsDirectory()).path,
          name: 'topRated',
        ));
        if ((await movies.movies.where().findAll()).isEmpty) {
          value = false;
        } else {
          value = true;
        }
        await movies.close();
      }

      return value;
    }.call();
    initialize = Provider.of<MainProvider>(context, listen: false).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialize,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 10,
              ),
            ),
          );
        } else {
          return FutureBuilder(
            future: checkConnection,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 10,
                  ),
                );
              } else {
                if (snapshot.data!) {
                  SchedulerBinding.instance.addPostFrameCallback(
                    (_) {
                      Navigator.pushReplacementNamed(context, MainScreen.id);
                    },
                  );
                  return Container();
                } else {
                  return const Scaffold(
                    backgroundColor: Color(0xff1E1E29),
                    body: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              'There is an error with your connection...',
                              style: TextStyle(
                                fontSize: 80,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
            },
          );
        }
      },
    );
  }
}
