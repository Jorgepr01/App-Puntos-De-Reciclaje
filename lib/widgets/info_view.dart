import 'package:flutter/material.dart';
import 'package:puntos_reciclaje/data/direccion.dart';
import 'package:puntos_reciclaje/styles.dart';

class InfoView extends StatefulWidget {
  const InfoView(this.veggie, {super.key});
  final Veggie veggie;

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                //todo: categoria de lo que quieras esta en data lugar
                widget.veggie.categoryName!.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              // todo: este es para poner iconos
              // for (Season season in widget.veggie.seasons) ...[
              //   const SizedBox(width: 12),
              //   Padding(
              //     padding: Styles.seasonIconPadding[season]!,
              //     child: Icon(
              //       Styles.seasonIconData[season],
              //       semanticLabel: seasonNames[season],
              //       color: Styles.seasonColors[season],
              //     ),
              //   ),
              // ],
            ],
          ),
          const SizedBox(height: 8),

          // todo: este es el nombre del lugar
          Text(
            widget.veggie.name,
            style: Styles.headlineText(themeData),
          ),
          const SizedBox(height: 8),

          // todo: este es la descripcion del lugar
          // Text(
          //   widget.veggie.shortDescription,
          //   style: Theme.of(context).textTheme.bodyLarge,
          // ),


          //todo este es el contenido de la informacion
          ServingInfoChart(widget.veggie),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch.adaptive(
                value: widget.veggie.isFavorite,
                onChanged: (value) {
                  setState(() {
                    widget.veggie.isFavorite = value;
                  });
                },
              ),
              const SizedBox(width: 8),
              Text(
                'Guardar a favoritos',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServingInfoChart extends StatelessWidget {
  const ServingInfoChart(this.veggie, {super.key});

  final Veggie veggie;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 9,
              bottom: 4,
            ),
            child: Text(
              'Informacion:',
              style: themeData.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.servingInfoBorderColor),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Ubicacion:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          veggie.servingSize,
                          textAlign: TextAlign.end,
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Referencia:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${veggie.caloriesPerServing}',
                          style: themeData.textTheme.bodyLarge,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Latitud:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(veggie.vitaminAPercentage.toString()),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Longitud:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(veggie.vitaminCPercentage.toString()),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Generalmente los puntos ecológicos se ubican en sitios públicos',
                  style: themeData.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
