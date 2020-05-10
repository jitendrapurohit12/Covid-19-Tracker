import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatefulWidget {
  final AppBar appBar;
  final Widget body, botomBar;
  final String id;
  final FloatingActionButton floatingActionButton;
  final StreamController<String> errorController, successController;
  final Color color;

  const BasicScaffold({
    Key key,
    this.appBar,
    this.body,
    this.botomBar,
    this.errorController,
    this.floatingActionButton,
    this.id,
    this.successController,
    this.color,
  }) : super(key: key);
  @override
  _BasicScaffoldState createState() => _BasicScaffoldState();
}

class _BasicScaffoldState extends State<BasicScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final StreamController<ConnectivityResult> _connectionController =
      StreamController();
  @override
  void dispose() {
    _connectionController?.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((conn) {
      _connectionController.add(conn);
    });
    getCurrentConnectivity();
    widget.errorController?.stream?.listen((s) => showSnack(s));
    widget.successController?.stream
        ?.listen((s) => showSnack(s, isSuccess: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.appBar,
      backgroundColor:
          widget.color ?? Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          widget.body,
          Positioned(
            bottom: 0,
            child: StreamBuilder<ConnectivityResult>(
              stream: _connectionController.stream,
              builder: (context, snapshot) {
                return Visibility(
                  visible: snapshot.hasData &&
                      snapshot.data == ConnectivityResult.none,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      'No internet connection!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.botomBar,
    );
  }

  void showSnack(String message, {bool isSuccess = false}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(message),
      ),
    ));
  }

  Future<void> getCurrentConnectivity() async {
    await Future.delayed(const Duration());
    final connectivityResult = await Connectivity().checkConnectivity();
    _connectionController.add(connectivityResult);
  }
}
