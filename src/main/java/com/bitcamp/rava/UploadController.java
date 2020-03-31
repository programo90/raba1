package com.bitcamp.rava;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.dto.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
/*@Log4j*/
public class UploadController {

	private String path="\\resources\\img\\uploadimg";
	
	//첨부파일이 이미지 타입인지 확인하는 메서드
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		
		}catch(IOException e) {
			
			e.printStackTrace();
		}
		
		return false;
	}
		
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		
		/*log.info("upload ajax");*/
		
		return "/upload/uploadAjax";
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
		
	}
	
	/* @responsebody의 존재가 심히 의문스러움 */
	@PostMapping(value = "/uploadAjaxAction", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(HttpServletRequest request,MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		
		String uploadpath = request.getSession().getServletContext().getRealPath(path); //상대 경로 알려주는것
		
		String uploadFolder = uploadpath;
		
		String uploadFolderPath = getFolder(); //업로드되는 폴더의 경로??
		//make folder-----------------
		File uploadPath = new File(uploadFolder, getFolder()); //getFolder는 오늘 날찌의 경로를 문자열로 생성
		/*log.info("uploadpath" + uploadpath);*/
		
		if(uploadPath.exists() == false) {
			
			uploadPath.mkdirs();
			
		}
		//make yyyy/MM/dd folder
		
		for(MultipartFile multipartFile : uploadFile) {
		
			/*log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			log.info("upload file name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());*/
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// ie has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			/*log.info("only file name : " + uploadFileName);*/
			
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID(); //임의 값을 생성
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			
			try {
			
				File saveFile = new File(uploadPath, uploadFileName);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				multipartFile.transferTo(saveFile);
				
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail, 100, 100); // thumbnail size 100*100
					
					thumbnail.close();
				}
				
				list.add(attachDTO); //add to list
				
			}catch(Exception e) {
				e.printStackTrace();
			}//END CATCH
			
		}//END FOR
		
		return new ResponseEntity<List<AttachFileDTO>>(list, HttpStatus.OK);
	}
	
}
