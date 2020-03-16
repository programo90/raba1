package com.bitcamp.rava;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.service.KakaoAPI;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
    private KakaoAPI kakao;

    @RequestMapping(value = "/")
	public String home(Locale locale, Model model) {

		return "test/test2";
	}


    @RequestMapping(value="/login")
    public String login(@RequestParam("code") String code, HttpSession session, Model model) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);

        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("id") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
            model.addAttribute("id", userInfo.get("id"));
            model.addAttribute("profile_image", userInfo.get("profile_image"));
            model.addAttribute("nickname", userInfo.get("nickname"));

        }
        return "test/test2";
    }
	
}
