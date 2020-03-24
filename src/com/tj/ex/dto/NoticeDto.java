package com.tj.ex.dto;

import java.sql.Date;

public class NoticeDto {
	private int NNum;
	private String AId;
	private String NTitle;
	private String NPhoto;
	private String NContent;
	private Date NDate;
	private int NHit;
	public NoticeDto() {
	}
	public NoticeDto(int NNum, String AId, String NTitle, String NPhoto, String NContent, Date NDate, int NHit) {
		this.NNum = NNum;
		this.AId = AId;
		this.NTitle = NTitle;
		this.NPhoto = NPhoto;
		this.NContent = NContent;
		this.NDate = NDate;
		this.NHit = NHit;
	}
	public int getNNum() {
		return NNum;
	}
	public void setNNum(int nNum) {
		NNum = nNum;
	}
	public String getAId() {
		return AId;
	}
	public void setAId(String aId) {
		AId = aId;
	}
	public String getNTitle() {
		return NTitle;
	}
	public void setNTitle(String nTitle) {
		NTitle = nTitle;
	}
	public String getNPhoto() {
		return NPhoto;
	}
	public void setNPhoto(String nPhoto) {
		NPhoto = nPhoto;
	}
	public String getNContent() {
		return NContent;
	}
	public void setNContent(String nContent) {
		NContent = nContent;
	}
	public Date getNDate() {
		return NDate;
	}
	public void setNDate(Date nDate) {
		NDate = nDate;
	}
	public int getNHit() {
		return NHit;
	}
	public void setNHit(int nHit) {
		NHit = nHit;
	}
	@Override
	public String toString() {
		return "NoticeDto [NNum=" + NNum + ", AId=" + AId + ", NTitle=" + NTitle + ", NPhoto=" + NPhoto + ", NContent="
				+ NContent + ", NDate=" + NDate + ", NHit=" + NHit + "]";
	}
	
	
}
