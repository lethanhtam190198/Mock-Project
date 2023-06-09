package com.java.payment;

import com.java.model.PurchaseVIP;
import com.java.model.Users;
import com.java.model.Vip;
import com.java.service.IPaymentService;
import com.java.service.IVipService;
import com.java.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/payment")
@CrossOrigin("http://localhost:3000/")
public class ControllerPayment {
    @Autowired
    HttpServletRequest req;

    @Autowired
    HttpServletResponse resp;

    @Autowired
    IPaymentService paymentService;

    @Autowired
    UserServiceImpl userService;

    @Autowired
    IVipService vipService;

    /**
     * Author:TamLT16
     * @param amountTotal
     * @param username
     * @return paymentVNPAY
     * @throws UnsupportedEncodingException
     */
    @GetMapping("/{amountTotal}/{username}")
    public ResponseEntity<?> test(@PathVariable("amountTotal") Integer amountTotal,
                                  @PathVariable("username") String username) throws UnsupportedEncodingException {

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = "Thanh toan";
        String orderType = "other";
        String vnp_TxnRef = Config.getRandomNumber(8);
//        String vnp_IpAddr = Config.getIpAddress(req);
        String vnp_IpAddr = "118.69.73.134";
        String vnp_TmnCode = Config.vnp_TmnCode;

//        String amountParam = req.getParameter("amount");
        String amountParam = amountTotal + "";
        int amount = 120000; // Giá trị mặc định nếu không thể chuyển đổi thành số nguyên

        if (amountParam != null && !amountParam.isEmpty()) {
            amount = Integer.parseInt(amountParam) * 100;
        } else {
            amount = amount * 100;
        }

//        int amount = Integer.parseInt(req.getParameter("amount")) * 100;
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        String bank_code = req.getParameter("bankcode");
        if (bank_code != null && !bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        } else {
            vnp_Params.put("vnp_BankCode", "ncb");
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        //Add Params of 2.0.1 Version
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
        //Billing
        vnp_Params.put("vnp_Bill_Mobile", req.getParameter("txt_billing_mobile"));
        vnp_Params.put("vnp_Bill_Email", req.getParameter("txt_billing_email"));
//        String fullName = (req.getParameter("txt_billing_fullname")).trim();
        String fullName = req.getParameter("txt_billing_fullname");
        if (fullName != null) {
            fullName = fullName.trim();
        } else {
            fullName = "Le Thanh Tam";
        }

        if (fullName != null && !fullName.isEmpty()) {
            int idx = fullName.indexOf(' ');
            String firstName = fullName.substring(0, idx);
            String lastName = fullName.substring(fullName.lastIndexOf(' ') + 1);

        }
        vnp_Params.put("vnp_Bill_Address", req.getParameter("txt_inv_addr1"));
        vnp_Params.put("vnp_Bill_City", req.getParameter("txt_bill_city"));
        vnp_Params.put("vnp_Bill_Country", req.getParameter("txt_bill_country"));
        if (req.getParameter("txt_bill_state") != null && !req.getParameter("txt_bill_state").isEmpty()) {
            vnp_Params.put("vnp_Bill_State", req.getParameter("txt_bill_state"));
        }
        // Invoice
        vnp_Params.put("vnp_Inv_Phone", req.getParameter("txt_inv_mobile"));
        vnp_Params.put("vnp_Inv_Email", req.getParameter("txt_inv_email"));
        vnp_Params.put("vnp_Inv_Customer", req.getParameter("txt_inv_customer"));
        vnp_Params.put("vnp_Inv_Address", req.getParameter("txt_inv_addr1"));
        vnp_Params.put("vnp_Inv_Company", req.getParameter("txt_inv_company"));
        vnp_Params.put("vnp_Inv_Taxcode", req.getParameter("txt_inv_taxcode"));
        vnp_Params.put("vnp_Inv_Type", req.getParameter("cbo_inv_type"));
        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(URI.create(paymentUrl));

        Vip vip = vipService.findByPrice(amountTotal);
        Users users = userService.findByUsername(username);

//        PurchaseVIP purchaseVIP = new PurchaseVIP();
//        }
//        if(amountTotal==50000) {
//            purchaseVIP.setTimePurchase(Date.valueOf(LocalDate.now().plusDays(30)));
//        }
//        else if(amountTotal==100000){
//            purchaseVIP.setTimePurchase(Date.valueOf(LocalDate.now().plusDays(90)));
//        }
//        else if(amountTotal==300000) {
//            purchaseVIP.setTimePurchase(Date.valueOf(LocalDate.now().plusDays(180)));
//        }
//        else if(amountTotal==600000){
//            purchaseVIP.setTimePurchase(Date.valueOf(LocalDate.now().plusDays(365)));
//        }

        paymentService.savevip(new PurchaseVIP(vip,users));
        return new ResponseEntity<>(paymentUrl, HttpStatus.OK);
    }

    @GetMapping("success")
    public String success(Model model) {
        String amount = req.getParameter("vnp_Amount");
        model.addAttribute("vnp_Amount", amount);
        return "success";
    }
}
