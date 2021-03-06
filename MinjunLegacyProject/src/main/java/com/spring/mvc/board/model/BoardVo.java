package com.spring.mvc.board.model;

import java.sql.Date;

public class BoardVo {
	private Integer boardNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Integer viewCnt;
	
	//new마크 받아보자 
	private boolean newMark;
	
	
	
	public boolean isNewMark() {
		return newMark;
	}
	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Integer getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(Integer viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
	}
}
