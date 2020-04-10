package com.bitcamp.rava;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	
	//private String path="\\resources\\img\\cafe";
	private String path="/usr/local/apache-tomcat-9.0.33/webapps/raba1/resources/img/cafe";
	
	
	@RequestMapping(value = "/cafe")
//	public String home(@RequestParam(defaultValue="drink") String search, Locale locale, Model model) {
	public String home( Locale locale, Model model) {	
	
		List<CafeDTO> list = cafeservice.selectcafelist();
		//List<String> catelist = new List<String>();
		List<String> catelist = new ArrayList<>(); 
		catelist.add("콜드 브루 커피");
		catelist.add("브루드 커피");
		catelist.add("에스프레소");
		catelist.add("프라푸치노");
		catelist.add("블렌디드");
		catelist.add("티");
		catelist.add("기타 제조 음료");
		
		model.addAttribute("list", list);
		model.addAttribute("catelist", catelist);
		
		return "cafe/cafe";
	}

	
	@RequestMapping(value = "/cafebakery")
	public String cafebakery( Locale locale, Model model) {	
	
		List<CafeDTO> list = cafeservice.selectcafelist();
		List<String> bakerylist = new ArrayList<>(); 
		bakerylist.add("베이커리");
		bakerylist.add("케이크");
		bakerylist.add("샌드위치&샐러드");
		bakerylist.add("따뜻한 푸드");
		bakerylist.add("아이스크림");
		
		model.addAttribute("list", list);
		model.addAttribute("catelist", bakerylist);
//		System.out.println("catelist"+bakerylist);
		
		return "cafe/cafebakery";
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
	@RequestMapping(value = "/cafeadmin")
	public String cafeadmin(
			@RequestParam(required=false, defaultValue="1") int currpage
			, @RequestParam(required=false, defaultValue="") String search
			, @RequestParam(required=false, defaultValue="") String searchtxt
			, Model model) {
		System.out.println("search"+search);
		System.out.println("searchtxt!!!!!!!!"+searchtxt);
		Pattern p=Pattern.compile("(^[가-힣]*$)");
		if(search=="menu"||"menu".equals(search)) {
			Matcher m=p.matcher(searchtxt);
			if(!m.find()) {
				System.out.println(true);
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				System.out.println(false);
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		Pattern pa=Pattern.compile("(^[a-zA-Z]*$)");
		if(search=="cafeproduct"||"cafeproduct".equals(search)) {
			Matcher m=pa.matcher(searchtxt);
			if(!m.find()) {
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		Pattern pat=Pattern.compile("(^[가-힣]*$)");
		if(search=="cafecategory"||"cafecategory".equals(search)) {
			Matcher m=pat.matcher(searchtxt);
			if(!m.find()) {
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		
		int totalCount=cafeservice.admincafeCount(search, searchtxt);	
		int pageSize=10;
		int blockSize=5;
		
		CafeMakeDTO page=new CafeMakeDTO(currpage, totalCount, pageSize, blockSize);
		
		List<CafeDTO> adminlist = cafeservice.selectAdminList(search, searchtxt, page.getStartRow(), pageSize);
		model.addAttribute("adminlist", adminlist);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		
		return "admin/cafeadmin";
	}
	//cafeadmin 등록 페이지 이동
	@RequestMapping(value = "/cafeadmininsert", method = RequestMethod.GET)
	public String cafeadmininsert(Locale locale, Model model) {
	
		return "admin/cafeadmininsert";
	}
		
	//파일업로드
	@RequestMapping(value = "/cafeinsertresult")
	public String uploadFile(HttpServletRequest request, CafeDTO cafedto, CafeFileDTO cafefiledto, MultipartHttpServletRequest mtf) throws Exception {
		// 파일 태그
		String fileTag = "file1";
	    	// 업로드 파일이 저장될 경로
		//String filePath = "C:\\cafeimg\\";
		//String filePath = request.getServletContext().getRealPath(path);
		String filePath = path;
		System.out.println(filePath);
		
		// 파일 이름	
		MultipartFile file = mtf.getFile(fileTag);
		String originfileName = file.getOriginalFilename();
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date()); 
		
		int index = originfileName.lastIndexOf(".");
		String fom = originfileName.substring(index, originfileName.length());

		// 파일 전송
		try {
		    file.transferTo(new File(filePath + now+fom));
		} catch(Exception e) {
		    System.out.println("업로드 오류");
		}
		
		// 파일 저장할때 이름 변경
		String systemFileName = now+fom;
				//저장되는 이름 가져와서 넣기
		
		cafeservice.cafeInsert(cafedto);
		cafefiledto.setCafeno(cafedto.getCafeno());
		cafefiledto.setFileoriginalname(originfileName);
		cafefiledto.setFilesystemname(systemFileName);
		//cafefiledto.setCafeFileurl("C:\\cafeimg\\"+systemFileName);
		cafefiledto.setCafeFileurl(filePath+systemFileName);
		
		cafeservice.cafefileInsert(cafefiledto);
		
		return "redirect:/cafeadmin";
	}
	//파일다운로드
	   @RequestMapping("/downloadFile/{cafeno}")
	      public void downloadFile(@PathVariable(value="cafeno") int cafeno, HttpServletResponse response, HttpServletRequest request) throws Exception {
	         // http://localhost:8000/hellopt/downloadFile?mSysImg=ff0ca98a-bfa0-4094-abae-8793a628c55d.jpg
//	         String mOriImg = cafefiledto.getFileoriginalname();
//	         String mSysImg = "20200324173516656.jpg";
//	         FileInputStream fileInputStream = null;
//	         OutputStream OutputStream = null;
	         
		    CafeFileDTO cafefiledto = cafeservice.getcafefile(cafeno);
		    System.out.println("cafeno: "+cafeno);
	        String mSysImg = cafefiledto.getFilesystemname();
	        System.out.println("다운로드s:"+mSysImg);
	        String uploadpath=request.getSession().getServletContext().getRealPath(path); //경로 알려주는것
	        //실제 경로+파일
	        //File file = new File("C:/cafeimg/"+mSysImg);
	        File file = new File(uploadpath+mSysImg);
	         //파일 응답 ---------
	         response.setContentType("application/octet-stream"); //클릭했을 때 미디어 타입의 실행/다운 하게 해주는...
	         response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(mSysImg,"UTF-8")+"\";"); //해당 파일명 인코딩  //사람이 받을때(보여줄때) 이미지 파일 경로
	         
	         response.setContentLength((int)file.length());
	         
	         try ( FileInputStream fis = new FileInputStream(file);
	            OutputStream out = response.getOutputStream(); ){
	         
	         FileCopyUtils.copy(fis, out);
	         out.flush();//버퍼에 집어넣은 이미지를 밖으로 내보낸다
	         }
	   } 
	//파일다운로드
	/*@RequestMapping("/downloadFile")
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
	} */
	@RequestMapping("/modify/{cafemodifyno}")
	public String modify(@PathVariable int cafemodifyno, Model model) {
		CafeDTO dto = cafeservice.modifyData(cafemodifyno);
		model.addAttribute("dto", dto);
		System.out.println(dto.getCafeproduct());
		
		return "admin/cafeadminmodify";
	}
	@RequestMapping("/cafemodifyresult")  
	public String modifyresult(CafeDTO cafedto) {
		System.out.println(cafedto);
		
		int result = cafeservice.modifyResult(cafedto);
		
		System.out.println("수정완료controller");
		return "redirect:/cafeadmin";
	}
	@RequestMapping("/delete/{cafeno}")
	public String delete(@PathVariable int cafeno, Model model) {
		int filedto = cafeservice.filedeleteData(cafeno);
		model.addAttribute("filedto",filedto);
		int dto = cafeservice.deleteData(cafeno);
		model.addAttribute("dto", dto);
		
		return "redirect:/cafeadmin";
	}
	
	@RequestMapping("/cafedetail/{cafeno}")
	public String cafedetail(@PathVariable int cafeno, Model model) {
		CafeDTO cafedto = cafeservice.cafedetailData(cafeno);
		model.addAttribute("cafedto", cafedto);
		CafeNutrtionDTO nutridto=cafeservice.detailnutriData(cafeno);
		model.addAttribute("nutridto", nutridto);
		return "cafe/cafedetail";
	}
	@RequestMapping("/story")
	public String story(Locale locale, Model model) {
		
		return "story/story";
	}
}
