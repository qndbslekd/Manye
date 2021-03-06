package project.spring.article.vo;

import java.sql.Timestamp;

public class ArticleReplyDTO {
	private int coIdx;
	private int bnIdx;
	private String bnComment;
	private String insertId;
	private Timestamp insertDay;
	private String isDelete;
	private String nickname;
	private String name;
	private int writerTitleCnt;
	private String writerTitleName;
	public int getCoIdx() {
		return coIdx;
	}
	public void setCoIdx(int coIdx) {
		this.coIdx = coIdx;
	}
	public int getBnIdx() {
		return bnIdx;
	}
	public void setBnIdx(int bnIdx) {
		this.bnIdx = bnIdx;
	}
	public String getBnComment() {
		return bnComment;
	}
	public void setBnComment(String bnComment) {
		this.bnComment = bnComment;
	}
	public String getInsertId() {
		return insertId;
	}
	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}
	public Timestamp getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(Timestamp insertDay) {
		this.insertDay = insertDay;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getWriterTitleCnt() {
		return writerTitleCnt;
	}
	public void setWriterTitleCnt(
			int writerTitleCnt) {
		this.writerTitleCnt = writerTitleCnt;
	}
	public String getWriterTitleName() {
		return writerTitleName;
	}
	public void setWriterTitleName(
			String writerTitleName) {
		this.writerTitleName = writerTitleName;
	}
	@Override
	public String toString() {
		return "ArticleReplyDTO [coIdx=" + coIdx
				+ ", bnIdx=" + bnIdx
				+ ", bnComment=" + bnComment
				+ ", insertId=" + insertId
				+ ", insertDay=" + insertDay
				+ ", isDelete=" + isDelete
				+ ", nickname=" + nickname
				+ ", name=" + name
				+ ", writerTitleCnt="
				+ writerTitleCnt
				+ ", writerTitleName="
				+ writerTitleName + "]";
	}
}
