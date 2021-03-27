import { call, put, takeEvery } from "redux-saga/effects";
import {
  GET_HOSTS_REQUESTED,
  GET_HOSTS_SUCCESS,
  GET_HOSTS_FAILED,
} from "../../actions/hosts";
import apiCall from "../../api";

function* fetchHosts() {
  try {
    const hosts = yield call(apiCall, { url: "/get/resource/host" });
    yield put({ type: GET_HOSTS_SUCCESS, hosts: hosts.data });
  } catch (e) {
    yield put({ type: GET_HOSTS_FAILED, message: e.message });
  }
}

function* hostSaga() {
  yield takeEvery(GET_HOSTS_REQUESTED, fetchHosts);
}

export default hostSaga;
