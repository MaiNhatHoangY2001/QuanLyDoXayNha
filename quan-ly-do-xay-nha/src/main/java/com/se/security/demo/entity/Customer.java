package com.se.security.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customers")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "ten")
	private String ten;

	@Column(name = "sdt")
	private String sdt;

	@Column(name = "gioi_tinh")
	private String gioiTinh;

	@Column(name = "email")
	private String email;

	@Column(name = "mat_khau")
	private String matKhau;

	@Column(name = "ten_tk")
	private String tenTK;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getTenTK() {
		return tenTK;
	}

	public void setTenTK(String tenTK) {
		this.tenTK = tenTK;
	}

	public Customer() {
	}

	public Customer(String ten, String sdt, String gioiTinh, String email, String matKhau, String tenTK) {
		super();
		this.ten = ten;
		this.sdt = sdt;
		this.gioiTinh = gioiTinh;
		this.email = email;
		this.matKhau = matKhau;
		this.tenTK = tenTK;
	}

}
