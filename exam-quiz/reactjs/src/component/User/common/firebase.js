// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getStorage } from "firebase/storage"
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyB7m-5mxaiYaKTK_kX0l904TSD05EXrcYY",
    authDomain: "storageimage-633d3.firebaseapp.com",
    projectId: "storageimage-633d3",
    storageBucket: "storageimage-633d3.appspot.com",
    messagingSenderId: "236877021651",
    appId: "1:236877021651:web:a66e052ab1e1d276ddaf26",
    measurementId: "G-SETNLQZ500"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const storage = getStorage(app)