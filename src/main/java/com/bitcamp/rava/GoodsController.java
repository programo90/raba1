package com.bitcamp.rava;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.AdminMakepageDTO;
import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.GoodsSizeDTO;
import com.bitcamp.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
/*@Log4j*/
public class GoodsController {

	private String path="\\resources\\img\\uploadimg";
	
	@Autowired
	private GoodsService goodsservice;
	
	/* 파일 삭제 처리 */
	private void deleteFiles(List<BoardAttachVO> attachList ,String realuploadpath) {
		
		if(attachList == null || attachList.size() == 0) {
			
			return;
		}
		
		/*log.info("delete attach files..........");
		log.info(attachList);*/
		
		attachList.forEach(attach-> {
		
			try {Path file = Paths.get(realuploadpath+"\\"+ attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
			
			Files.deleteIfExists(file);
			
			if(Files.probeContentType(file).startsWith("image")) {
				
				Path thumbNail = Paths.get(realuploadpath+"\\"+ attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.delete(thumbNail);
			}
			
			}catch(Exception e) {
				
				/*log.error("delete file error" + e.getMessage());*/
			}//end catch
		});// end foreach
	
		
	}
	
	
	/* 사용자  GOODS list PAGE*/
	@RequestMapping(value="/goods_list")
	public String goodslist(Model model) {
		
		List<BoardAttachVO> img_list = new ArrayList<BoardAttachVO>();
		
		List<GoodsDTO> list = goodsservice.goodsnamelist();
		
		/* 상품 상태 확인후 리스트 출력 */
		
		List<GoodsDTO> list_state = goodsservice.checkstate(list);
		
		for(int j = 0; j < list_state.size(); j++) {
			
			BoardAttachVO vo = goodsservice.getimg(list_state.get(j).getP_no());
			
				img_list.add(vo);
			}
		
		model.addAttribute("list_state", list_state);
		model.addAttribute("img_list",img_list);
		
		return "goods/goods_list";
	}
	
	/* 사용자 Goods detail page */
	@RequestMapping(value="/goods_detail/{p_name}")
	public String goodsdetail(@PathVariable String p_name, Model model) {
		
		List<GoodsDTO> list = goodsservice.goodsnamedetail(p_name);
		
		model.addAttribute("list", list);
		
		return "goods/goods_detail";
	}
	
	
	@RequestMapping(value="/goods_insert")
	public String insertgoods() {
		
		return "admin/goods_insert";
	}
	
	@RequestMapping(value="/ins_goods_result")
	public String insertgoods_result(GoodsDTO dto,GoodsSizeDTO sizedto) {
		
		/*log.info(dto);
		
		log.info(sizedto);*/
		
		
		/*log.info("register :" + dto);*/
		
		if(dto.getAttachList() !=null) {
			
			/*dto.getAttachList().forEach(attach -> log.info(attach));*/
		}
		
		goodsservice.insertvalue(dto, sizedto);
		
		return "redirect:/admin_goods_list";
	}

	/* goods delete goods */
	@RequestMapping(value="/deletegoods/{p_no}")
	public String goods_delete(@PathVariable int p_no, HttpServletRequest request) {
		
		String realuploadpath = request.getSession().getServletContext().getRealPath(path);
		
		List<BoardAttachVO> attachList = goodsservice.getAttachList(p_no);
		
		/* pname을 통한 pno을 갯수가 1나일때 삭제 되면 모두 삭제 그러지 않으면 그 해당 p_no만 삭제  */
		
		/*log.info("삭제를 시작");*/
		
		
		/*boolean 처리롤 인해 오류의 여지가 있음*/
		if(goodsservice.deletegoods(p_no)) {
			
			deleteFiles(attachList,realuploadpath); //폴더에서 이미지 파일 삭제 
			
		}
		
		/*log.info("삭제 끝");*/
		
		return "redirect:/admin_goods_list";
	}
	
	@RequestMapping(value="/modifygoods/{p_no}")
	public String goods_modify(@PathVariable int p_no, Model model) {
	
		GoodsDTO dto = goodsservice.detailgoods(p_no);
		
		model.addAttribute("dto",dto);
		
		return "admin/goods_modify";
	}

	@RequestMapping(value="/modify_goods_result")
	public String modify_result(GoodsDTO dto,GoodsSizeDTO sizedto) {
		
		/*log.info(dto);
		
		log.info(sizedto);*/
		
		int result = goodsservice.modifygoods(dto,sizedto);
		
		return "redirect:/admin_goods_list";
	}
	
	/* made by taekwan */
	@RequestMapping(value="/admin_goods_list")
	public String goodsadmin(@RequestParam(required=false,defaultValue="1") int currPage,@RequestParam(required=false,defaultValue="") String search,@RequestParam(required=false,defaultValue="") String searchtxt,Model model) {
	
		Pattern d=Pattern.compile("(^[0-9]*$)");
		if(search=="oderno"||"oderno".equals(search)) {
			Matcher m=d.matcher(searchtxt);
			if(!m.find()) {
				searchtxt="";
				model.addAttribute("searchtxt", "");
			}else {
				model.addAttribute("searchtxt", searchtxt);
			}
		}
		
		int totalCount = goodsservice.goodstotalCount(search,searchtxt);
		
		int pageSize=10;
		int blockSize=5;
		
		AdminMakepageDTO page=new AdminMakepageDTO(currPage, totalCount, pageSize, blockSize);
		
		List<GoodsDTO> list = goodsservice.goodslist(search,searchtxt,page.getStartRow(),page.getEndRow()); 
		
		List<BoardAttachVO> img_list = new ArrayList<>();
		
		for(int i =0; i < list.size(); i++) {
			
			String p_name = list.get(i).getP_name(); //pname으로 pno를 추출해서
			
			BoardAttachVO img = goodsservice.getImgpno(p_name);
			
			img_list.add(img);
			
		}
		
		model.addAttribute("img_list", img_list);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);
		return "admin/admin_goods_list";
	}
	
	/* 사진 첨부 */
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int pno){
		
		/*log.info("getAttachList : " + pno);*/
		
		return new ResponseEntity<>(goodsservice.getAttachList(pno), HttpStatus.OK);
	}
	
	
	
}
