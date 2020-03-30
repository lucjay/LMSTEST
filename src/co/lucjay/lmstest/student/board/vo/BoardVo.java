package co.lucjay.lmstest.student.board.vo;

import java.sql.Date;

public class BoardVo {

	private int boardid;
	private String writer;
	private Date wdate;
	private String title;
	private String contents;
	private int hit;
	private String filename;

	public BoardVo() {

	}

	public int getBoardid() {
		return boardid;
	}

	public String getWriter() {
		return writer;
	}

	public Date getWdate() {
		return wdate;
	}

	public String getTitle() {
		return title;
	}

	public String getContents() {
		return contents;
	}

	public int getHit() {
		return hit;
	}

	public void setBoardid(int board) {
		this.boardid = board;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
