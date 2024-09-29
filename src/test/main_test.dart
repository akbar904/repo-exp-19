
// test/main_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

class MockTextCubit extends MockCubit<String> implements TextCubit {}

void main() {
	group('Main App', () {
		testWidgets('displays the initial text', (WidgetTester tester) async {
			final mockTextCubit = MockTextCubit();
			when(() => mockTextCubit.state).thenReturn('Cat');

			await tester.pumpWidget(
				BlocProvider<TextCubit>(
					create: (_) => mockTextCubit,
					child: MyApp(),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('toggles text on tap', (WidgetTester tester) async {
			final mockTextCubit = MockTextCubit();
			whenListen(
				mockTextCubit,
				Stream.fromIterable(['Cat', 'Dog']),
				initialState: 'Cat',
			);

			await tester.pumpWidget(
				BlocProvider<TextCubit>(
					create: (_) => mockTextCubit,
					child: MyApp(),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
	});
}
