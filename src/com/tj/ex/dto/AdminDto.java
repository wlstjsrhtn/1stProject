package com.tj.ex.dto;

public class AdminDto {
	private String AId;
	private String APw;
	private String AName;
	public AdminDto() {
		super();
	}
	public AdminDto(String AId, String APw, String AName) {
		this.AId = AId;
		this.APw = APw;
		this.AName = AName;
	}
	public String getAId() {
		return AId;
	}
	public void setAId(String aId) {
		AId = aId;
	}
	public String getAPw() {
		return APw;
	}
	public void setAPw(String aPw) {
		APw = aPw;
	}
	public String getAName() {
		return AName;
	}
	public void setAName(String aName) {
		AName = aName;
	}
	@Override
	public String toString() {
		return "AdminDto [AId=" + AId + ", APw=" + APw + ", AName=" + AName + "]";
	}
	
	
}
