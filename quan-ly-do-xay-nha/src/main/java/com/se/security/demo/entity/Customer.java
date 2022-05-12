package com.se.security.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "customers")
public class Customer {
	@NotNull(message="is required")
	@Size(min=1, message="is required")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "username")
	private String userName;
	
	@NotNull(message="is required")
	@Size(min=1, message="is required")
	@Column(name = "password")
	private String password;
	
	
	@Column(name = "ten")
	private String ten;

	@Column(name = "sdt")
	private String sdt;

	@Column(name = "gioi_tinh")
	private String gioiTinh;

	@Column(name = "email")
	private String email;

	
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public Customer() {
	}

	public Customer(String ten, String sdt, String gioiTinh, String email) {
		super();
		this.ten = ten;
		this.sdt = sdt;
		this.gioiTinh = gioiTinh;
		this.email = email;
	}

}
