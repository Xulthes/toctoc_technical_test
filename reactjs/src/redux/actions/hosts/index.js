//Get All HOST
export const GET_HOSTS_REQUESTED = "GET_HOSTS_REQUESTED";
export const GET_HOSTS_SUCCESS = "GET_HOSTS_SUCCESS";
export const GET_HOSTS_FAILED = "GET_HOSTS_FAILED";

export const getHosts = () => ({
  type: GET_HOSTS_REQUESTED,
});
