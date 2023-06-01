import { createStore } from "redux";
import {
    persistStore,
    persistReducer,
} from 'redux-persist'
import storage from 'redux-persist/lib/storage'
import autoMergeLevel2 from 'redux-persist/lib/stateReconciler/autoMergeLevel2';
import { allReduces } from '../reducers/index'

const persistConfig = {
    key: 'AUTHENTICATION',
    version: 1,
    storage,
    stateReconciler: autoMergeLevel2
}

const pReducer = persistReducer(persistConfig, allReduces);

export const store = createStore(pReducer);
export const persistor = persistStore(store);
