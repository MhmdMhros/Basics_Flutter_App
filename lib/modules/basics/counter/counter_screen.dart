import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          if(state is CounterPlusState)
          {
            //print('Plus State ${state.counter}');
          }
          if(state is CounterMinusState)
          {
            //print('Minus State ${state.counter}');
          }
        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.limeAccent,
              title: Text(
                'Counter',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).Minus();
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).Plus();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}