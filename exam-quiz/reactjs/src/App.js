import { BrowserRouter, Route, Routes, Navigate } from 'react-router-dom';
import ExamTest from '././component/exam/ExamTest';
import Header from '././component/layout/Header';
import Result from '././component/exam/Result';
import SchoolSubject from '././component/layout/SchoolSubject';
import CreateQuestion from '././component/Admin/CreateQuestion';
import Login from './component/Login/Login';
import { useSelector } from 'react-redux';
import { Component } from 'react';
import RegisterForm from './component/Login/RegisterForm';
import FastRegister from './component/Login/FastRegister';
import Footer from './component/layout/Footer';
import Vip_Registration from './component/Vip-Registration/vip-registration';
import Home from './component/Home/home';
import SuccessPayment from './component/Vip-Registration/SuccessPayment';
import LearnListCourse from './component/learn/LearnListCourse';
import LearnView from './component/learn/LearnView';
import EditProfile from './component/User/EditProfile';
import ForgotPassword from './component/User/ForgotPassword';
import ChangePassword from './component/User/ChangePassword';
import { ToastContainer } from 'react-toastify';


function App() {
  const JWT = useSelector(state => state);
  function hasJWT() {
    return JWT.loginReducer.token != undefined;
  }

  function checkRole() {
    console.log(JWT.loginReducer);
    console.log(JWT.loginReducer.roles);
    return JWT.loginReducer;
  }

  return (
    <div className="App">
      <BrowserRouter>
        <Header />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/class/:classes" element={hasJWT() ? <SchoolSubject /> : <Navigate to={{ pathname: '/login' }} replace />} />
          <Route path="/class/:classes/subject/:subject" element={hasJWT() ? <ExamTest /> : <Navigate to={{ pathname: '/login' }} replace />} />
          <Route path="/result" element={hasJWT() ? <Result /> : <Navigate to={{ pathname: '/login' }} replace />} />
          <Route path="/class/:classes/Lsubject/:Lsubject" element={hasJWT() ? <LearnListCourse /> : <Navigate to={{ pathname: '/login' }} replace />} />
          <Route path="/class/:classes/Lsubject/:Lsubject/course/:course" element={hasJWT() ? <LearnView /> : <Navigate to={{ pathname: '/login' }} replace />} />
          <Route path="/createQuestion" element={hasJWT() ? <CreateQuestion /> : <Navigate to={{ pathname: '/login' }} replace />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<FastRegister />} />
          <Route path='/vip-registration' element={<Vip_Registration />} />
          <Route path='/editprofile' element={<EditProfile />} />
          <Route path='/forgot-password' element={<ForgotPassword />} />
          <Route path='/change-password' element={<ChangePassword />} />
          <Route path='/pay-success' element={<SuccessPayment />} />
        </Routes>
        <Footer />
      </BrowserRouter>

      <ToastContainer
        position="top-right"
        autoClose={3000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
      />
    </div>
  );
}

export default App;
