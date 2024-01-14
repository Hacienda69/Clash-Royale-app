import 'package:WatchApp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showFiltersMenu(BuildContext context) {
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      const Offset(0, 0),
      overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
    ),
    Offset.zero & overlay.size,
  );

  String onlyMoviesLabel;
  String genderQuery = '';
  var searchMediaModel = Provider.of<SearchMediaModel>(context, listen: false);
  if (searchMediaModel.onlyMovies) {
    onlyMoviesLabel = "Series";
  } else {
    onlyMoviesLabel = "Movies";
  }

  showMenu(
    color: const Color.fromARGB(255, 17, 17, 17),
    context: context,
    position: position,
    items: [
      PopupMenuItem(
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  searchMediaModel.setOnlyMovies(!searchMediaModel.onlyMovies);
                },
                child: Text(onlyMoviesLabel),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  genderQuery = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Genre',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  searchMediaModel.setGenreQuery(genderQuery);
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}