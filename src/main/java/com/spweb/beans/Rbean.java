package com.spweb.beans;

public class Rbean {
	//변수
	String name;
	int age;
	//생성자
	public Rbean(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	//getter,setter
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
