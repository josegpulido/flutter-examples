// Required imports
import 'package:flutter/material.dart';
// Interfaces
import 'package:movies_app/models/actors_model.dart';
// Widgets
import 'package:movies_app/widgets/circular_loader_widget.dart';

class SliverCastSwiper extends StatelessWidget {

  // Variables
  final List<Actor> actors;

  // Constructor
  SliverCastSwiper({
    @required this.actors
  });

  // Widget builder
  @override
  Widget build(BuildContext context) {

    // PageView Widget
    final SliverFillRemaining pageviewWidget = SliverFillRemaining(
      /**
       * El Container es necesario para volver al PageView compatible con un
       * padre Sliver. Esto no funcionará si el Container no tiene definidas
       * sus dimensiones para cuando el PageView se esté renderizando. En caso
       * contrario, arrojará errores.
       */
      hasScrollBody: false,
      fillOverscroll: false,
      child: Container(
        height: 230.0,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 25.0
          ),
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (BuildContext context, int i) {
            return _createActorCard(actors[i]);
          }
        )
      )
    );

    // Progress widget
    final SliverToBoxAdapter progressWidget = SliverToBoxAdapter(
      child: Center(
        heightFactor: 2.0,
        child: CircularLoader()
      )
    );

    // Retornando Widget
    return actors.length > 0 ? pageviewWidget : progressWidget;
  }
  
  // Método para crear una card de un actor
  Widget _createActorCard(Actor actor) {
    return Container(
      width: 80.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(1.0, 5.0)
          )
        ]
      ),
      margin: EdgeInsets.only(
        right: 15.0
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8.0)
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-actor-photo.png'),
              image: NetworkImage(actor.getProfileImageUrl()),
              height: 120.0,
              fit: BoxFit.cover
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 5.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actor.name,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black87
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                ),
                SizedBox(
                  height: 5.0
                ),
                Text(
                  actor.character,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black45
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                )
              ]
            )
          )
        ]
      )
    );
  }
}