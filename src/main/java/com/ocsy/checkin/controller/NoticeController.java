package com.ocsy.checkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ocsy.checkin.dto.NoticeBoard;
import com.ocsy.checkin.service.NoticeService;
import com.ocsy.checkin.util.Paging;

@Controller
@RequestMapping(value = "notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(params="method=boardmain",method= {RequestMethod.GET, RequestMethod.POST})
	public String boardmain() {
		return "board/boardmain2";
	}
	//1. 리뷰 리스트
	@RequestMapping(params="method=noticeList",method= {RequestMethod.GET, RequestMethod.POST})
	public String noticeList(String pageNum , Model model) {
		model.addAttribute("noticeList",noticeService.listNotice(pageNum));
		model.addAttribute("paging", new Paging(noticeService.countNotice(), pageNum, 7, 7));
		return "notice/noticeList";
	}
	//2. 글작성 db 처리
	@RequestMapping(params = "method=insertNotice",  method= RequestMethod.POST)
	public String insertNotice(MultipartHttpServletRequest mRequest , NoticeBoard notice, Model model, String pageNum ) {
		model.addAttribute("insertNotice", noticeService.insertNotice(mRequest, notice));
		return "redirect:notice.do?method=noticeList";
	}
	//3. 글작성 view 
	@RequestMapping(params = "method=insertNoticeForm" , method={RequestMethod.GET, RequestMethod.POST})
	public String insertForm() {
		return "notice/insertNoticeForm";
	}
	//4. 글상세보기
	@RequestMapping(params = "method=detailNotice",method=RequestMethod.GET)
	public String detailNotice(int nnum , Model model) {
		model.addAttribute("noticeDto" , noticeService.detailNotice(nnum));
		return "notice/detailNotice";
	}
	//5. 수정하기 view
	@RequestMapping(params = "method=noticeModifyForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeModifyForm(int nnum , Model model) {
		model.addAttribute("noticeDto", noticeService.modifylView(nnum));
		return "notice/modifyForm";
	}
	//6. 수정하기 db 처리
	@RequestMapping(params = "method=noticeModify", method = RequestMethod.POST)
	public String modifyNotice(MultipartHttpServletRequest mRequest , NoticeBoard notice, Model model, String pageNum) {
		model.addAttribute("modifyNotice",noticeService.modifyNotice(mRequest, notice));
		return "redirect:notice.do?method=noticeList&pageNum="+pageNum;
	}
	//7. 공지글 삭제 
	@RequestMapping(params = "method=deleteNotice", method = RequestMethod.GET)
	public String delete(int nnum , Model model) {
		model.addAttribute("deleteResult", noticeService.deleteNotice(nnum));
		return "forward:notice.do?method=noticeList";
	}
	
}
