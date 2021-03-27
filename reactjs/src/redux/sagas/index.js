import { all } from "redux-saga/effects";
import hostSaga from "./hosts";
import memoryHistorySaga from "./memoryHistories";

export default function* rootSaga() {
  yield all([hostSaga(), memoryHistorySaga()]);
}
