part of 'widgets.dart';

class BtnUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapaBloc = context.bloc<MapaBloc>();
    final ubicacionBloc = context.bloc<MiUbicacionBloc>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
              ]
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.my_location, color: Colors.black87),
          onPressed: () {
            final destino = ubicacionBloc.state.ubicacion;
            mapaBloc.moverCamara(destino);
          },
        ),
      ),
    );
  }
}
