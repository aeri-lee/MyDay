package egovframework.TODO.service.impl;

import java.util.List;

import egovframework.TODO.service.todoVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("todoMapper")
public interface todoMapper {
	
	/**
	 * 사용자 조회.
	 * @param vo - 조회할 정보가 담긴 SampleVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	todoVO selectLogin(todoVO vo) throws Exception;
	
	void insertTodoList(todoVO vo) throws Exception;
	
	List<todoVO> selectTodoList(todoVO todoVO) throws Exception;
	
	void insertMember(todoVO vo) throws Exception;
	
	void updateTodoList(todoVO vo) throws Exception;
//	    void insertTodoList(todoVO todo);
	

	
}
