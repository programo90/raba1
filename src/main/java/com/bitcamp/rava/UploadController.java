package com.bitcamp.rava;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {

	private String path="\\resources\\img\\uploadimg";
		
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		
		log.info("upload ajax");
		
		return "/upload/uploadAjax";
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
		
	}
	
	/* @responsebody의 존재가 심히 의문스러움 */
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public void uploadAjaxPost(HttpServletRequest request,MultipartFile[] uploadFile) {
		
		String uploadpath = request.getSession().getServletContext().getRealPath(path); //경로 알려주는것
		
		String uploadFolder = uploadpath;
		
		//make folder-----------------
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadpath" + uploadpath);
		
		if(uploadPath.exists() == false) {
			
			uploadPath.mkdirs();
			
		}
		//make yyyy/MM/dd folder
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			log.info("upload file name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// ie has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			log.info("only file name : " + uploadFileName);
			
			//File saveFile = new File(uploadFolder, uploadFileName);
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				
				multipartFile.transferTo(saveFile);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}//END CATCH
			
		}//END FOR
		
	}
	
}
