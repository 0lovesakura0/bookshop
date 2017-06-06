package com.book.mobel;

public class Book {
	private Long id;

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return this.id;
	}

	private String name;

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	private Long type;

	public void setType(Long type) {
		this.type = type;
	}

	public Long getType() {
		return this.type;
	}

	private Float price;

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getPrice() {
		return this.price;
	}

	private Long number;

	public void setNumber(Long number) {
		this.number = number;
	}

	public Long getNumber() {
		return this.number;
	}

	private String author;

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return this.author;
	}

	private String content;

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return this.content;
	}
}