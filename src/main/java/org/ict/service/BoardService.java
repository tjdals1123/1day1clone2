package org.ict.service;

import java.util.List;

import org.ict.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> list();
	
	public void modify(Long bno);
	
	public void insert(BoardVO board);
	
	public void remove(Long bno);

}
