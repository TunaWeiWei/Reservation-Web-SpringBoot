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
public class MemberEditController {
	@PostMapping(value = "memberEdit", params = {"account", "passWord","userName","age","tel","cellphone","email"})
    public ModelAndView memberEdit(HttpSession session,
    		@RequestParam("account") String account,
    		@RequestParam("passWord") String password, 
    		@RequestParam("userName") String userName,
    		@RequestParam("age") String age,
    		@RequestParam("tel") String tel,
    		@RequestParam("cellphone") String cellphone,
    		@RequestParam("email") String email){
        try {
        		
            String url = "https://script.google.com/macros/s/AKfycbwzCP8-Vc8F3PRbNXUhYfo8QavsWp7LpWu4HhleqvzX1MmD__y2sCZC0-BNAbjGg79G/exec";
            
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setDoOutput(true);

            String urlParameters = "account=" + URLEncoder.encode(account, "UTF-8") +
                                   "&passWord=" + URLEncoder.encode(password, "UTF-8") +
                                   "&userName=" + URLEncoder.encode(userName, "UTF-8") +
                                   "&age=" + URLEncoder.encode(age, "UTF-8") +
                                   "&tel=" + URLEncoder.encode(tel, "UTF-8") +
                                   "&cellphone=" + URLEncoder.encode(cellphone, "UTF-8") +
                                   "&email=" + URLEncoder.encode(email, "UTF-8") +
                                   "&action=Member_Edit";
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
            
            //將解析的JSON內容取出
            String editCheck = rootNode.get("editCheck").asText();   
            System.out.println(editCheck);            
            
            if(editCheck.equals("success")) {            	
            	// 将修改值存入session            	
            	
            	session.setAttribute("username", userName);
            	session.setAttribute("age", age);
            	session.setAttribute("tel", tel);
            	session.setAttribute("cellphone", cellphone);
            	session.setAttribute("email", email);
            	
            	System.out.println("修改成功");         	
            	return new ModelAndView("redirect:/memberShipCenter"); 
            	
            }else {
            	
            	System.out.println("修改" + editCheck);
            	return new ModelAndView("redirect:/memberShipCenter");
            	
            }
            
            
             
        } catch (Exception e) {
            e.printStackTrace();
            
            return new ModelAndView("redirect:/login");  
        }
    }
}

