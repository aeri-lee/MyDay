package egovframework.TODO.service;

import java.util.List;

import egovframework.TODO.service.todoVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

public interface todoService {
	/**
	 * 사용자 조회
	 * @param vo - 조회할 정보가 담긴 todoVO
	 * @return 
	 * @exception Exception
	 */
	todoVO selectLogin(todoVO vo) throws Exception;
	
	
	void insertTodoList(List<todoVO> todoList)  throws Exception;

	
	List<todoVO> selectTodoList(todoVO todoVO) throws Exception;
	
	void insertMember(todoVO vo)  throws Exception;
	
	void updateTodoList(List<todoVO> todoList)  throws Exception;

	
}