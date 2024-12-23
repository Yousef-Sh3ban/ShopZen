import 'package:base/configurations/app_events.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/notifaction/ui/blocs/notifaction_bloc.dart';
import 'package:base/features/notifaction/ui/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotifactionScreen extends StatefulWidget {
  const NotifactionScreen({super.key});

  @override
  State<NotifactionScreen> createState() => _NotifactionScreenState();
}

class _NotifactionScreenState extends State<NotifactionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NotifactionBloc>().add(GetDataEvent(data: null));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            InkWell(
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        title: const Text(
          "Notifications",
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: NotificationWidget(notifactionList: state.data),
            );
          }
          return const Center(child: Text("No data to show"));
        },
      ),
    );
  }
}
