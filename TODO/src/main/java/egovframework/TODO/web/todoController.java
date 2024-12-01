package egovframework.TODO.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.TODO.service.todoService;
import egovframework.TODO.service.todoVO;
import egovframework.example.sample.service.SampleVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;


@Controller
public class todoController {

	/** EgovSampleService */
	@Resource(name = "todoService")
	private todoService todoService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 메인 페이지
	 */
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("todoVO") todoVO vo, ModelMap model) throws Exception {

		
		return "TODO/main";
	}
	
	/**
	 * 로그인 페이지
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute("todoVO") todoVO vo, ModelMap model, HttpSession session) throws Exception {
		try{
			//데이터 확인
			System.out.println("ID: " + vo.getID());
			System.out.println("PASS: " + vo.getPASS());
	        
			//회원조회
			todoVO result = todoService.selectLogin(vo);
	
			//기존 아이디, 비번이 있는 경우 로그인
			if (result != null  ) {
            // 세션에 사용자 정보 저장
            session.setAttribute("userID", result.getID());
			}
			//기존 아이디, 비번이 없는 경우
			else {
			System.out.println("정보없음");
			}
			return "redirect:/todoList.do"; 
		}
		catch (Exception e) {
		    System.out.println("Error Message: " + e.getMessage());
		    return"common/error";
		}
	
	}
	
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping(value = "/newUser.do")
	public String newUser(@ModelAttribute("todoVO") todoVO vo, ModelMap model) throws Exception {

		
		return "TODO/newUser";
	}
	
	/**
	 * 회원등록
	 */
	@RequestMapping(value = "/newMember.do", method = RequestMethod.POST)
	public String newMember(@ModelAttribute("todoVO") todoVO vo, ModelMap model) throws Exception {
		try {
			todoService.insertMember(vo);
			return "redirect:/main.do";
		}
		catch (Exception e) {
			System.out.println("Error Message: " + e.getMessage());
			return"common/error";
		}

		
	}
	
	/**
	 * todo리스트 조회
	 */
	@RequestMapping(value = "/todoList.do")
	public String todoList(@ModelAttribute("todoVO") todoVO vo, ModelMap model,HttpSession session) throws Exception {
		
		 String userID = (String) session.getAttribute("userID");
		 vo.setID(userID);
		 System.out.println("userID="+userID);
		List<todoVO> result = todoService.selectTodoList(vo);
		model.addAttribute("result", result);
		model.addAttribute("todoVO", vo);
		
		return "TODO/todoList";
	}
	
	/**
	 * todo리스트 업데이트
	 * @param 
	 * @param model
	 * @return "main"
	 * @exception Exception
	 */
	@RequestMapping(value = "/updateTodoList.do")
	public String updateTodoList(@RequestParam("titles") List<String> titles,
			@RequestParam("cnsts") List<String> cnsts,
			@RequestParam("completeYns") List<String> completeYns,
			@RequestParam("boardIds") List<String> boardIds,
			@RequestParam("id") String id,
			@RequestParam("tododate") String tododate,
			@ModelAttribute todoVO todoRequest) throws Exception{
		
		try {
			System.out.println("타이틀="+titles);
			System.out.println("내용"+cnsts);
			System.out.println("완료여부"+completeYns);
			System.out.println("아이디"+boardIds);
			System.out.println("사용자아이디"+id);
			System.out.println("tododate"+tododate);

			List<todoVO> todoList = new ArrayList<>();

			for (int i = 0; i < todoRequest.getTitles().size(); i++) {
				todoVO todoVo = new todoVO();
				todoVo.setTITLE(titles.get(i));
				todoVo.setCNST(cnsts.get(i));
				todoVo.setCOMPLETE_YN(completeYns.get(i));
		        todoVo.setBOARD_ID(boardIds.get(i));
		        todoVo.setID(id);
		        todoVo.setTODO_DATE(tododate);
		        todoList.add(todoVo);
			}
			todoService.updateTodoList(todoList);	
			return "TODO/todoList";
		}
		catch(Exception e){
			 System.out.println("Error Message: " + e.getMessage());
			 return"common/error";
		}
		
	}
	
	
	
	
	/**
	 * todo리스트 등록
	 */
	@RequestMapping(value = "/todoListReg.do")
	public String todoListReg(@ModelAttribute("todoVO") todoVO vo, ModelMap model) throws Exception {
		
		
		return "TODO/todoListReg";
	}
	
	/**
	 * 투두리스트 저장
	 */
	@RequestMapping(value = "/saveTodo.do", method = RequestMethod.POST)
	public String saveTodo(@RequestParam("titles") List<String> titles,
			@RequestParam("cnsts") List<String> cnsts,
			@RequestParam("completeYns") List<String> completeYns,
			@RequestParam("boardIds") List<String> boardIds,
			@RequestParam("id") String id,
			@ModelAttribute todoVO todoRequest) throws Exception {
				try { 
					System.out.println("타이틀="+titles);
					System.out.println("내용"+cnsts);
					System.out.println("완료여부"+completeYns);
					System.out.println("아이디"+boardIds);
					System.out.println("사용자아이디"+id);
		
					List<todoVO> todoList = new ArrayList<>();

					for (int i = 0; i < todoRequest.getTitles().size(); i++) {
						todoVO todoVo = new todoVO();
						todoVo.setTITLE(titles.get(i));
						todoVo.setCNST(cnsts.get(i));
						todoVo.setCOMPLETE_YN(completeYns.get(i));
				        todoVo.setBOARD_ID(boardIds.get(i));
				        todoVo.setID(id);
				        todoList.add(todoVo);
					}
					todoService.insertTodoList(todoList);
					return "TODO/todoListReg";
				}
				catch(Exception e){
					System.out.println("Error Message: " + e.getMessage());
					return"common/error";
				}		
		}
	
}
	
