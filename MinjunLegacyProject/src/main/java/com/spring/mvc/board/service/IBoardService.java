package com.spring.mvc.board.service;

import java.util.List;

import com.spring.mvc.board.model.BoardVo;
import com.spring.mvc.commons.PageVO;

public interface IBoardService {
	//게시글 등록 기능
	void insert(BoardVo article);
	
	//게시글 목록 조회기능
	List<BoardVo> getArticleList(PageVO paging);
	
	//게시글 상세 조회기능
	BoardVo getArticle(Integer boardNo);
	
	//게시글 수정 기능
	void update(BoardVo article);
	
	//게시글 삭제 기능
	void delete(Integer boardNo);
	
	int countArticles();
}
