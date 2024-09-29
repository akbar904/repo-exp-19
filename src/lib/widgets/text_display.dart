
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/text_cubit.dart';

class TextDisplay extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<TextCubit, String>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () => context.read<TextCubit>().toggleText(),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state),
							SizedBox(width: 8),
							Icon(state == 'Cat' ? Icons.person : Icons.access_time),
						],
					),
				);
			},
		);
	}
}
