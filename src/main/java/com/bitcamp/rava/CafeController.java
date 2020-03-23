package com.bitcamp.rava;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.dto.CafeDTO;
import com.bitcamp.dto.CafeFileDTO;
import com.bitcamp.dto.CafeMakeDTO;
import com.bitcamp.dto.CafeNutrtionDTO;
import com.bitcamp.service.CafeService;

@Controller
public class CafeController {
	
	
	@Resource(name="CafeService")
	private CafeService cafeservice;

	@RequestMapping(value = "/cafe")
	public String home(@RequestParam(defaultValue="drink") String search, Locale locale, Model model) {
	
		/*List<CafeDTO> list = cafeservice.cafelist(search);
		
		model.addAttribute("list", list);*/
		return "cafe/cafe";
	}
	
	//cafenutrition 정보페이지
	@RequestMapping(value = "/cafe_nutrtion")
	public String cafenutrtion(
			@RequestParam(required=false, defaultValue="1") int currpage
			, @RequestParam(required=false, defaultValue="") String search
			, @RequestParam(required=false, defaultValue="") String searchtxt
			, @RequestParam(required=false, defaultValue="0") int tempmode
			, Model model) {
		
		System.out.println(searchtxt);
		
		Pattern da=Pattern.compile("(^[가-힣]*$)");
		if(search=="MEAL_NAME"||"MEAL_NAME".equals(search)) {
			Matcher m=da.matcher(searchtxt);
			if(!m.find()) {
				System.out.println(true);
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				System.out.println(false);
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		Pattern d=Pattern.compile("(^[0-9]*$)");
		if(search=="MEAL_KCAL"||"MEAL_KCAL".equals(search)) {
			Matcher m=d.matcher(searchtxt);
			if(!m.find()) {
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		
		int totalCount=cafeservice.totalCount(search, searchtxt);
		int pageSize=10;
		int blockSize=5;
		
		CafeMakeDTO page=new CafeMakeDTO(currpage, totalCount, pageSize, blockSize);
		
		List<CafeNutrtionDTO> nutrtionlist = cafeservice.selectNutritionList(search, searchtxt, page.getStartRow(), pageSize);
		
		model.addAttribute("nutrtionlist", nutrtionlist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		model.addAttribute("tempmode", tempmode);
		
		return "cafe/cafe_nutrtion";
	}
	//cafeadmin 페이지 이동
		@RequestMapping(value = "/cafeadmin", method = RequestMethod.GET)
		public String cafeadmin(Locale locale, Model model) {
		
			return "admin/cafeadmin";
		}
	//cafeadmin 등록페이지 이동
	@RequestMapping(value = "/cafeadmininsert", method = RequestMethod.GET)
	public String cafeadmininsert(Locale locale, Model model) {
	
		return "admin/cafeadmininsert";
	}
		
	//파일업로드
	@RequestMapping(value = "/cafeinsertresult")
	public String uploadFile(CafeDTO cafedto, CafeFileDTO cafefiledto, MultipartHttpServletRequest mtf) throws Exception {
		// 파일 태그
		String fileTag = "file1";
	    	// 업로드 파일이 저장될 경로
		String filePath = "C:\\cafeimg\\";
		// 파일 이름	
		MultipartFile file = mtf.getFile(fileTag);
		String originfileName = file.getOriginalFilename();
		// 파일 전송
		try {
		    file.transferTo(new File(filePath + originfileName));
		} catch(Exception e) {
		    System.out.println("업로드 오류");
		}
		
		// 파일 저장할때 이름 변경
		String systemFileName = ""; //저장되는 이름 가져와서 넣기
		
		cafeservice.cafeInsert(cafedto);
		cafefiledto.setCafeno(cafedto.getCafeno());
		cafefiledto.setFileoriginalname(originfileName);
		cafefiledto.setFilesystemname(systemFileName);
		cafefiledto.setCafeFileurl("C:\\cafeimg\\"+systemFileName);
		
		cafeservice.cafefileInsert(cafefiledto);
		
		return "admin/cafeadmin";
	}
	//파일다운로드
	@RequestMapping("/downloadFile")
	   public void downloadFile(CafeFileDTO cafefiledto, HttpServletResponse response) throws Exception {
	      // http://localhost:8000/hellopt/downloadFile?mSysImg=ff0ca98a-bfa0-4094-abae-8793a628c55d.jpg
	      String mOriImg = cafefiledto.getFileoriginalname();
	      String mSysImg = cafefiledto.getFilesystemname();
	      System.out.println("다운로드s:"+mSysImg);
	      
	      FileInputStream fileInputStream = null;
	      ServletOutputStream servletOutputStream = null;
	      //byte[] fileByte = FileUtils.readFileToByteArray(new File("C:\\hellopt_file\\"+mSysImg));
	      
	      //파일 응답 ---------
	      response.setContentType("application/octet-stream"); //클릭했을 때 미디어 타입의 실행/다운 하게 해주는...
	      //response.setContentLength(fileByte.length);  //파일 길이 뽑는거 
	      response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(mSysImg,"UTF-8")+"\";"); //해당 파일명 인코딩
	      response.setHeader("Content-Transfer-Encoding", "binary"); //파일 인코딩 형식 = binary
	      //response.getOutputStream().write(fileByte);
	      
	      //서버에 있는 파일 읽기-----------
	      fileInputStream = new FileInputStream(new File("C:\\cafeimg\\"+mSysImg)); // 내 하드의 이미지를 읽어 달라고 요청
	      servletOutputStream = response.getOutputStream();

	      byte b[] = new byte[1024];
	      int data = 0;

	      while ((data = (fileInputStream.read(b, 0, b.length))) != -1) { //date(길이,용랑으로 확인)가 있으면
	         servletOutputStream.write(b, 0, data);                   //내보내 달라
	      }
	      
	      servletOutputStream.flush();
	      
	      //닫기----------
	      if (servletOutputStream != null) {
	         try {
	            servletOutputStream.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      if (fileInputStream != null) {
	         try {
	            fileInputStream.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	} 
	      
}
