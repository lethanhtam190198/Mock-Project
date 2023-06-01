import React from 'react'
import './footer.css'
export default function Footer() {
    return (
        <div>
            <footer className="new_footer_area bg_color">
                <div className="new_footer_top">
                    <div className="container" style={{ marginBottom: "-95px" }}>
                        <div className="row">
                            <div className="col-lg-4 col-md-6">
                                <div className="f_widget company_widget wow fadeInLeft" data-wow-delay="0.2s">
                                    <h3 className="f-title f_600 t_color f_size_18">Đây là tài sản trí tuệ của FSoftware</h3>
                                    <p>Liên hệ thêm tại FPT Complex Building, Nam Kỳ Khởi Nghĩa, Phường Hòa Hải, quận Ngũ Hành
                                        Sơn, Thành phố Đà Nẵng, Vietnam </p>
                                    <form action="#" className="f_subscribe_two mailchimp" method="post" noValidate={true}>
                                        <p className="mchimp-errmessage"></p>
                                        <p className="mchimp-sucmessage"></p>
                                    </form>
                                </div>
                            </div>
                            <div className="col-lg-4 col-md-6">
                                <div className="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.4s">
                                    <ul className="list-unstyled f_list">
                                        <table>
                                            <tbody className='td-info-group'>

                                                <tr>
                                                    <td colSpan="2">
                                                        <h3 className="f-title f_ 600 t_color f_size_18">Thông tin nhóm</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        TuanLN6
                                                    </td>
                                                    <td>
                                                        TrangNTT81
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        NgaTTT16
                                                    </td>
                                                    <td>
                                                        TamLT16
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        DatHD7
                                                    </td>
                                                    <td>
                                                        NghiaTH11
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </ul>
                                </div>
                            </div>
                            <div className="col-lg-4 col-md-6">
                                <div className="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.6s"
                                    style={{ position: "absolute", zIndex: 2 }}>
                                    <h3 className="f-title f_600 t_color f_size_18">Giúp đỡ</h3>
                                    <ul className="list-unstyled f_list">
                                        <li className="name"><a href="https://www.facebook.com/XcUmEoX" target="_blank">Leader:
                                            TuanLN6 </a></li>
                                        <li className="name"><a href=" https://www.facebook.com/profile.php?id=100008706585168"
                                            target="_blank">Sup Leader:
                                            TrangNTT81
                                        </a></li>
                                        <li className="name"><a href="https://www.facebook.com/tit.kun.900">Hotline: NgaTTT16</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="footer_bg">
                        <div className="footer_bg_one"></div>
                        <div className="footer_bg_two"></div>
                    </div>
                </div>

            </footer >
        </div >
    )
}
