part of 'custom_markers.dart';

class MarkerDestinoPainter extends CustomPainter {
  final String descripcion;
  final double metros;

  MarkerDestinoPainter(this.descripcion, this.metros);

  @override
  void paint(Canvas canvas, Size size) {
    final double circuloNegroR = 20;
    final double circuloBlancoR = 7;

    Paint paint = new Paint()..color = Colors.black;

    // Dibujar circulo negro
    canvas.drawCircle(Offset(circuloNegroR, size.height - circuloNegroR),
        circuloNegroR, paint);

    // Cirsulo blanco
    paint.color = Colors.white;

    canvas.drawCircle(Offset(circuloNegroR, size.height - circuloNegroR),
        circuloBlancoR, paint);

    final Path path = new Path();

    path.moveTo(0, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(0, 100);

    canvas.drawShadow(path, Colors.black87, 10, false);

    // Caja blanca
    final cajaBlanca = Rect.fromLTWH(0, 20, size.width - 10, 80);
    canvas.drawRect(cajaBlanca, paint);

    // Caja negra
    paint.color = Colors.black;
    final cajaNegra = Rect.fromLTWH(0, 20, 70, 80);
    canvas.drawRect(cajaNegra, paint);

    // Dibjar textos
    double kilometros = this.metros / 1000;
    kilometros = (kilometros * 100).floor().toDouble();
    kilometros = kilometros / 100;
    TextSpan textSpan = new TextSpan(
        text: '$kilometros',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400));

    TextPainter textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(maxWidth: 70, minWidth: 70);

    textPainter.paint(canvas, Offset(0, 35));

    // Minutos
    textSpan = new TextSpan(
        text: 'km',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400));

    textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(maxWidth: 70);

    textPainter.paint(canvas, Offset(20, 67));

    // Mi ubicación
    textSpan = new TextSpan(
        text: this.descripcion,
        style: TextStyle(
            color: Colors.black, fontSize: 27, fontWeight: FontWeight.w400));

    textPainter = new TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        maxLines: 2,
        ellipsis: '...')
      ..layout(
        maxWidth: size.width - 100,
      );

    textPainter.paint(canvas, Offset(90, 35));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
