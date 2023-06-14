import 'package:advance_flutter_exam/model/offer_model.dart';
import 'package:flutter/material.dart';

class Offerscreen extends StatefulWidget {
  const Offerscreen({super.key});

  @override
  State<Offerscreen> createState() => _OfferscreenState();
}

class _OfferscreenState extends State<Offerscreen> {
  @override
  Widget build(BuildContext context) {
    Offermodal offer = ModalRoute.of(context)!.settings.arguments as Offermodal;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text("${offer.data![index].storeName}"),
                    subtitle: Text("${offer.data![index].storeRating}"),
                  ),
                  Divider(height: 1,color: Colors.grey,thickness: 2),
                ],
              );
            },
            itemCount: offer.data!.length),
      ),
    );
  }
}
