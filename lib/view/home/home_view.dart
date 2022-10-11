import 'package:flutter/material.dart';
import 'package:marina_mobility/view/home/VesselsListVM.dart';
import 'package:provider/provider.dart';

import '../../data/remote/Status.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final VesselsListVM vesseleListVM = VesselsListVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<VesselsListVM>(
        create: (BuildContext context) => vesseleListVM,
        child: Consumer<VesselsListVM>(builder: (context, vesseleListVM, _) {
          switch (vesseleListVM.vesselList.status) {
            case Status.LOADING:
              return Container(); //LoadingWidget();
            case Status.ERROR:
              return Container(); //MyErrorWidget(vesseleListVM.vesselList.message ?? "NA");
            case Status.COMPLETED:
              return Container(); //_getVesselListView(vesseleListVM.vesselList.data?.vessels);
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
