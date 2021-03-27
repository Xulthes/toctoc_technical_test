import axios from "axios";

import { baseURL } from "../../utils/constants";

const defaultHeaders = {
  "Content-Type": "application/json",
  Accept: "application/json",
};

const apiCall = ({ url, method = "GET", data = {}, headers = {} }) => {
  return axios({
    baseURL,
    method,
    url,
    data,
    headers: {
      ...defaultHeaders,
    },
  });
};

export default apiCall;
