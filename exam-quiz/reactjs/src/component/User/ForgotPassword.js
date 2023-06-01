import React from 'react'
import './FogotPasswordStyle.css'
import confuseGif from '../../images/confused.gif'
import handPoint from '../../images/point-down.png'


const ForgotPassword = () => {
    return (
        <div className="bd_fogotpass DatHD7" style={{ backgroundColor: "#f9f9f9;" }}>
            <div style={{ backgroundColor: "#f9f9f9" }}>
                <div style={{ background: "#f9f9f9", backgroundColor: "#f9f9f9", Margin: "0px auto", maxWidth: "600px;" }}>

                    <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation"
                        style={{ background: "#f9f9f9", backgroundColor: "#f9f9f9", width: "100%" }}>
                        <tbody>
                            <tr>
                                <td
                                    style={{ borderBottom: "#333957 solid 5px", direction: "ltr", fontSize: "0px", padding: "20px 0", textAlign: "center", verticalAlign: "top" }}>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style={{ background: "#fff", backgroundColor: "#fff", Margin: "0px auto", maxWidth: "600px" }}>

                    <table className="tb1 DatHD7" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation"
                        style={{ background: "#fff", backgroundColor: "#fff", width: "100%" }}>
                        <tbody>
                            <tr>
                                <td
                                    style={{ border: "#dddddd solid 1px", borderTop: "0px", direction: "ltr", fontSize: "0px", padding: "20px 0", textAlign: "center", verticalAlign: "top" }}>
                                    <div className="mj-column-per-100 outlook-group-fix DatHD7"
                                        style={{ fontSize: "13px", textAlign: "left", direction: "ltr", display: "inline-block", verticalAlign: "bottom", width: "100%" }}>

                                        <table className="tb2 DatHD7" border="0" cellpadding="0" cellspacing="0" role="presentation"
                                            style={{ verticalAlign: "bottom", width: "100%" }}>
                                            <tr>
                                                <td align="center"
                                                    style={{ fontSize: "0px", padding: "10px 25px", wordBreak: "break-word" }}>
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                        role="presentation"
                                                        style={{ borderCollapse: "collapse", borderSpacing: "0px" }}>
                                                        <tbody>
                                                            <tr>
                                                                <td style={{ width: "64px" }}>
                                                                    <img className="img1 DatHD7" height="auto" src={confuseGif}
                                                                        style={{
                                                                            border: "0", display: "block", outline: "none", textDecoration: "none", width: "500%", marginLeft: " -56px"
                                                                        }} />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center"
                                                    style={{ fontSize: "0px", padding: "10px 25px", paddingBottom: "40px", wordBreak: "break-word" }}>
                                                    <div
                                                        style={{ fontFamily: "'Helvetica Neue',Arial,sans-serif", fontSize: "38px", fontWeight: "bold", lineHeight: "1", textAlign: "center", color: "#555" }}>
                                                        Oops!
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center"
                                                    style={{ fontSize: "0px", padding: "10px 25px", paddingBottom: "40px", wordBreak: "break-word" }}>
                                                    <div
                                                        style={{ fontFamily: "'Helvetica Neue',Arial,sans-serif", fontSize: "18px", lineHeight: "1", textAlign: "center", color: "#555" }}>
                                                        Hình như bạn quên mật khẩu rồi nhỉ 😞
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center"
                                                    style={{ fontSize: "0px", padding: "10px 25px", wordBreak: "break-word" }}>
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0"
                                                        role="presentation"
                                                        style={{ borderCollapse: "collapse", borderSpacing: "0px" }}>
                                                        <tbody>
                                                            <tr>
                                                                <td style={{ width: "128px" }}>
                                                                    <img className="img2 DatHD7" height="auto" src={handPoint}
                                                                        style={{
                                                                            border: "0", display: "block", outline: "none", textDecoration: "none", width: " 12rem",
                                                                            marginLeft: "-1.5rem"
                                                                        }} />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" style={{ fontSize: 0, padding: '10px 25px', paddingTop: 30, paddingBottom: 50, wordBreak: 'break-word' }}>
                                                    <div className="coolinput DatHD7" style={{ width: '15rem' }}>
                                                        <label htmlFor="input" className="text DatHD7">Email:</label>
                                                        <input type="text" placeholder="Viết email vào đây..." name="input" className="input DatHD7" />
                                                    </div>
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style={{ borderCollapse: 'separate', lineHeight: '100%' }}>
                                                        <tbody>
                                                            <tr>
                                                                <td align="center" role="presentation" style={{ border: 'none', borderRadius: '3px', color: '#ffffff', cursor: 'auto', padding: '15px 25px' }} valign="middle">
                                                                    <button className="btn-save-fogotpass DatHD7">Đặt lại mật khẩu</button>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" style={{ fontSize: 0, padding: '10px 25px', paddingBottom: 40, wordBreak: 'break-word' }}>
                                                    <div style={{ fontFamily: "'Helvetica Neue',Arial,sans-serif", fontSize: 16, lineHeight: 20, textAlign: 'center', color: '#7F8FA4' }}>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    )
}

export default ForgotPassword
