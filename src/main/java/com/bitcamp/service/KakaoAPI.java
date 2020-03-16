package com.bitcamp.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoAPI {
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST ?öîÏ≤??ùÑ ?úÑ?ï¥ Í∏∞Î≥∏Í∞íÏù¥ false?ù∏ setDoOutput?ùÑ trueÎ°?
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST ?öîÏ≤??óê ?ïÑ?öîÎ°? ?öîÍµ¨Ìïò?äî ?åå?ùºÎØ∏ÌÑ∞ ?ä§?ä∏Î¶ºÏùÑ ?Üµ?ï¥ ?†Ñ?Ü°
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=bffed4bc4d4a39e24324342a77147ade");
            sb.append("&redirect_uri=http://localhost:8080/login");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    Í≤∞Í≥º ÏΩîÎìúÍ∞? 200?ù¥?ùºÎ©? ?Ñ±Í≥?
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    ?öîÏ≤??ùÑ ?Üµ?ï¥ ?ñª?? JSON???ûÖ?ùò Response Î©îÏÑ∏Ïß? ?ùΩ?ñ¥?ò§Í∏?
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson ?ùº?ù¥Î∏åÎü¨Î¶¨Ïóê ?è¨?ï®?êú ?Å¥?ûò?ä§Î°? JSON?åå?ã± Í∞ùÏ≤¥ ?Éù?Ñ±
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
//	-------------------------------------------------------------------------
	
	
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    ?öîÏ≤??ïò?äî ?Å¥?ùº?ù¥?ñ∏?ä∏ÎßàÎã§ Í∞?Ïß? ?†ïÎ≥¥Í? ?ã§Î•? ?àò ?ûàÍ∏∞Ïóê HashMap???ûÖ?úºÎ°? ?Ñ†?ñ∏
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    ?öîÏ≤??óê ?ïÑ?öî?ïú Header?óê ?è¨?ï®?ê† ?Ç¥?ö©
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String id = element.getAsJsonObject().get("id").getAsString();
	        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString(); 
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("id", id);
	        userInfo.put("profile_image", profile_image);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}

	
}
