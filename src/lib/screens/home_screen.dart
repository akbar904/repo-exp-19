
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/text_cubit.dart';
import 'package:simple_cubit_app/widgets/text_display.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Simple Cubit App'),
			),
			body: Center(
				child: GestureDetector(
					onTap: () {
						context.read<TextCubit>().toggleText();
					},
					child: BlocBuilder<TextCubit, String>(
						builder: (context, state) {
							return TextDisplay(text: state);
						},
					),
				),
			),
		);
	}
}
