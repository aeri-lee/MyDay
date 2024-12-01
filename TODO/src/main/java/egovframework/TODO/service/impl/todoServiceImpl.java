package egovframework.TODO.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.TODO.service.todoService;
import egovframework.TODO.service.todoVO;
import egovframework.TODO.service.impl.todoMapper;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;


@Service("todoService")
public class todoServiceImpl extends EgovAbstractServiceImpl implements todoService {

	private static final Logger LOGGER = LoggerFactory.getLogger(todoServiceImpl.class);

	/** todoDAO */
	@Resource(name="todoMapper")
	private todoMapper todoDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	/**
	 * 사용자 조회
	 * @param vo - 조회할 정보가 담긴 todoVO
	 * @return 
	 * @exception Exception
	 */
	@Override
	public todoVO selectLogin(todoVO vo) throws Exception {
		todoVO resultVO = todoDAO.selectLogin(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	
	@Override
	public void insertTodoList(List<todoVO> todoList) throws Exception {
		 for (todoVO vo : todoList) {
		        todoDAO.insertTodoList(vo); // 각 todoVO 객체를 하나씩 insert
		    }
	}
	
	@Override
	public List<todoVO> selectTodoList(todoVO todoVO) throws Exception {
		return todoDAO.selectTodoList(todoVO);
	}
	
	@Override
	public void insertMember(todoVO vo) throws Exception {
		 
		        todoDAO.insertMember(vo); 
		    
	}
	
	@Override
	public void updateTodoList(List<todoVO> todoList) throws Exception {
		 for (todoVO vo : todoList) {
		        todoDAO.updateTodoList(vo); 
		 }
		    
	}
}