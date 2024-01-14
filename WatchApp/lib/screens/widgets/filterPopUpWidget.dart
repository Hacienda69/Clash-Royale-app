import 'package:WatchApp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void showFiltersMenu(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      const Offset(0, 0),
      overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
    ),
    Offset.zero & overlay.size,
  );

  var searchMediaModel = Provider.of<SearchMediaModel>(context, listen: false);
  String buttonText;
  String genderQuery = '';
  String ratingQuery = '';
  int yearQuery = 0;
  int rankQuery = 0;

  if (searchMediaModel.onlyMovies) {
    buttonText = "Series";
  } else {
    buttonText = "Movies";
  }

  showMenu(
    color: const Color.fromARGB(255, 17, 17, 17),
    context: context,
    position: position,
    items: [
      PopupMenuItem(
        child: SizedBox(
          width: 200,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  searchMediaModel.setOnlyMovies(!searchMediaModel.onlyMovies);
                  Navigator.pop(context);
                },
                child: Text(buttonText),
              ),
              TextField(
                onChanged: (value) {
                  genderQuery = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Filter Genre',
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
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  int? parsedValue = int.tryParse(value);
                  if (parsedValue != null) {
                    yearQuery = parsedValue;
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Filter Year',
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
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  int? parsedValue = int.tryParse(value);
                  if (parsedValue != null) {
                    rankQuery = parsedValue;
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Filter Rank',
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
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  ratingQuery = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Filter Rating',
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
              ElevatedButton(
                onPressed: () {
                  searchMediaModel.setGenreQuery(genderQuery);
                  searchMediaModel.setYearQuery(yearQuery);
                  searchMediaModel.setRankQuery(rankQuery);
                  searchMediaModel.setRatingQuery(ratingQuery);
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
              ElevatedButton(
                onPressed: () {
                  searchMediaModel.setGenreQuery("");
                  searchMediaModel.setYearQuery(0);
                  searchMediaModel.setRankQuery(0);
                  searchMediaModel.setRatingQuery("");
                  Navigator.pop(context);
                },
                child: const Text('Reset Filters'),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
