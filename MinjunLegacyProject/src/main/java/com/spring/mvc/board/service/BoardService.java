package com.spring.mvc.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.board.model.BoardVo;
import com.spring.mvc.board.repository.IBoardRepository;
import com.spring.mvc.commons.PageVO;

@Service
public class BoardService implements IBoardService {

	
	@Autowired
	private IBoardRepository mapper;
	
	@Override
	public void insert(BoardVo article) {
		// TODO Auto-generated method stub
		mapper.insert(article);
		
	}

	@Override
	public List<BoardVo> getArticleList(PageVO paging) {
		
		// TODO Auto-generated method stub
		List<BoardVo> list=  mapper.getArticleList(paging);
		
		for(BoardVo vo : list) {
			
			long now = System.currentTimeMillis();
			long regTime = vo.getRegDate().getTime();
			
			
			if(now - regTime < 60 * 60 * 24  * 1000) {
				vo.setNewMark(true);
			}
		}
	
		return list;
	}

	@Override
	public BoardVo getArticle(Integer boardNo) {
		// TODO Auto-generated method stub
		mapper.updateViewCnt(boardNo);
		return mapper.getArticle(boardNo);
	}

	@Override
	public void update(BoardVo article) {
		
		mapper.update(article);
		
	}

	@Override
	public void delete(Integer boardNo) {
		// TODO Auto-generated method stub
		mapper.delete(boardNo);
	}

	@Override
	public int countArticles() {
		// TODO Auto-generated method stub
		return mapper.countArticles();
	}

}
