import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lfg_mobile/modules/core/external_services/google_maps_service.dart';

class ILocationSelector {
  final String description;
  final String placeId;

  const ILocationSelector({
    required this.description,
    required this.placeId,
  });
}

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  LocationSelectorState createState() => LocationSelectorState();
}

class LocationSelectorState extends State<LocationSelector> {
  final _controller = TextEditingController();
  final String _sessionToken = '1234567890';
  List<IPlacesApiSuggestions> _placeList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    try {
      // should generate an uuid for seassion
      List<IPlacesApiSuggestions>? data =
          await getPlacesApiSuggestions(input, "asedansdqw-eqwsaas-qweq");
      if (data != null) {
        setState(() {
          _placeList = data;
        });
      }
    } catch (e) {
      setState(() {
        _placeList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [],
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Select Location',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search your location here",
                focusColor: Colors.white,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(Icons.map),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, i) => const Divider(),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _placeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    context.pop(ILocationSelector(
                     description: _placeList.elementAt(index).description,
                     placeId: _placeList.elementAt(index).placeId
                    ));
                  },
                  child: ListTile(
                    title: Text(_placeList.elementAt(index).description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
