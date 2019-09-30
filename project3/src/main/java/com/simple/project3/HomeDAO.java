package com.simple.project3;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSessionTemplate sql; //HomeMapper

	public int checkUserID(String userID) {
		int idCnt = sql.selectOne("HomeMapper.checkUserID",userID);
		return idCnt;
	}

	public int setFile(HomeVO fileVO) {
		int n = sql.insert("HomeMapper.setFile",fileVO);
		return n;
	}
	
	public int getFileCnt(HomeVO fileVO) {
		int idCnt = sql.selectOne("HomeMapper.getFileCnt",fileVO);
		return idCnt;
	}

	public List<HomeVO> getFileList(HomeVO fileVO) {
		List<HomeVO> list = sql.selectList("HomeMapper.getFileList",fileVO);
		return list;
	}

	public HomeVO getFile(HomeVO fileVO) {
		HomeVO vo = sql.selectOne("HomeMapper.getFile",fileVO);
		return vo;
	}

	public void setFileDown(HomeVO fileVO) {
		sql.insert("HomeMapper.setFileDown",fileVO);
	}

	public List<HomeVO> getTagList(String string) {
		List<HomeVO> list = sql.selectList("HomeMapper.getTagList",string);
		return list;
	}

	public int setMember(HomeVO hvo) {
		int n = sql.insert("HomeMapper.setMember",hvo);
		return n;
	}

	public HomeVO getLogin(HomeVO hvo) {
		HomeVO vo = sql.selectOne("HomeMapper.getLogin",hvo);
		return vo;
	}
	
	
}
