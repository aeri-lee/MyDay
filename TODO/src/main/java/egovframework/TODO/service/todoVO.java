package egovframework.TODO.service;

import java.util.List;

public class todoVO  {
/** 아이디 */
private String ID;

/** 비밀번호 */
private String PASS;

/** 이름 */
private String NAME;

/** 이메일 */
private String EMAIL;

private String TITLE;  
private String CNST;   
private String COMPLETE_YN; 
private String BOARD_ID; 
private String TODO_DATE; 


private List<String> titles;
private List<String> cnsts;
private List<String> completeYns;
private List<String> boardIds;


public String getID() {
	return ID;
}

public void setID(String ID) {
	this.ID = ID;
}

public String getPASS() {
	return PASS;
}

public void setPASS(String PASS) {
	this.PASS = PASS;
}
public String getNAME() {
	return NAME;
}

public void setNAME(String NAME) {
	this.NAME = NAME;
}
public String getEMAIL() {
	return EMAIL;
}

public void setEMAIL(String EMAIL) {
	this.EMAIL = EMAIL;
}

//Getters and Setters
public String getTITLE() {
 return TITLE;
}

public void setTITLE(String TITLE) {
 this.TITLE = TITLE;
}

public String getCNST() {
 return CNST;
}

public void setCNST(String CNST) {
 this.CNST = CNST;
}

public String getCOMPLETE_YN() {
 return COMPLETE_YN;
}

public void setCOMPLETE_YN(String COMPLETE_YN) {
 this.COMPLETE_YN = COMPLETE_YN;
}

public String getBOARD_ID() {
 return BOARD_ID;
}

public void setBOARD_ID(String BOARD_ID) {
 this.BOARD_ID = BOARD_ID;
}

public String getTODO_DATE() {
	 return TODO_DATE;
}

public void setTODO_DATE(String TODO_DATE) {
	 this.TODO_DATE = TODO_DATE;
}
	
public List<String> getTitles() {
    return titles;
}

public void setTitles(List<String> titles) {
    this.titles = titles;
}

public List<String> getCnsts() {
    return cnsts;
}

public void setCnsts(List<String> cnsts) {
    this.cnsts = cnsts;
}

public List<String> getCompleteYns() {
    return completeYns;
}

public void setCompleteYns(List<String> completeYns) {
    this.completeYns = completeYns;
}

public List<String> getBoardIds() {
    return boardIds;
}

public void setBoardIds(List<String> boardIds) {
    this.boardIds = boardIds;
}



}