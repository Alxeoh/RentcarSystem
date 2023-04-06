package board;

import java.sql.Timestamp;

public class BoardDto {
	
	private int no;
	private String type;
	private String id;
	private String title;
	private String contents;
	private Timestamp m_date;
	private Timestamp w_date;
	
	public BoardDto(int no, String type, String id, String title, String contents, Timestamp m_date, Timestamp w_date) {
		this.no = no;
		this.type = type;
		this.id = id;
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

	public void setNo(int no) {
		this.no = no;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}

	public void setW_date(Timestamp w_date) {
		this.w_date = w_date;
	}
	
	
	
}
