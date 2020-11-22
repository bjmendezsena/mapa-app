part of 'helpers.dart';

Future<BitmapDescriptor> getMarkerInicioicon(int segundos) async {
  final recorder = new PictureRecorder();
  final canvas = new Canvas(recorder);
  final size = new Size(350, 150);

  final minutos = (segundos / 60).floor();

  final markerInicio = new MarkerInicioPainter(minutos);
  markerInicio.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());

  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
}

Future<BitmapDescriptor> getMarkerDestinoIcion(
    String descripcion, double metros) async {
  final recorder = new PictureRecorder();
  final canvas = new Canvas(recorder);
  final size = new Size(350, 150);

  final markerDestino = new MarkerDestinoPainter(descripcion, metros);
  markerDestino.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
}
