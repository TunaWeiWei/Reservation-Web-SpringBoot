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

import javax.servlet.http.HttpSession;
import java.io.*;


@Controller
public class LoginController {
    @PostMapping(value = "loginCheck", params = {"account", "passWord"})
    public ModelAndView loginCheck(HttpSession session, @RequestParam("account") String account, @RequestParam("passWord") String password) {
        try {
            String url = "https://script.google.com/macros/s/AKfycbwzCP8-Vc8F3PRbNXUhYfo8QavsWp7LpWu4HhleqvzX1MmD__y2sCZC0-BNAbjGg79G/exec";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setDoOutput(true);

            String urlParameters = "account=" + URLEncoder.encode(account, "UTF-8") +
                                   "&passWord=" + URLEncoder.encode(password, "UTF-8") +
                                   "&action=Login_Submit";
            con.setRequestProperty("Content-Length", String.valueOf(urlParameters.length()));

            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(urlParameters);
            wr.flush();
            wr.close();

            // 使用 Jackson 解析 JSON
            ObjectMapper mapper = new ObjectMapper();
            JsonNode rootNode = mapper.readTree(con.getInputStream());
            
            //確認收到的JSON值
            System.out.println(rootNode);
            
            //將解析的JSON內容一一取出
            String loginCheck = rootNode.get("loginCheck").asText();
            String user_account = rootNode.get("account").asText();
            String username = rootNode.get("username").asText();
            String age = rootNode.get("age").asText();
            String tel = rootNode.get("tel").asText();
            String cellphone = rootNode.get("cellphone").asText();
            String email = rootNode.get("email").asText();

            // 将 loginCheck 存入 session
            session.setAttribute("loginCheck", loginCheck);
            session.setAttribute("account", user_account);
            session.setAttribute("username", username);
            session.setAttribute("age", age);
            session.setAttribute("tel", tel);
            session.setAttribute("cellphone", cellphone);
            session.setAttribute("email", email);
            
            
            
            //確認JSON內單獨取出的值
            System.out.println(loginCheck);
            System.out.println(user_account);
            System.out.println(username);
            System.out.println(age);
            System.out.println(tel);
            System.out.println(cellphone);
            System.out.println(email);

            return new ModelAndView("redirect:/introduction");  // 重定向到主页
        } catch (Exception e) {
            e.printStackTrace();
            session.invalidate();
            return new ModelAndView("redirect:/");  // 发生错误时重定向到错误页面
        }
    }
}

