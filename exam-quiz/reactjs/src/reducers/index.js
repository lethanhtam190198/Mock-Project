import { combineReducers } from "redux";
import { loginReducer } from "./loginReducers"
export const allReduces = combineReducers({
    loginReducer,
})