package com.bitcamp.rava;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.security.Login__AuthVO;
import com.bitcamp.security.Login__MemberVO;
import com.bitcamp.security.MemberService;
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
	@Autowired
	private MemberService service;
	
	private Login__MemberVO vo = new Login__MemberVO();
	

    @RequestMapping(value = "/")
	public String home(Locale locale, Model model) {

		return "intro";
	}


	@RequestMapping(value="/login")
    public String login(@RequestParam("code") String code, HttpSession session, Model model) {
        String access_Token = kakao.getAccessToken(code);
        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        List<Login__AuthVO> list = new ArrayList<>();
        
        
        //    클라이언트의 id가 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("id") != null) {//카카오에서아이디를 받아왔는지 체크합니다.
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
            model.addAttribute("id", userInfo.get("id"));
            
            //id랑 db랑 체크하는 서비스를 만들어줍니다.if문을 만들어서 있으면 로그인 없으면 가입창으로 이동할 수 있도록 리턴 페이지로 이동합니다.
            model.addAttribute("profile_image", userInfo.get("profile_image"));
            model.addAttribute("nickname", userInfo.get("nickname"));
            vo.setUserid((String) userInfo.get("id"));
            System.out.println("abcd" + service.idCheck(vo));
           if(service.idCheck(vo) == 0) {
        	   vo.setPassword("host");
        	   vo.setUsername((String) userInfo.get("nickname"));
        	   vo.setUserimg((String) userInfo.get("profile_image"));
        	   list.add(new Login__AuthVO((String)userInfo.get("id"), "ROLE_MEMBER"));
        	   vo.setAuthList(list);
        	   service.signup(vo);
        	   //약관 동의창으로 넘겨서 transaction을 적용해줍니다. 
           }
        }
		return "customLogin";
        
    }
	
}
