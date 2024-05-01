package com.web.billy.demo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import com.web.billy.demo.model.ReservationSearchData;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import jakarta.servlet.http.HttpSession;
import java.io.*;

@Controller
public class ReservationSearchController {@PostMapping(value = "reservationSearch", params = {"account"})
public ModelAndView reservationSearch(HttpSession session,
		@RequestParam("account") String account) {
    try {
        String url = "https://script.google.com/macros/s/AKfycbwzCP8-Vc8F3PRbNXUhYfo8QavsWp7LpWu4HhleqvzX1MmD__y2sCZC0-BNAbjGg79G/exec";
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();

        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        con.setDoOutput(true);

        String urlParameters = "account=" + URLEncoder.encode(account, "UTF-8") +                               
                               "&action=reservation_Search";
        con.setRequestProperty("Content-Length", String.valueOf(urlParameters.length()));

        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        // 使用 Jackson 解析 JSON
        ObjectMapper mapper = new ObjectMapper();
        List<ReservationSearchData> reservationsSearch = mapper.readValue(con.getInputStream(), new TypeReference<List<ReservationSearchData>>() {});

        session.setAttribute("reservationsSearch", reservationsSearch);
        
        System.out.println(reservationsSearch);
        
        return new ModelAndView("redirect:/reservationSearch"); 
        
         
    } catch (Exception e) {
        e.printStackTrace();
        
        return new ModelAndView("redirect:/memberShipCenter");  
    }
}
}
