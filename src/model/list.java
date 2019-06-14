package model;

import java.util.Date;

public class list {
	private int id;
	private String name;
	private Date created;
	private Date modified;
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public Date getCreated() {
		return created;
	}
	public Date getModified() {
		return modified;
	}
	
	
	public list (int id, String name,Date created,Date modified) {
		this.id=id;
		this.name=name;
		this.created=created;
		this.modified=modified;
	}
	
}
