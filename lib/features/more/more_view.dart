import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'more_cubit.dart';
import 'more_state.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoreCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<MoreCubit>(context);

    return Container();
  }
}


