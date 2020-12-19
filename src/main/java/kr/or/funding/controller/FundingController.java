package kr.or.funding.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.funding.command.RewardCommand;
import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.RewardVO;
import kr.or.funding.service.FundingService;
import kr.or.funding.service.RewardService;

@Controller
@RequestMapping(value="/funding")
public class FundingController {
	
	@Autowired
	private FundingService fundingService;
	@Autowired
	private RewardService rewardService;
	private RewardItemVO rItem;
	private RewardVO reward;
	
//	@RequestMapping(value="/detail", method=RequestMethod.GET)
//	public void detail() {}
	
	@RequestMapping(value="/agreements", method=RequestMethod.GET)
	public void agreements() {}
	
//	@RequestMapping(value="/registForm", method=RequestMethod.GET)
//	public void regist() {}
	
	
	
	@RequestMapping("/list")
	public String list(Model model, SearchCriteria cri) throws SQLException {
		String url = "funding/list";
		List<FundingVO> fundingList = fundingService.getFundingList(cri);
		model.addAttribute("fundingList",fundingList);
		model.addAttribute("cri",cri);
		System.out.println(fundingList);
		
		return url;
	}
	
	@RequestMapping("/items")
	@ResponseBody
	public ResponseEntity<List<FundingVO>> items(Model model, SearchCriteria cri) throws SQLException {
		
		ResponseEntity<List<FundingVO>> entity = null;
		
		List<FundingVO> fundingList = fundingService.getFundingList(cri);
		
		int totalCnt = fundingService.getFundingCnt(cri);
		
		if((cri.getPage() - 1)* cri.getPerPageNum() > totalCnt) {
			return entity= new ResponseEntity<List<FundingVO>>(HttpStatus.OK);
		}else {
			return entity= new ResponseEntity<List<FundingVO>>(fundingList,HttpStatus.OK);
		}
		
		
		
		
	}
	
	
	
	
	@RequestMapping("/detail")
	public String detail(int fno, Model model) throws SQLException{
		String url = "funding/detail";
		FundingVO funding = fundingService.getFunding(fno);
		List<RewardVO> list = rewardService.getRewardList(fno);
		funding.setRewardList(list);
		model.addAttribute("funding",funding);
		return url;
	}
	
	@RequestMapping("/registForm")
	public void registForm(HttpSession session, Model model) throws SQLException {
	}
	
	@RequestMapping("/regist")
	public void regist(FundingVO funding, HttpServletResponse response, RewardCommand rewardReq) throws Exception{
		int fno = fundingService.write(funding);
		int itemCnt = 0;
		int itemCntChk = 0;
		for(int i=0;i<rewardReq.getItemcnt().length;i++) {
			reward = new RewardVO();
			reward.setFno(fno);
			reward.setItemcnt(rewardReq.getItemcnt()[i]);
			reward.setRcount(rewardReq.getRcount()[i]);
			reward.setRprice(rewardReq.getRprice()[i]);
			int rno = rewardService.insertReward(reward);
			itemCnt += rewardReq.getItemcnt()[i];
			for(int j=itemCntChk;j<itemCnt;j++) {
				rItem = new RewardItemVO();
				rItem.setRno(rno);
				rItem.setOptions(rewardReq.getOptions()[j]);
				rItem.setRitem(rewardReq.getRitem()[j]);
				rewardService.insertRewardItem(rItem);
			}
			itemCntChk = itemCnt;
		}
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('등록이 정상적으로 완료 되었습니다')");
		out.println("location.href='list.do'");
		out.println("</script>");
		
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(int fno, Model model) throws SQLException {
		model.addAttribute("funding",fundingService.getFunding(fno));
		return "funding/modify";
	}
	
	@RequestMapping("/modify")
	public void modify(FundingVO funding, HttpServletResponse response) throws Exception {
		fundingService.modify(funding);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('수정이 정상적으로 완료 되었습니다')");
		out.println("location.href='list.do'");
		out.println("</script>");
	}
	
	@RequestMapping("/remove")
	public void remove(int fno, HttpServletResponse response) throws Exception {
		fundingService.remove(fno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('삭제 되었습니다')");
		out.println("location.href='list.do'");
		out.println("</script>");
	}
	
	@RequestMapping(value="picture", method=RequestMethod.POST)
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		String result="";
		HttpStatus status = null;
		
		if((result=savePicture(oldPicture,multi))==null) {
			status = HttpStatus.BAD_REQUEST;
		}else {
			status = HttpStatus.OK;
		}
		entity = new ResponseEntity<>(result,status);
		return entity;
	}
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception{
		String fileName= null;
		
		//파일 유무 확인
		if(!(multi==null || multi.isEmpty() || multi.getSize() > 1024*1024*5)) {
			
			//파일 저장 폴더 설정
			String uploadPath = "c:/dm/test";
			fileName = UUID.randomUUID().toString().replace("-","")+".jpg";
			File storeFile = new File(uploadPath,fileName);
			
			storeFile.mkdirs();
			
			//local HDD에 저장
			multi.transferTo(storeFile);
			
			if(!oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath,oldPicture);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
}
