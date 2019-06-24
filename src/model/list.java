package model;



public class list {
	private int id;
	private String name;
	private String created;
	private String modified;
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getCreated() {
		return created;
	}
	public String  getModified() {
		return modified;
	}
	
	
	public list (int id, String name,String created,String modified) {
		this.id=id;
		this.name=name;
		this.created=created;
		this.modified=modified;
	}
	
}
