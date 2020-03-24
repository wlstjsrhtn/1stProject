package com.tj.ex.dto;

import java.sql.Date;

public class ReviewDto {
	private int RNum;
	private String MId;
	private String MName;
	private String RTitle;
	private String RContent;
	private String RFileName;
	private Date RRdate;
	private int RHit;
	private int RGroup;
	private int RStep;
	private int RIndent;
	private String RIp;
	public ReviewDto() {
	}
	public ReviewDto(int RNum, String MId, String MName, String RTitle, String RContent, String RFileName, Date RRdate, int RHit,
			int RGroup, int RStep, int RIndent, String RIp) {
		this.RNum = RNum;
		this.MId = MId;
		this.MName = MName;
		this.RTitle = RTitle;
		this.RContent = RContent;
		this.RFileName = RFileName;
		this.RRdate = RRdate;
		this.RHit = RHit;
		this.RGroup = RGroup;
		this.RStep = RStep;
		this.RIndent = RIndent;
		this.RIp = RIp;
	}
	public int getRNum() {
		return RNum;
	}
	public void setRNum(int rNum) {
		RNum = rNum;
	}
	public String getMId() {
		return MId;
	}
	public void setMId(String mId) {
		MId = mId;
	}
	public String getMName() {
		return MName;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public String getRTitle() {
		return RTitle;
	}
	public void setRTitle(String rTitle) {
		RTitle = rTitle;
	}
	public String getRContent() {
		return RContent;
	}
	public void setRContent(String rContent) {
		RContent = rContent;
	}
	public String getRFileName() {
		return RFileName;
	}
	public void setRFileName(String rFileName) {
		RFileName = rFileName;
	}
	public Date getRRdate() {
		return RRdate;
	}
	public void setRRdate(Date rRdate) {
		RRdate = rRdate;
	}
	public int getRHit() {
		return RHit;
	}
	public void setRHit(int rHit) {
		RHit = rHit;
	}
	public int getRGroup() {
		return RGroup;
	}
	public void setRGroup(int rGroup) {
		RGroup = rGroup;
	}
	public int getRStep() {
		return RStep;
	}
	public void setRStep(int rStep) {
		RStep = rStep;
	}
	public int getRIndent() {
		return RIndent;
	}
	public void setRIndent(int rIndent) {
		RIndent = rIndent;
	}
	public String getRIp() {
		return RIp;
	}
	public void setRIp(String rIp) {
		RIp = rIp;
	}
	@Override
	public String toString() {
		return "ReviewDto [RNum=" + RNum + ", MId=" + MId + ", RTitle=" + RTitle + ", RContent=" + RContent
				+ ", RFileName=" + RFileName + ", RRdate=" + RRdate + ", RHit=" + RHit + ", RGroup=" + RGroup
				+ ", RStep=" + RStep + ", RIndent=" + RIndent + ", RIp=" + RIp + "]";
	}
	
	
}
