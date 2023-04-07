package board;

import java.sql.Timestamp;

public class Board {
	private int no;
	private String type;
	private String id;
	private String title;
	private String contents;
	private Timestamp m_date;
	private Timestamp w_date;
	
	public Board(int no, String type, String id, String title, String contents, Timestamp m_date, Timestamp w_date) {
		this.no = no;
		this.type = type;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.m_date = m_date;
		this.w_date = w_date;
	}
	
	public Board(int no, String type, String title, String contents, Timestamp m_date, Timestamp w_date) {
		this.no = no;
		this.type = type;
		this.title = title;
		this.contents = contents;
		this.m_date = m_date;
		this.w_date = w_date;
	}
	

	public int getNo() {
		return this.no;
	}

	public String getType() {
		return this.type;
	}

	public String getId() {
		return this.id;
	}

	public String getTitle() {
		return this.title;
	}

	public String getContents() {
		return this.contents;
	}

	public Timestamp getM_date() {
		return this.m_date;
	}

	public Timestamp getW_date() {
		return this.w_date;
	}
	
}
