import { combineReducers } from "redux";

import { hostsReducer } from "./hosts";
import { memoryHistoriesReducer } from "./memoryHistories";

const rootReducer = combineReducers({
  // Reducers
  hosts: hostsReducer,
  memoryHistories: memoryHistoriesReducer,
});
export default rootReducer;
