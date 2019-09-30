package com.simple.project3;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

	@Autowired
	private HomeDAO dao;
	
	public int checkUserID(String userID) {
		return dao.checkUserID(userID);
	}

	public int setFile(HomeVO fileVO) {
		return dao.setFile(fileVO);
	}

	public int getFileCnt(HomeVO fileVO) {
		return dao.getFileCnt(fileVO);
	}
	
	public List<HomeVO> getFileList(HomeVO fileVO) {
		return dao.getFileList(fileVO);
	}

	public HomeVO getFile(HomeVO fileVO) {
		return dao.getFile(fileVO);
	}

	public void setFileDown(HomeVO fileVO) {
		dao.setFileDown(fileVO);
	}

	public List<HomeVO> getTagList(String string) {
		return dao.getTagList(string);
	}

	public int setMember(HomeVO hvo) {
		return dao.setMember(hvo);
	}

	public HomeVO getLogin(HomeVO hvo) {
		return dao.getLogin(hvo);
	}


}
