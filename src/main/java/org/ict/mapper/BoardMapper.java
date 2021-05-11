package org.ict.mapper;

import java.util.List;

import org.ict.domain.BoardVO;
import org.ict.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> list();
	
	public List<BoardVO> listCriteria(Criteria cri);
	
	public void modify(BoardVO board);
	
	public void insert(BoardVO board);
	
	public void remove(Long bno);

	public BoardVO read(Long bno);
}
