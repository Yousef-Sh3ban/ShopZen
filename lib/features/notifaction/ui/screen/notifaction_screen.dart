import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/home_screen/ui/widget/deal_card.dart';
import 'package:base/features/notifaction/domain/models/notifaction_model.dart';
import 'package:base/features/notifaction/ui/blocs/notifaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotifactionScreen extends StatefulWidget {
  
  const NotifactionScreen({super.key});

  @override
  State<NotifactionScreen> createState() => _NotifactionScreenState();
}

class _NotifactionScreenState extends State<NotifactionScreen> {
    void initState() {
    super.initState();
    // Call your event inside initState
    Future.microtask(() {
      context.read<NotifactionBloc>().add(GetDataEvent(data: null));
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text(
          "Notifactions",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NotifactionBloc, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(
                child: SvgPicture.asset("assets/images/no_notifaction.svg"));
          } else if (state is LoadedState) {
            NotifactionModel m=state.data[0] ;
            return Column(
              children: [
                Text(m.title),
                Text(m.message)
              ],
            );
          }
          return const Center(child: Text("No data to show"));
        },
      ),
    );
  }
}
