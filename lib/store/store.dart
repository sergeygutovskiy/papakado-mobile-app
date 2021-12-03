import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'reducers.dart';
import 'state.dart';

Store<StoreState> store() {
    return Store(
        storeReducers, 
        initialState: StoreState.initial(),
        middleware: [thunkMiddleware],
    );
}