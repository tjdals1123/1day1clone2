package org.ict.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.ict.domain.BoardVO;
import org.ict.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/board")
public class RestBoardController {

	@Autowired
	BoardService service;
	
	@GetMapping(value="/list"  ,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BoardVO>> list() {
		
		ResponseEntity<List<BoardVO>> entity = null;
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			
			list = service.list();
			entity = new ResponseEntity<List<BoardVO>>(list, HttpStatus.OK);
			
			log.info(entity);
			
		} catch(Exception e){
			entity = new ResponseEntity<List<BoardVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}




























