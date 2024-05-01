package com.web.billy.demo.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import java.io.*;

@Controller
public class ServiceController {
	@PostMapping(value = "service", params = {"account", "userName", "customer", "date", "eatingTime"})
    public ModelAndView service(HttpSession session,
    		@RequestParam("account") String account,
    		@RequestParam("userName") String userName,
    		@RequestParam("customer") String customer,
    		@RequestParam("date") String date,
    		@RequestParam("eatingTime") String eatingTime) {
        try {
            String url = "https://script.google.com/macros/s/AKfycbwzCP8-Vc8F3PRbNXUhYfo8QavsWp7LpWu4HhleqvzX1MmD__y2sCZC0-BNAbjGg79G/exec";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setDoOutput(true);

            String urlParameters = "account=" + URLEncoder.encode(account, "UTF-8") +
                                   "&userName=" + URLEncoder.encode(userName, "UTF-8") +
                                   "&customer=" + URLEncoder.encode(customer, "UTF-8") +
                                   "&date=" + URLEncoder.encode(date, "UTF-8") +
                                   "&eatingTime=" + URLEncoder.encode(eatingTime, "UTF-8") +
                                   "&action=service_Submit";
            con.setRequestProperty("Content-Length", String.valueOf(urlParameters.length()));

            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(urlParameters);
            wr.flush();
            wr.close();

            // 使用 Jackson 解析 JSON
            ObjectMapper mapper = new ObjectMapper();
            JsonNode rootNode = mapper.readTree(con.getInputStream());
            
            //確認收到的JSON值
            //System.out.println(rootNode);
            
            //將解析的JSON內容一一取出
            String serviceResponse = rootNode.asText();
            System.out.println(serviceResponse);
            
            return new ModelAndView("redirect:/memberShipCenter"); 
            
             
        } catch (Exception e) {
            e.printStackTrace();
            
            return new ModelAndView("redirect:/service");  
        }
    }
}
