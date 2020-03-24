package com.tj.ex.dto;

import java.sql.Date;

public class MemberDto {
	private String MId;
	private String MPw;
	private String MName;
	private String MTel;
	private Date MBirth;
	private String MEmail;
	private String MGender;
	private String MAddress;
	private Date MRdate;
	public MemberDto() {
	}
	public MemberDto(String MId, String MPw, String MName, String MTel, Date MBirth, String MEmail, String MGender,
			String MAddress, Date MRdate) {
		this.MId = MId;
		this.MPw = MPw;
		this.MName = MName;
		this.MTel = MTel;
		this.MBirth = MBirth;
		this.MEmail = MEmail;
		this.MGender = MGender;
		this.MAddress = MAddress;
		this.MRdate = MRdate;
	}
	public String getMId() {
		return MId;
	}
	public void setMId(String mId) {
		MId = mId;
	}
	public String getMPw() {
		return MPw;
	}
	public void setMPw(String mPw) {
		MPw = mPw;
	}
	public String getMName() {
		return MName;
	}
	public void setMName(String mName) {
		MName = mName;
	}
	public String getMTel() {
		return MTel;
	}
	public void setMTel(String mTel) {
		MTel = mTel;
	}
	public Date getMBirth() {
		return MBirth;
	}
	public void setMBirth(Date mBirth) {
		MBirth = mBirth;
	}
	public String getMEmail() {
		return MEmail;
	}
	public void setMEmail(String mEmail) {
		MEmail = mEmail;
	}
	public String getMGender() {
		return MGender;
	}
	public void setMGender(String mGender) {
		MGender = mGender;
	}
	public String getMAddress() {
		return MAddress;
	}
	public void setMAddress(String mAddress) {
		MAddress = mAddress;
	}
	public Date getMRdate() {
		return MRdate;
	}
	public void setMRdate(Date mRdate) {
		MRdate = mRdate;
	}
	@Override
	public String toString() {
		return "MemberDto [MId=" + MId + ", MPw=" + MPw + ", MName=" + MName + ", MTel=" + MTel + ", MBirth=" + MBirth
				+ ", MEmail=" + MEmail + ", MGender=" + MGender + ", MAddress=" + MAddress + ", MRdate=" + MRdate + "]";
	}
	
}
