 import React from 'react'
import NoteGif from '../../images/notebook.gif'

const ChangePassword = () => {
    return (

        <div className="bd_fogotpass DatHD7" style={{ backgroundColor: "#f9f9f9" }}>
            <div style={{ backgroundColor: "#f9f9f9" }}>
                <div style={{ background: "#f9f9f9", backgroundColor: "#f9f9f9", margin: "0px auto", maxWidth: 600 }}>
                    <table
                        align="center"
                        border="0"
                        cellpadding="0"
                        cellspacing="0"
                        role="presentation"
                        style={{ background: "#f9f9f9", backgroundColor: "#f9f9f9", width: "100%" }}
                    >
                        <tbody>
                            <tr>
                                <td
                                    style={{
                                        borderBottom: "#333957 solid 5px",
                                        direction: "ltr",
                                        fontSize: 0,
                                        padding: "20px 0",
                                        textAlign: "center",
                                        verticalAlign: "top",
                                    }}
                                ></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style={{ background: "#fff", backgroundColor: "#fff", margin: "0px auto", maxWidth: 600 }}>
                    <table
                        className="tb1 DatHD7"
                        align="center"
                        border="0"
                        cellpadding="0"
                        cellspacing="0"
                        role="presentation"
                        style={{ background: "#fff", backgroundColor: "#fff", width: "100%" }}
                    >
                        <tbody>
                            <tr>
                                <td
                                    style={{
                                        border: "#dddddd solid 1px",
                                        borderTop: "0px",
                                        direction: "ltr",
                                        fontSize: 0,
                                        padding: "20px 0",
                                        textAlign: "center",
                                        verticalAlign: "top",
                                    }}
                                >
                                    <div
                                        className="mj-column-per-100 outlook-group-fix DatHD7"
                                        style={{
                                            fontSize: 13,
                                            textAlign: "left",
                                            direction: "ltr",
                                            display: "inline-block",
                                            verticalAlign: "bottom",
                                            width: "100%",
                                        }}
                                    >
                                        <table className="tb2 DatHD7" border="0" cellpadding="0" cellspacing="0" role="presentation" style={{ verticalAlign: "bottom" }} width="100%">
                                            <tr>
                                                <td align="center" style={{ fontSize: 0, padding: "10px 25px", wordBreak: "break-word" }}>
                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style={{ borderCollapse: "collapse", borderSpacing: 0 }}>
                                                        <tbody>
                                                            <tr>
                                                                <td style={{ width: 64 }}>
                                                                    <img className="img1 DatHD7" height="auto" src={NoteGif} style={{ border: 0, display: "block", outline: "none", textDecoration: "none", width: "500%", marginLeft: " -56px" }} />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" style={{ fontSize: 0, padding: "10px 25px", paddingBottom: 40, wordBreak: "break-word" }}>
                                                    <div style={{ fontFamily: "'Helvetica Neue', Arial, sans-serif", fontSize: 38, fontWeight: "bold", lineHeight: 1, textAlign: "center", color: "#555" }}>
                                                        Bạn muốn đổi mật khẩu !
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" style={{ fontSize: 0, padding: "10px 25px", paddingBottom: 40, wordBreak: "break-word" }}>
                                                    <div className="p1test DatHD7" style={{ fontFamily: "'Helvetica Neue', Arial, sans-serif", fontSize: 18, lineHeight: 1, textAlign: "center", color: "#555" }}>
                                                        Điền vào các ô dưới đây nhé 👇
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td
                                                    align="center"
                                                    style={{
                                                        fontSize: '0px',
                                                        padding: '10px 25px',
                                                        paddingTop: '30px',
                                                        paddingBottom: '50px',
                                                        wordBreak: 'break-word',
                                                    }}
                                                >
                                                    <div className="coolinput DatHD7" style={{ width: '15rem', marginTop: '-3rem' }}>
                                                        <label htmlFor="input" className="text DatHD7">
                                                            Email:
                                                        </label>
                                                        <input type="password" placeholder="" name="input" className="input DatHD7" />
                                                    </div>
                                                    <div className="coolinput DatHD7" style={{ width: '15rem' }}>
                                                        <label htmlFor="input" className="text DatHD7">
                                                            Mật khẩu cũ:
                                                        </label>
                                                        <input
                                                            type="password"
                                                            placeholder="Viết mật khẩu cũ vào đây..."
                                                            name="input"
                                                            className="input DatHD7"
                                                        />
                                                    </div>
                                                    <div className="coolinput DatHD7" style={{ width: '15rem' }}>
                                                        <label htmlFor="input" className="text DatHD7">
                                                            Mật khẩu mới:
                                                        </label>
                                                        <input
                                                            type="password"
                                                            placeholder="Viết mật khẩu mới vào đây..."
                                                            name="input"
                                                            className="input DatHD7"
                                                        />
                                                    </div>
                                                    <div className="coolinput DatHD7" style={{ width: '15rem' }}>
                                                        <label htmlFor="input" className="text DatHD7">
                                                            Nhập lại mật khẩu mới:
                                                        </label>
                                                        <input
                                                            type="password"
                                                            placeholder="Viết lại mật khẩu mới vào đây..."
                                                            name="input"
                                                            className="input DatHD7"
                                                        />
                                                    </div>
                                                    <table
                                                        align="center"
                                                        border={0}
                                                        cellPadding={0}
                                                        cellSpacing={0}
                                                        role="presentation"
                                                        style={{ borderCollapse: 'separate', lineHeight: '100%' }}
                                                    >
                                                        <tr>
                                                            <td
                                                                align="center"
                                                                role="presentation"
                                                                style={{
                                                                    border: 'none',
                                                                    borderRadius: '3px',
                                                                    color: '#ffffff',
                                                                    cursor: 'auto',
                                                                    padding: '15px 25px',
                                                                    paddingLeft: '1rem'
                                                                }}
                                                                valign="middle"
                                                            >
                                                                <button className="btn-save-fogotpass DatHD7"> Thay đổi mật khẩu</button>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td
                                                    align="center"
                                                    style={{
                                                        fontSize: '0px',
                                                        padding: '10px 25px',
                                                        paddingBottom: '40px',
                                                        wordBreak: 'break-word',
                                                    }}
                                                >
                                                    <div
                                                        style={{
                                                            fontFamily: "'Helvetica Neue',Arial,sans-serif",
                                                            fontSize: '16px',
                                                            lineHeight: '20px',
                                                            textAlign: 'center',
                                                            color: '#7F8FA4',
                                                        }}
                                                    ></div>
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

export default ChangePassword
