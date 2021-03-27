import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import HomeScreenContainer from "../screens/containers/HomeScreen";

const Router = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route path={"/"} component={HomeScreenContainer}></Route>
      </Switch>
    </BrowserRouter>
  );
};

export default Router;
