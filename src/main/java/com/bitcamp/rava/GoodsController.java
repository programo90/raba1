package com.bitcamp.rava;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.dto.BoardAttachVO;
import com.bitcamp.dto.CartDTO;
import com.bitcamp.dto.GoodsDTO;
import com.bitcamp.dto.GoodsSizeDTO;
import com.bitcamp.service.GoodsService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GoodsController {

	private String path="\\resources\\img\\uploadimg";
	
	@Autowired
	private GoodsService goodsservice;
	
	/* 파일 삭제 처리 */
	private void deleteFiles(List<BoardAttachVO> attachList ,String realuploadpath) {
		
		if(attachList == null || attachList.size() == 0) {
			
			return;
		}
		
		log.info("delete attach files..........");
		log.info(attachList);
		
		attachList.forEach(attach-> {
		
			try {Path file = Paths.get(realuploadpath+"\\"+ attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
			
			Files.deleteIfExists(file);
			
			if(Files.probeContentType(file).startsWith("image")) {
				
				Path thumbNail = Paths.get(realuploadpath+"\\"+ attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.delete(thumbNail);
			}
			
			}catch(Exception e) {
				
				log.error("delete file error" + e.getMessage());
			}//end catch
		});// end foreach
	
		
	}
	
	
	/* 사용자  GOODS list PAGE*/
	@RequestMapping(value="/goods_list")
	public String goodslist(Model model) {
		
		List<BoardAttachVO> img_list = new ArrayList<BoardAttachVO>();
		
		List<GoodsDTO> list = goodsservice.goodsnamelist();
		
		for(int i = 0; i < list.size(); i++) {
			
			BoardAttachVO vo = goodsservice.getimg(list.get(i).getP_no());
			
			
				img_list.add(vo);
				
				
			}
		
		model.addAttribute("list", list);
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
			
			dto.getAttachList().forEach(attach -> log.info(attach));
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
		
		log.info("삭제를 시작");
		
		
		/*boolean 처리롤 인해 오류의 여지가 있음*/
		if(goodsservice.deletegoods(p_no)) {
			
			deleteFiles(attachList,realuploadpath); //폴더에서 이미지 파일 삭제 
			
		}
		
		log.info("삭제 끝");
		
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
	public String goodsadmin(Model model) {
	
		List<GoodsDTO> list = goodsservice.goodslist(); 
		
		
		
		model.addAttribute("list", list);
		
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
