package com.simple.project3;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.simple.project3.SHA256;
import com.simple.project3.FileManager;

@Component
@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	@Autowired
	private FileManager fileManager;
	
	// index
	@RequestMapping(value = "/index.p3", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv) {
		return mv;
	}
	// image 페이지
	@RequestMapping(value = "/image.p3", method = RequestMethod.GET)
	public ModelAndView image(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, HomeVO fileVO) {
		fileVO.setFileType("image");
		fileVO.setTotalCnt(service.getFileCnt(fileVO));
		fileVO.setSizePerPage(12);

		List<HomeVO> imageList = service.getFileList(fileVO);
		List<HomeVO> tagList = service.getTagList("image");
		
		String pagebar = "<ul style=\"text-align: center; list-style: none;\">";
		fileVO.setBlockSize(5);
		pagebar += MyUtil.searchPageBar(request, fileVO);
		pagebar += "</ul>";
	    
		mv.addObject("pagebar",pagebar); 
		
		mv.addObject("tagList",tagList);
		mv.addObject("imageList",imageList);
		return mv;
	}
	// 상세페이지 (get,post)
	@RequestMapping(value = "/fileDetail.p3")
	public ModelAndView login2_fileDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, HomeVO fileVO) {
		
		if(request.getMethod().equalsIgnoreCase("POST")) {
			fileVO = service.getFile(fileVO);
			HttpSession session = request.getSession();
			HomeVO loginuser = (HomeVO)session.getAttribute("loginuser");
			fileVO.setMemberSeq(loginuser.getMemberSeq());
			
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+fileVO.getFileType();

			if(!fileManager.doFileDownload(fileVO.getFileNewName() , fileVO.getFileOrgName(), path, response)) {
				response.setContentType("text/html; charset=UTF-8");
				mv.addObject("msg",">>다운로드 실패<<");
			} else {
				service.setFileDown(fileVO);
			}
		}
		
		mv.addObject("fileVO",service.getFile(fileVO));
		return mv;
	}
	// music 페이지
	@RequestMapping(value = "/music.p3", method = RequestMethod.GET)
	public ModelAndView music(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, HomeVO fileVO) {
		fileVO.setFileType("music");
		fileVO.setTotalCnt(service.getFileCnt(fileVO));
		fileVO.setSizePerPage(10);

		List<HomeVO> musicList = service.getFileList(fileVO);
		List<HomeVO> tagList = service.getTagList("music");
		
		String pagebar = "<ul style=\"text-align: center; list-style: none;\">";
		fileVO.setBlockSize(5);
		pagebar += MyUtil.searchPageBar(request, fileVO);
		pagebar += "</ul>";
		
	    mv.addObject("pagebar",pagebar);  
		
		mv.addObject("tagList",tagList);
		mv.addObject("musicList",musicList);

		return mv;
	}
	// upload 페이지
	@RequestMapping(value = "/upload.p3", method = RequestMethod.GET)
	public ModelAndView login_upload(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		return mv;
	}
	// 파일업로드 
	@RequestMapping(value = "/sharing.p3", method={RequestMethod.POST})
	public ModelAndView login_sharing(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, MultipartHttpServletRequest mrequest, HomeVO fileVO) {
		HttpSession session = mrequest.getSession();
		MultipartFile attach = fileVO.getAttach();
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator;
		path +=  fileVO.getFileType();
		
		try {
			byte[] bytes = attach.getBytes();
			String fileNewName = fileManager.doFileUpload(bytes,attach.getOriginalFilename(),path);
			fileVO.setFileNewName(fileNewName);
			fileVO.setFileOrgName(attach.getOriginalFilename());
			fileVO.setFileSize(String.valueOf(attach.getSize()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String info = fileVO.getFileInformation()+" ";
		String tag = "";
		int sharp = -1;
		int space = -1;
		
		while ((sharp = info.indexOf("#", sharp + 1)) >= 0) {
			space = info.indexOf(" ", sharp+1);
			tag += info.substring(sharp,space)+",";
	    }
		
		if(tag!="")
			fileVO.setFileTag(tag.substring(0,tag.length()-1));
		else 
			fileVO.setFileTag("");
			
		// 로그인안해서 임의로 지정
		HomeVO loginuser = (HomeVO)session.getAttribute("loginuser");
		fileVO.setMemberSeq(loginuser.getMemberSeq());
		
		String msg = ">>실패했습니다<<";
		String loc = "javascript:history.back()";
		if(service.setFile(fileVO)==1) { // insert 성공시
			msg = ">>파일을 등록했습니다<<";
			loc = mrequest.getContextPath() + "/index.p3";
		} 
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("msg");
		return mv;
	}
	// 로그인 (get,post)
	@RequestMapping(value = "/login.p3")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, HomeVO hvo) {
		String mehtod = request.getMethod();
		HttpSession session = request.getSession();
		HomeVO loginuser = (HomeVO) session.getAttribute("loginuser");
		String loc = "javascript:history.back()";
		String msg = "아이디 또는 비밀번호가 틀립니다";
		
		if("get".equalsIgnoreCase(mehtod) && null==loginuser) {
			return mv;
		} else if("get".equalsIgnoreCase(mehtod) && null!=loginuser) {
			msg = ">>이미 로그인 되어있습니다<<";
			mv.setViewName("msg");
		} else {
			hvo.setPwd(SHA256.encrypt(hvo.getPwd()));
			loginuser = service.getLogin(hvo);
			
			if(null!=loginuser) {
				if(session.getAttribute("backUrl")!=null)
					loc = (String) session.getAttribute("backUrl");
				else
					loc = request.getContextPath() + "/index.p3";
				session.setAttribute("loginuser", loginuser);
				msg = ">>로그인 되었습니다<<";
			}
			mv.setViewName("msg");
		}
		mv.addObject("loc",loc);
		mv.addObject("msg",msg);
		return mv;
	}
	// 로그아웃
	@RequestMapping(value = "/logout.p3") 
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginuser");
		mv.addObject("msg",">>로그아웃 되었습니다<<");
		mv.addObject("loc",request.getContextPath() + "/index.p3");
		mv.setViewName("msg");
		return mv;
	}
	// 회원가입 (get,post)
	@RequestMapping(value = "/join.p3")
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, HomeVO hvo) {
		if(request.getMethod().equalsIgnoreCase("POST")) {
			String pwd = SHA256.encrypt(request.getParameter("pwd"));
			hvo.setPwd(pwd);
			
			String msg = ">>실패했습니다<<";
			String loc = "javascript:history.back()";
			if(service.setMember(hvo)==1) { // insert 성공시
				msg = ">>가입되었습니다<<";
				loc = request.getContextPath() + "/index.p3";
			} 
			
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("msg");
		}
		
		return mv;
	}
	// 아이디 중복검사
	@RequestMapping(value = "/idCheck.p3", produces = "text/plain;charset=UTF-8") 
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		JSONObject jsonObj = new JSONObject();
		String userID = request.getParameter("userID");
		if(service.checkUserID(userID)>=1)
			jsonObj.put("msg", "사용불가 아이디");
		else
			jsonObj.put("msg", "OK");

		return jsonObj.toString();
	}
	
}
