
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/widgets/text_display.dart';
import 'package:simple_cubit_app/cubits/text_cubit.dart';

void main() {
	group('TextDisplay Widget Tests', () {
		testWidgets('displays "Cat" with person icon initially', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => TextCubit(),
						child: TextDisplay(),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('displays "Dog" with access time icon when tapped', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => TextCubit(),
						child: TextDisplay(),
					),
				),
			);

			// Act
			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
	});
}
