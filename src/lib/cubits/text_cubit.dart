
import 'package:bloc/bloc.dart';

class TextState {
	final String text;
	const TextState({required this.text});
}

class TextCubit extends Cubit<TextState> {
	TextCubit() : super(const TextState(text: 'Cat'));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(const TextState(text: 'Dog'));
		} else {
			emit(const TextState(text: 'Cat'));
		}
	}
}
