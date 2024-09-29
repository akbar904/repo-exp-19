
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_cubit_app/cubits/text_cubit.dart';

// Mock class for TextCubit
class MockTextCubit extends MockCubit<TextState> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});

		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextState with text "Cat"', () {
			expect(textCubit.state.text, 'Cat');
		});

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Dog")] when toggleText is called and initial state is "Cat"',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextState(text: 'Dog')],
		);

		blocTest<TextCubit, TextState>(
			'emits [TextState(text: "Cat")] when toggleText is called and initial state is "Dog"',
			build: () => textCubit,
			seed: () => TextState(text: 'Dog'),
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextState(text: 'Cat')],
		);
	});
}
