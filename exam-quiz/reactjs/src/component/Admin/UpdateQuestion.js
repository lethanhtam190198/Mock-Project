import React from 'react'
import { urlCategory, urlClasses, urlQuestion ,urlCourses} from '../url/urlTest'
import axios from 'axios';
import SelectListObject from '../layout/SelectListObject';
import { Link} from "react-router-dom";
import "./list.css";

export default function UpdateQuestion() {
    const classes = urlClasses;
    const category = urlCategory;
    const question = urlQuestion;
    const course = urlCourses;
    const onSubmit = (event) => {
        event.preventDefault();
        let formData = Object.fromEntries(new FormData(event.target));
        axios.post(question, formData, {
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(resp => {
            console.log(resp)
        })

    }

    return (
        <React.Fragment>
           <div className="bg-img">
      <div className="content">
        <header>Thêm mới câu hỏi</header>
             
            <form id="form" onSubmit={onSubmit}>
            <div className="field space">
                    <input type="text"  required placeholder="Nội dung câu hỏi" />
                </div>
                <div className="field space">
                    <input type="text"  required placeholder="Câu trả lời đúng" />
                </div>
                <div className="field space">
                    <input type="text"  required placeholder="Câu trả lời sai" />
                </div>          
                <div className=" space">
                    <SelectListObject url={category} name="categoryId" />
                </div>
                <div className="space">
                    <SelectListObject className="field " url={classes} name="classNameId" />
                </div>
                <div className="space"> 
                    <SelectListObject className="field " url={course} name="classNameId" />
                </div>
                <div className="m-3">
            <button className=" custom-btn-2 btn-3 " >Cập nhật</button>
              <button className=" custom-btn-2 btn-5"><Link to="/admin/listQuestion">Quay lại</Link></button>
          </div>
                            
            </form>
            </div>
            </div>
        </React.Fragment>
    )
}
