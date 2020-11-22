part of 'helpers.dart';

void calculandoAlerta(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Espere por favor...'),
        content: LinearProgressIndicator(),
      ),
    );
  } else {
    showCupertinoDialog(
      context: context, 
      builder: (context) => CupertinoAlertDialog(
        title: Text('Espere por favor...'),
        content: CupertinoActivityIndicator(),
      ), 
    );
  }
}
