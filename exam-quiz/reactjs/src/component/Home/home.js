import React from "react";
import "./home.css";
import { Link } from 'react-router-dom'

function Home() {
    return (
        <>  
            <div className="space">
            </div>
            <div className="body1">
                <div class="top_container">
                    <section class="hero_section ">
                        <div class="hero-container container">
                            <div class="hero_detail-box">
                                <h3 className="h3welcome">
                                    Chào mừng bạn  <br />
                                    đã đến với
                                </h3>
                                <h1 className="title-1-yoursmile">
                                    Your Smile
                                </h1>
                                <p className="title-1-text-welcome">
                                Xin chào và chào mừng đến với trang web làm trắc nghiệm của chúng tôi! Tại đây, bạn sẽ có cơ hội thử sức với hàng ngàn câu hỏi khác nhau, từ đơn giản đến phức tạp, từ các chủ đề giáo dục đến giải trí. Chúng tôi hy vọng bạn sẽ tìm thấy trải nghiệm học tập và giải trí thú vị trên trang web của chúng tôi.
                                </p>
                                <div className="hero_btn-continer">
                                    {/* <a href="" class="call_to-btn btn_white-border">
                                        <span>
                                            Bắt đầu
                                        </span>
                                        <img src="../images/right-arrow.png" alt="" />
                                    </a> */}
                                </div>
                            </div>
                            <div className="hero_img-container">
                                <div>
                                    <img src="../images/hero.png" alt="" class="img-fluid" />
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>


            <div className="container">
                <div className="home-1">
                    <div className="title-1">
                        <h2>90% học sinh sử dụng Your Smile cho biết họ đã cải thiện được điểm số.</h2>
                    </div>
                    <div className="row" style={{ marginTop: 30 }}>
                        <div className="col-6">
                            <img className="img-home-1" src="https://images.prismic.io/quizlet-prod/130dc509-6919-47bc-b27d-17f600a41b0c_IntlFirstSlice.png?auto=compress,format" />
                        </div>
                        <div className="col-6">
                            <h5 className="title-1-home-1">Ghi nhớ nhanh hơn,miễn phí</h5>
                            <p style={{ marginTop: 20 }}>Nghiên cứu cho thấy việc tự kiểm tra bằng thẻ ghi nhớ sẽ hiệu quả hơn việc đọc lại ghi chú của bạn. Từ toán học, y học đến ngôn ngữ hiện đại, Quizlet được học sinh sử dụng trong hơn 100 chủ đề khác nhau.</p>
                        </div>
                    </div>

                </div>


                <div className="home-2">
                    <div className="row">
                        <div className="col-7">
                            <h5 className="home-2-title-kiemtra">Sẵn sàng cho ngày thi với Học và Kiểm tra</h5>
                            <p>Biến thẻ ghi nhớ của bạn thành các bài kiểm tra thử có thể tùy chỉnh. Vượt qua sự ghi nhớ thông thường với các loại câu hỏi thách thức khả năng của bạn.</p>
                            <div className="onluyen">
                                <div>
                                    <img src="https://prismic-io.s3.amazonaws.com/quizlet-prod/8ec0178c-1b86-4698-b547-bcbe3e5172d4_learn.svg" />
                                </div>
                                <div style={{ marginLeft: 15 }}>
                                    <h5>Ôn luyện bằng chế độ Học</h5>
                                    <p>Nhận phản hồi tức thì trong khi thực hành với các câu hỏi trắc nghiệm, đúng hoặc sai, tự luận và hơn thế nữa.</p>
                                </div>
                            </div>
                            <div className="kiemtra">
                                <div>
                                    <img src="https://prismic-io.s3.amazonaws.com/quizlet-prod/69eba793-2788-47dd-a8a7-e89d723edbe7_Test.svg" />
                                </div>
                                <div style={{ marginLeft: 15 }}>
                                    <h5>Làm bài kiểm tra</h5>
                                    <p>Học tập hiệu quả với các bài kiểm tra thử để bạn sẵn sàng cho kỳ thi.</p>
                                </div>
                            </div>
                        </div>
                        <div className="col-4">
                            <img className="picture-home2" src="https://media3.giphy.com/media/w0Fy3hcQuZxxQgo0KR/giphy.webp?cid=ecf05e47l6ojyvdilmxoh7tbhzk19dk8edvftuj5oiqjez00&ep=v1_gifs_search&rid=giphy.webp&ct=g" />
                        </div>
                    </div>
                </div>
            </div>

            <div className="div-home-3">
                <div className="container">
                    <div className="home-3">
                        <div className="row">
                            <div className="col-7">
                                <div className="home-3-title">
                                    <h5 className="home-3-title-giaovien">Giáo viên</h5>
                                    <h5 className="home-3-title-1">Truyền năng lượng cho học sinh của bạn</h5>
                                    <p className="home-3-title-p">Giúp các em tự tin học bất cứ nội dung nào, dù cho mục tiêu phấn đấu có là gì đi nữa. Sử dụng các học phần miễn phí, chế độ học và trò chơi Cột mốc trong lớp của Quizlet, bạn có thể ngay lập tức tạo ra một lớp học tương tác cao hơn.
                                        Học sinh và giáo viên có thể đăng ký và học miễn phí.</p>
                                    <button className=""><Link
                                        role="button"
                                        to='/register'
                                        as={Link}
                                        className="btn btn-primary">
                                        Lập tài khoản miễn phí
                                    </Link></button>
                                    
                                </div>
                            </div>
                            <div className="col-4">
                                <img className="img-home-3" src="https://images.prismic.io/quizlet-prod/d5b00568-a324-488f-b16b-44480144cb81_Image+for+Text+Callout+%283%29.png?auto=compress,format&rect=0,0,501,500&w=501&h=500" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <h2>
                    <span class="center">Trải qua khóa học bổ ích </span>
                </h2> 
                <div className="introduce">
                    <div class="card">
                        <img src="https://www.shutterstock.com/image-photo/portrait-asian-child-posing-on-260nw-2148771855.jpg" alt="" />
                        <p className="text-card" style={{ fontFamily: "cursive" }}>“Quizlet đã tiếp sức cho thành công của em trong học tập, đang hỗ trợ đắc lực cho em trong thời gian học sắp tới”.</p>
                        <p className="text-card">Gia Hân, 10 tuổi, học lớp 4</p>
                    </div>
                    <div class="card">
                        <img src="https://www.shutterstock.com/image-photo/portrait-surprised-little-asian-boy-260nw-2055846797.jpg" alt="" />
                        <p className="text-card" style={{ fontFamily: "cursive" }}>“Chế độ Học là điều tuyệt vời nhất từng có từ Your Smile. Nó hiển thị cho bạn các thuật ngữ theo cách dễ ghi nhớ nhất."</p>
                        <p className="text-card">Quốc Long, 9 tuổi, học lớp 3</p>
                    </div> 
                    <div class="card">
                        <img src="https://www.shutterstock.com/image-photo/image-asian-child-posing-on-260nw-2148771845.jpg" alt="" />
                        <p className="text-card" style={{ fontFamily: "cursive" }}>“Em đã chia sẻ cho bạn bè các khóa học của Your Smile để cùng nhau có kết quả tốt trong các kỳ thi học kỳ."</p>
                        <p className="text-card">Anh Thư, 9 tuổi, học lớp 3</p>
                    </div>
                </div>
            </div>
            <div className="thong-ke-dangki">
            <div className="container">
                <div className="total-thongke">
                    <div className="thongke">
                        <p><span class="underline">1200</span></p>
                        <h2>Số người đăng ký học</h2>
                    </div>
                    <div className="centertt">

                    </div>
                    <div className="thongke">
                        <p><span class="underline">500</span></p>
                        <h2>Số người đăng ký Vip</h2>
                    </div>
                </div>
            </div>
            </div>
        </>
    )
}

export default Home;