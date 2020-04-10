package com.bitcamp.rava;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.dto.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
/*@Log4j*/
public class UploadController {

	/*private String path="\\resources\\img\\uploadimg";*/
	
//	String realuploadpath = "/resources/img/goods/";
	String realuploadpath = "/usr/local/apache-tomcat-9.0.33/webapps/raba1/resources/img/goods/";
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
		
		/*String realuploadpath = request.getSession().getServletContext().getRealPath(path); //상대 경로 알려주는것
*/		
		/*String realuploadpath = "/usr/local/apache-tomcat-9.0.33/webapps/raba1/resources/img";*/
		
		String uploadFolder = realuploadpath; 
		
		String uploadFolderPath = getFolder(); //업로드되는 폴더의 경로??
		//make folder-----------------
		File uploadPath = new File(uploadFolder, uploadFolderPath); //getFolder는 오늘 날찌의 경로를 문자열로 생성
		
		/*log.info("uploadPath : " + uploadPath);*/
		
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
			
			/*log.info("uploadFileName : " + uploadFileName);*/
			
			try {
			
				File saveFile = new File(uploadPath, uploadFileName);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				/*log.info("uploadFolderPath : " + uploadFolderPath);*/
				
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
	
	
	//특정한 파일 이름을 받아서 이미지 데이터를 전송하는 코드
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName,HttpServletRequest request){ 
		//getFile은 문자열로 경로가 포함된 fileName을 파라미터로 받고 byte[]로 전송합니다.
		
		/*log.info("fileName : " + fileName);*/
		
		/*String realuploadpath = request.getSession().getServletContext().getRealPath(path); //상대 경로 알려주는것
*/		
		
		/*String realuploadpath = "/usr/local/apache-tomcat-9.0.33/webapps/raba1/resources/img";*/
		
		File file = new File( realuploadpath + "/" + fileName);
		
		/*log.info("file : " + file);*/
	
		ResponseEntity<byte[]> result = null; 
		// byte[]로 이미지파일의 데이터를 전송할 때 신경쓰이는 것은 MIME 타입이 파일의 종류에 따라 달라지는 점 입니다.
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath())); 
			//때문에 probeContentType을 사용하여 적절한 MIME타입 데이터를 Http 헤더 메세지에 포함할수 있도록 처리합니다.
			result=new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
			
		}catch(IOException e) {
			
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	/*이미지와 달리 다운로드는 MIME 타입이 고정되기 때문에 다음과 같은 메서드를 생성
	@RequestHeader를 통해 필요한 http헤더 메세지의 내용을 수집 가능 이를 통해 user-agent의 정보를 파악하고 경우에 따라 다른 방식으로 처리를 한다.*/
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE) /*MIME타입 지정,(APPLICATION_OCTET_STREAM_VALUE)*/
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName, HttpServletRequest request){
		//유저의 디바이스 정보와 브라우저의 정보를 알려주는 "user-agent"
		/*String realuploadpath = request.getSession().getServletContext().getRealPath(path); //상대 경로 알려주는것
*/		
		/*log.info("download file :" + fileName);*/
		
		Resource resource = new FileSystemResource(realuploadpath + "\\" + fileName);
		
		/*log.info("resource : 경로가 다음과 같다 : " + resource);*/
		
		if(resource.exists() == false) {
			
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			
		}
		
		/*log.info("resource : " + resource);*/
		
		/*파일이름을 받아와서*/
		String resourceName = resource.getFilename();
		
		//remove uuid : uuid 부분을 잘라낸 상태의 파일 이름으로 저장 하기 위함
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			String downloadName = null;
			
			if(userAgent.contains("Trident")) {
				
				/*log.info("IE browser");*/
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+"," ");
				
			}else if(userAgent.contains("Edge")) {
				
				/*log.info("Edge browser");*/
				
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
				
				/*log.info("Edge name : " + downloadName);*/
				
			}else {
				
				/*log.info("Chrome browser");*/
				
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			/*log.info("downloadName : " + downloadName);*/
			
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
			/*다운로드시 저장되는 이름은 content-disposition을 이용 지정*/
			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, HttpServletRequest request){
		
		/*String realuploadpath = request.getSession().getServletContext().getRealPath(path);*/
		
		/*log.info("deleteFile : " + fileName );*/
		
		File file;
		
		try {
			
			file = new File(realuploadpath + "/" +URLDecoder.decode(fileName,"UTF-8"));
			
			file.delete();
			
			if("image".equals(type)) {
				
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				/*log.info("largeFileName : " + largeFileName);*/
				
				file = new File(largeFileName);
				
				file.delete();
			}
			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
}
