
export const loginReducer = (state = {}, action) => {
    if (new Date().getTime() > action.payload?.loginReducer?.expiryDate) {
        return {};
    }
    switch (action.type) {
        case "login":
            return action.payload;
        case "logout":
            return {};
        default:
            return state;
    }
}