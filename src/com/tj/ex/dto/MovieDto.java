package com.tj.ex.dto;

public class MovieDto {
	private String MTitle;
	private String MPhoto;
	private String MStory;
	private String MDName;
	private String MActor;
	private String MW;
	private int MBRank;
	private String MRdate;
	public MovieDto() {
	}
	public MovieDto(String mTitle, String mPhoto, String mStory, String mDName, String mActor, String mW, int mBRank,
			String mRdate) {
		super();
		MTitle = mTitle;
		MPhoto = mPhoto;
		MStory = mStory;
		MDName = mDName;
		MActor = mActor;
		MW = mW;
		MBRank = mBRank;
		MRdate = mRdate;
	}
	public String getMTitle() {
		return MTitle;
	}
	public void setMTitle(String mTitle) {
		MTitle = mTitle;
	}
	public String getMPhoto() {
		return MPhoto;
	}
	public void setMPhoto(String mPhoto) {
		MPhoto = mPhoto;
	}
	public String getMStory() {
		return MStory;
	}
	public void setMStory(String mStory) {
		MStory = mStory;
	}
	public String getMDName() {
		return MDName;
	}
	public void setMDName(String mDName) {
		MDName = mDName;
	}
	public String getMActor() {
		return MActor;
	}
	public void setMActor(String mActor) {
		MActor = mActor;
	}
	public String getMW() {
		return MW;
	}
	public void setMW(String mW) {
		MW = mW;
	}
	public int getMBRank() {
		return MBRank;
	}
	public void setMBRank(int mBRank) {
		MBRank = mBRank;
	}
	public String getMRdate() {
		return MRdate;
	}
	public void setMRdate(String mRdate) {
		MRdate = mRdate;
	}
	@Override
	public String toString() {
		return "MovieDto [MTitle=" + MTitle + ", MPhoto=" + MPhoto + ", MStory=" + MStory + ", MDName=" + MDName
				+ ", MActor=" + MActor + ", MW=" + MW + ", MBRank=" + MBRank + ", MRdate=" + MRdate + "]";
	}
	
	
}
