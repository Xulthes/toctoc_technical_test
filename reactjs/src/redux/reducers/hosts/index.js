import {
  GET_HOSTS_REQUESTED,
  GET_HOSTS_SUCCESS,
  GET_HOSTS_FAILED,
} from "../../actions/hosts";

const initialState = {
  hosts: [],
  loadingHosts: false,
  errorHosts: null,
};

export const hostsReducer = (state = initialState, action) => {
  switch (action.type) {
    case GET_HOSTS_REQUESTED:
      return {
        ...state,
        loadingHosts: true,
        errorHosts: null,
      };
    case GET_HOSTS_SUCCESS:
      return {
        ...state,
        loadingHosts: false,
        hosts: action.hosts,
      };
    case GET_HOSTS_FAILED:
      return {
        ...state,
        loadingHosts: false,
        errorHosts: action.message,
      };
    default:
      return state;
  }
};
