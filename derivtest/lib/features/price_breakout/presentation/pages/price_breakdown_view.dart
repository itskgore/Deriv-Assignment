import 'dart:convert';

import 'package:derivtest/data_models/tickModel.dart';
import 'package:derivtest/features/price_breakout/presentation/cubit/price_breakout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceBreakdownView extends StatefulWidget {
  const PriceBreakdownView({Key? key}) : super(key: key);

  @override
  _PriceBreakdownViewState createState() => _PriceBreakdownViewState();
}

class _PriceBreakdownViewState extends State<PriceBreakdownView> {
  checkIfForget(dynamic data) {
    final result = jsonDecode(data) as Map<String, dynamic>;
    if (result.containsKey("forget")) {
      return true;
    } else {
      return false;
    }
  }

  checkIfError(dynamic data) {
    final result = jsonDecode(data) as Map<String, dynamic>;
    if (result.containsKey("error")) {
      return true;
    } else {
      return false;
    }
  }

  setTickId(String id) {
    context.read<PriceBreakoutCubit>().tickId = id;
  }

  getTicks(String tick) {
    context.read<PriceBreakoutCubit>().tickId = "";
    context.read<PriceBreakoutCubit>().getTicks(ticks: tick);
  }

  // intializePrevTick(TickModel model) {
  //   context.read<PriceBreakoutCubit>().setPrevData(model);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceBreakoutCubit, PriceBreakoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is PriceBreakoutLoading) {
          return CircularProgressIndicator();
        } else if (state is PriceBreakoutInitial) {
          return Text("Please select the asset");
        } else if (state is PriceBreakoutLoaded) {
          return StreamBuilder(
              stream: state.data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (checkIfForget(snapshot.data)) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!checkIfError(snapshot.data)) {
                      if (snapshot.data != null) {
                        TickModel ticks = state.setData(snapshot.data ?? {});
                        setTickId(ticks.id ?? "");
                        state.setPrevData(ticks);
                        return Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: state.tickModels.length >= 2
                                  ? state.tickModels[0].quote! == ticks.quote!
                                      ? Colors.grey
                                      : state.tickModels[0].quote! <
                                              ticks.quote!
                                          ? Colors.green
                                          : Colors.red
                                  : Colors.grey),
                          child: Text(
                            "${state.setData(snapshot.data ?? {}).quote}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    } else {
                      return Text(jsonDecode(snapshot.data.toString())['error']
                          ['message']);
                    }
                  }
                } else if (snapshot.hasError) {
                  return Container();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
        } else if (state is PriceBreakoutError) {
          return Text(state.errorMsg);
        } else if (state is PriceBreakoutForget) {
          return StreamBuilder<dynamic>(
              stream: state.data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (checkIfForget(snapshot.data)) {
                    if (!checkIfError(snapshot.data)) {
                      getTicks(state.ticks);
                    }
                  }
                }
                return CircularProgressIndicator();
              });
        } else {
          return SizedBox();
        }
      },
    );
  }
}
