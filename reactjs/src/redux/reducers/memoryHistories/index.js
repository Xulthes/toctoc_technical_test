import {
  GET_MEMORY_HISTORIES_REQUESTED,
  GET_MEMORY_HISTORIES_SUCCESS,
  GET_MEMORY_HISTORIES_FAILED,
} from "../../actions/memoryHistories";

const initialState = {
  memoryHistories: [],
  loadingMemoryHistories: false,
  error: null,
};

export const memoryHistoriesReducer = (state = initialState, action) => {
  switch (action.type) {
    case GET_MEMORY_HISTORIES_REQUESTED:
      return {
        ...state,
        loadingMemoryHistories: true,
      };
    case GET_MEMORY_HISTORIES_SUCCESS:
      return {
        ...state,
        loadingMemoryHistories: false,
        memoryHistories: action.memoryHistories,
      };
    case GET_MEMORY_HISTORIES_FAILED:
      return {
        ...state,
        loadingMemoryHistories: false,
        errorMemoryHistories: action.message,
      };
    default:
      return state;
  }
};
