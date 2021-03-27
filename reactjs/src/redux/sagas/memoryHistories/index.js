import { call, put, takeEvery } from "redux-saga/effects";
import {
  GET_MEMORY_HISTORIES_REQUESTED,
  GET_MEMORY_HISTORIES_SUCCESS,
  GET_MEMORY_HISTORIES_FAILED,
} from "../../actions/memoryHistories";
import apiCall from "../../api";

function* fetchMemoryHistories(action) {
  try {
    const memoryHistories = yield call(apiCall, {
      url: `/get/resource/memory/${action.payload}`,
    });
    yield put({
      type: GET_MEMORY_HISTORIES_SUCCESS,
      memoryHistories: memoryHistories.data,
    });
  } catch (e) {
    yield put({ type: GET_MEMORY_HISTORIES_FAILED, message: e.message });
  }
}

function* memoryHistorySaga() {
  yield takeEvery(GET_MEMORY_HISTORIES_REQUESTED, fetchMemoryHistories);
}

export default memoryHistorySaga;
