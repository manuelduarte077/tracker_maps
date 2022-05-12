import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps/blocs/search/search_bloc.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
            ? const _ManualMarker()
            : const SizedBox();
      },
    );
  }
}

class _ManualMarker extends StatelessWidget {
  const _ManualMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          // Back
          const Positioned(
            top: 70,
            left: 20,
            child: _BtnBack(),
          ),
          // Marker
          Center(
            child: Transform.translate(
              offset: const Offset(0, -21),
              child: BounceInDown(
                from: 100,
                child: const Icon(
                  Icons.location_on,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Btn Confirm
          Positioned(
            bottom: 30,
            left: 40,
            child: MaterialButton(
              minWidth: size.width - 120,
              onPressed: () {},
              child: const Text(
                'Confirm',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Colors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BtnBack extends StatelessWidget {
  const _BtnBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            BlocProvider.of<SearchBloc>(context)
                .add(SearchEventDisplaySearchBar());
          },
        ),
      ),
    );
  }
}
