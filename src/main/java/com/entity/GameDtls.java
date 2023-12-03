package com.entity;

public class GameDtls {
	
	private int gameId;
	private String gameName;
	private String developer;
	private String price;
	private String gameCategory;
	private String status;
	private String photoName;
	private String email;
	public GameDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GameDtls(String gameName, String developer, String price, String gameCategory, String status,
			String photoName, String email) {
		super();
		this.gameName = gameName;
		this.developer = developer;
		this.price = price;
		this.gameCategory = gameCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	public int getGameId() {
		return gameId;
	}
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getGameCategory() {
		return gameCategory;
	}
	public void setGameCategory(String gameCategory) {
		this.gameCategory = gameCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "GameDtls [gameId=" + gameId + ", gameName=" + gameName + ", developer=" + developer + ", price=" + price
				+ ", gameCategory=" + gameCategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}
	
	

}
