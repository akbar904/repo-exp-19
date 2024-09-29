
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import the file we are testing
import 'package:simple_cubit_app/screens/home_screen.dart';

// Mock the dependencies
class MockTextCubit extends MockCubit<String> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays "Cat" with person icon initially', (WidgetTester tester) async {
			// Arrange
			final mockTextCubit = MockTextCubit();
			when(() => mockTextCubit.state).thenReturn('Cat');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (context) => mockTextCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('displays "Dog" with access time icon when tapped', (WidgetTester tester) async {
			// Arrange
			final mockTextCubit = MockTextCubit();
			when(() => mockTextCubit.state).thenReturn('Dog');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<TextCubit>(
						create: (context) => mockTextCubit,
						child: HomeScreen(),
					),
				),
			);

			// Simulate tap
			await tester.tap(find.text('Cat'));
			await tester.pump();

			// Assert
			verify(() => mockTextCubit.toggleText()).called(1);
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
	});
}
