package com.se.security.demo.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "ngay_lap")
	private LocalDate ngayLap;

	@Column(name = "thanh_tien")
	private String thanhTien;

	@ManyToOne
	@JoinColumn(name = "id_kh")
	private Customer customer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getNgayLap() {
		return ngayLap;
	}

	public void setNgayLap(LocalDate ngayLap) {
		this.ngayLap = ngayLap;
	}

	public String getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(String thanhTien) {
		this.thanhTien = thanhTien;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Order(int id, LocalDate ngayLap, String thanhTien, Customer customer) {
		super();
		this.id = id;
		this.ngayLap = ngayLap;
		this.thanhTien = thanhTien;
		this.customer = customer;
	}

	public Order(LocalDate ngayLap, String thanhTien, Customer customer) {
		super();
		this.ngayLap = ngayLap;
		this.thanhTien = thanhTien;
		this.customer = customer;
	}

	public Order() {
	}
}
