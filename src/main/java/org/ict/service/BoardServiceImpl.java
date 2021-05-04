package org.ict.service;

import java.util.List;

import org.ict.domain.BoardVO;
import org.ict.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
	
@Service	
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> list() {
		return mapper.list();
		
	}

	@Override
	public void modify(Long bno) {
		
		mapper.modify(bno);
	}

	@Override
	public void insert(BoardVO board) {

		mapper.insert(board);
	}

	@Override
	public void remove(Long bno) {
		
		mapper.remove(bno);
	}

}
