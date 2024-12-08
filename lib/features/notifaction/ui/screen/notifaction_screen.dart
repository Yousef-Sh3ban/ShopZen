import 'package:base/configurations/app_states.dart';
import 'package:base/features/notifaction/ui/blocs/notifaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotifactionScreen extends StatelessWidget {
  const NotifactionScreen({super.key});

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
            return const Column(
              children: [],
            );
          }
          return const Center(child: Text("No data to show"));
        },
      ),
    );
  }
}
