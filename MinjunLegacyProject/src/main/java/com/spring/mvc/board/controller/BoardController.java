package com.spring.mvc.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mvc.board.model.BoardVo;
import com.spring.mvc.board.service.IBoardService;
import com.spring.mvc.commons.PageCreator;
import com.spring.mvc.commons.PageVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	private IBoardService service;
	
	
	//게시글 목록 불러오기 요청
		@GetMapping("/list")
		public String list(PageVO paging,Model model) {
			List<BoardVo> list = service.getArticleList(paging); // 실제로 값을 가져오는 작업 
			
			PageCreator pc= new PageCreator(); // 이전 다음 시작 끝 을 내보내기 위함 작업 
			pc.setPage(paging.getPage());
			pc.setCountPerPage(paging.getCountPerPage());
			pc.setArticleTotalCount(service.countArticles()); // 이때 계산 들어간다 


			model.addAttribute("articles", list);
			model.addAttribute("pc",pc);

			return "board/list";
		}

		//게시글 작성페이지 요청
		@GetMapping("/write")
		public String write(HttpSession session ,RedirectAttributes ra) {
			if(session.getAttribute("login") == null) {
				ra.addFlashAttribute("msg","not-login");
				return "redirect:/";
			}
			return "board/write";
		}

		//게시글 DB등록 요청
		@PostMapping("/write")
		public String write(BoardVo article, RedirectAttributes ra) {
			
			
			service.insert(article);
			
			ra.addFlashAttribute("msg", "regSuccess");
			return "redirect:/board/list";
		}

		//게시물 상세 조회 요청
		@GetMapping("/content/{boardNo}")
		public String content(@PathVariable Integer boardNo, Model model,PageVO paging){
		
			BoardVo vo = service.getArticle(boardNo);
			
			model.addAttribute("article", vo); 
			
			model.addAttribute("p",paging);
			return "board/content";
		}

		//게시물 삭제 처리 요청
		@PostMapping("/delete")
		public String remove(Integer boardNo, RedirectAttributes ra) {

			service.delete(boardNo);
			ra.addFlashAttribute("msg", "delSuccess");

			return "redirect:/board/list";
		}
		
		//게시물 수정 페이지 요청
		@GetMapping("/modify")
		public String modify(Integer boardNo, Model model) {
			
			
			BoardVo vo = service.getArticle(boardNo);
			
			model.addAttribute("article", vo);
			
			return "board/modify";
		}
		
		
		//게시물 수정 요청
		@PostMapping("/modify")
		public String modify(BoardVo article, RedirectAttributes ra) {
			service.update(article);
			
			ra.addFlashAttribute("msg", "modSuccess");
			
			return "redirect:/board/content/" + article.getBoardNo();
		}
}
