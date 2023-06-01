import { useEffect, useState } from "react";
import { Outlet, Link, useNavigate } from "react-router-dom";
import "./list.css";
function Admin() {

  return (
    <>
<div className="row" id="admin">
        <div className="left col-2 p-4" >
      <div className="d-flex p-3 border__bottom">
          <form action="" className="d-flex">
              <input type="text" className="form__control rounded-start-2 col-10 input"
                  placeholder="Tìm kiếm . . ." aria-describedby="button-addon2"
                  name="keyword" />
                
              <button className="btn align-items-center rounded-end-2 border__color input"
                  type="submit" id="button-addon2">
                  <i className="fa-solid fa-magnifying-glass"></i>
              </button>
          </form>
      </div>
  
      <div className="p-3 border__bottom" id="view__contents">
              <button className="continue-application" id="listQuestion">
                <div>
                    <div className="pencil"></div>
                    <div className="folder">
                        <div className="top">
                            <svg viewBox="0 0 24 27">
                                <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                            </svg>
                        </div>
                        <div className="paper"></div>
                    </div>
                </div>
				<Link to="./listQuestion">  Danh sách câu hỏi</Link> 
            </button>
      </div>
      <div className="p-3 border__bottom" id="view__contents">
              <button className="continue-application">
                <div>
                    <div className="pencil"></div>
                    <div className="folder">
                        <div className="top">
                            <svg viewBox="0 0 24 27">
                                <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                            </svg>
                        </div>
                        <div className="paper"></div>
                    </div>
                </div>
				<Link to="./listUser">   Danh sách người dùng</Link>
            </button>
      </div>
      <div className="p-3 border__bottom" id="view__contents">
          
              <button className="continue-application">
                <div>
                    <div className="pencil"></div>
                    <div className="folder">
                        <div className="top">
                            <svg viewBox="0 0 24 27">
                                <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                            </svg>
                        </div>
                        <div className="paper"></div>
                    </div>
                </div>
				<Link to="./listCourse" >  Danh sách bài học</Link>
            </button>
          
      </div>
      <div className="p-3 border__bottom" id="view__contents">
          
              <button className="continue-application">
                <div>
                    <div className="pencil"></div>
                    <div className="folder">
                        <div className="top">
                            <svg viewBox="0 0 24 27">
                                <path d="M1,0 L23,0 C23.5522847,-1.01453063e-16 24,0.44771525 24,1 L24,8.17157288 C24,8.70200585 23.7892863,9.21071368 23.4142136,9.58578644 L20.5857864,12.4142136 C20.2107137,12.7892863 20,13.2979941 20,13.8284271 L20,26 C20,26.5522847 19.5522847,27 19,27 L1,27 C0.44771525,27 6.76353751e-17,26.5522847 0,26 L0,1 C-6.76353751e-17,0.44771525 0.44771525,1.01453063e-16 1,0 Z"></path>
                            </svg>
                        </div>
                        <div className="paper"></div>
                    </div>
                </div>
				<Link to="./statistics"> Tổng thống kê</Link>
            </button>
      </div>
     
     </div>
    <div className="col-10 p-5" id="content"><Outlet /></div>
     </div>
    </>
  );
}
export default Admin;
