package kr.or.ddit.util;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

public class ItemDTO implements Serializable{
	private String busiNm;
	private String busiId;
	private String rmNm;
	private String rmId;
	private int rmNum;
	private int rmPr;
	private LocalDate rsvSt;
	private LocalDate rsvEd;
	private String busiImg;
	
	public ItemDTO() {
		super();
	}
	
	public ItemDTO(String busiNm,String busiId, String rmNm, String rmId, int rmNum, int rmPr, LocalDate rsvSt,LocalDate rsvEd) {
		super();
		this.busiNm=busiNm;
		this.busiId=busiId;
		this.rmNm=rmNm;
		this.rmId=rmId;
		this.rmNum=rmNum;
		this.rmPr=rmPr;
		this.rsvSt=rsvSt;
		this.rsvEd=rsvEd;
		
		
	}
	public ItemDTO(String busiNm,String busiId, String rmNm, String rmId, int rmNum, int rmPr, LocalDate rsvSt,LocalDate rsvEd,String busiImg) {
		super();
		this.busiNm=busiNm;
		this.busiId=busiId;
		this.rmNm=rmNm;
		this.rmId=rmId;
		this.rmNum=rmNum;
		this.rmPr=rmPr;
		this.rsvSt=rsvSt;
		this.rsvEd=rsvEd;
		this.busiImg = busiImg;
		
		
	}

	public String getBusiNm() {
		return busiNm;
	}

	public void setBusiNm(String busiNm) {
		this.busiNm = busiNm;
	}

	public String getBusiId() {
		return busiId;
	}

	public void setBusiId(String busiId) {
		this.busiId = busiId;
	}

	public String getRmNm() {
		return rmNm;
	}

	public void setRmNm(String rmNm) {
		this.rmNm = rmNm;
	}

	public String getRmId() {
		return rmId;
	}

	public void setRmId(String rmId) {
		this.rmId = rmId;
	}

	public int getRmNum() {
		return rmNum;
	}

	public void setRmNum(int rmNum) {
		this.rmNum = rmNum;
	}

	public int getRmPr() {
		return rmPr;
	}

	public void setRmPr(int rmPr) {
		this.rmPr = rmPr;
	}

	public LocalDate getRsvSt() {
		return rsvSt;
	}

	public void setRsvSt(LocalDate rsvSt) {
		this.rsvSt = rsvSt;
	}

	public LocalDate getRsvEd() {
		return rsvEd;
	}

	public void setRsvEd(LocalDate rsvEd) {
		this.rsvEd = rsvEd;
	}

	public String getBusiImg() {
		return busiImg;
	}

	public void setBusiImg(String busiImg) {
		this.busiImg = busiImg;
	}

	@Override
	public String toString() {
		return "ItemDTO [busiNm=" + busiNm + ", busiId=" + busiId + ", rmNm=" + rmNm + ", rmId=" + rmId + ", rmNum="
				+ rmNum + ", rmPr=" + rmPr + ", rsvSt=" + rsvSt + ", rsvEd=" + rsvEd + ", busiImg=" + busiImg + "]";
	}
	

	
	
	
	
}
