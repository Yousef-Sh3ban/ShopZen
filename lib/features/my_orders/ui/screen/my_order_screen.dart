
import 'package:animate_do/animate_do.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/features/my_orders/domain/models/order_model.dart';
import 'package:base/features/my_orders/ui/blocs/orders_bloc.dart';
import 'package:base/features/my_orders/ui/widget/order_loading_widget.dart';
import 'package:base/features/my_orders/ui/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: FadeInDown(
          from: 50,
          child: Row(
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
        ),
        title: FadeInDown(
          from: 50,
          child: const Text(
            "My Orders",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<OrderCubit, AppStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            List<OrderModel> orders = state.data;
            return FadeIn(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: orders.length,
                itemBuilder: (context, int index) {
                  return OrderWidget(
                    order: orders[index],
                  );
                },
              ),
            );
          } else if (state is LoadingState) {
            return FadeIn(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    spacing: 16,
                    children: List.generate(
                      4,
                      (int index) {
                        return const OrderLoadingWidget().redacted(
                          configuration: RedactedConfiguration(
                            defaultBorderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          context: context,
                          redact: true,
                        );
                      },
                    )),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
