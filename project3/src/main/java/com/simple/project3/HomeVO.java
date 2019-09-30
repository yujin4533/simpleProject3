package com.simple.project3;

import org.springframework.web.multipart.MultipartFile;

public class HomeVO {
	
	private int memberSeq;
	private int fileSeq;

	private String userID;
	private String userName;
	private String pwd;
	
	private String fileType;
	private String fileOrgName;
	private String fileNewName;
	private String fileSize;
	private String fileInformation;
	private String fileTag;
	
	private String[] fileTagList;
	
	private String uploadDate;
	private String saveDate;
	
	private int status;
	
	// for search paging
	private int totalCnt;
	private int currentShowPage;
	private int blockSize;
	private int sizePerPage;
	private String searchWord;
	private String sort;
	
	private MultipartFile attach;
	
	public HomeVO() {}

	public HomeVO(int memberSeq, int fileSeq, String userID, String userName, String pwd, String fileType,
			String fileOrgName, String fileNewName, String fileSize, String fileInformation, String fileTag,
			String[] fileTagList, String uploadDate, String saveDate, int status, int totalCnt, int currentShowPage,
			int blockSize, int sizePerPage, String searchWord, String sort, MultipartFile attach) {
		super();
		this.memberSeq = memberSeq;
		this.fileSeq = fileSeq;
		this.userID = userID;
		this.userName = userName;
		this.pwd = pwd;
		this.fileType = fileType;
		this.fileOrgName = fileOrgName;
		this.fileNewName = fileNewName;
		this.fileSize = fileSize;
		this.fileInformation = fileInformation;
		this.fileTag = fileTag;
		this.fileTagList = fileTagList;
		this.uploadDate = uploadDate;
		this.saveDate = saveDate;
		this.status = status;
		this.totalCnt = totalCnt;
		this.currentShowPage = currentShowPage;
		this.blockSize = blockSize;
		this.sizePerPage = sizePerPage;
		this.searchWord = searchWord;
		this.sort = sort;
		this.attach = attach;
	}

	public int getMemberSeq() {
		return memberSeq;
	}

	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileOrgName() {
		return fileOrgName;
	}

	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}

	public String getFileNewName() {
		return fileNewName;
	}

	public void setFileNewName(String fileNewName) {
		this.fileNewName = fileNewName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileInformation() {
		return fileInformation;
	}

	public void setFileInformation(String fileInformation) {
		this.fileInformation = fileInformation;
	}

	public String getFileTag() {
		return fileTag;
	}

	public void setFileTag(String fileTag) {
		this.fileTag = fileTag;
	}

	public String[] getFileTagList() {
		if(fileTag!=null)
			fileTagList = fileTag.split(",");
		return fileTagList;
	}

	public void setFileTagList(String[] fileTagList) {
		this.fileTagList = fileTagList;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	
	public int getTotalPage() {
		return (int)Math.ceil((double)totalCnt/sizePerPage);
	}
	
	public int getStartRno() {
		if(currentShowPage<1)
			currentShowPage = 1;
		return (currentShowPage-1)*sizePerPage+1;
	}

	public int getEndRno() {
		return getStartRno()+sizePerPage-1;
	}

	public int getCurrentShowPage() {
		return currentShowPage;
	}

	public void setCurrentShowPage(int currentShowPage) {
		this.currentShowPage = currentShowPage;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getSizePerPage() {
		return sizePerPage;
	}

	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	
}
