package com.se.security.demo.controller;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.se.security.demo.entity.Cart;
import com.se.security.demo.entity.CartDetail;
import com.se.security.demo.entity.Customer;
import com.se.security.demo.entity.Product;
import com.se.security.demo.service.CartService;
import com.se.security.demo.service.CustomerService;
import com.se.security.demo.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;

	@GetMapping("/cart")
	public String listCart(Model model) {
		Cart cart = cartService.getOrderByIdCustomer(1);
		if (cart != null) {
			List<CartDetail> cartDetails = cartService.getOrderDetailByOrder(cart.getId());
			model.addAttribute("listDetail", cartDetails);
			model.addAttribute("cart", cart);
		}
		return "cart";
	}

	@RequestMapping("/saveOrderAndOpenCart")
	public String saveOrderAndOpenCart(@RequestParam int soLuong, @RequestParam String productId) {
		handleSaveOrder(soLuong, productId);
		return "redirect:/cart";
	}

	@RequestMapping("/saveOrder")
	@ResponseBody
	public void saveOrder(@RequestParam int soLuong, @RequestParam String productId) {
		handleSaveOrder(soLuong, productId);
	}
	
	

	@RequestMapping("/delete/productId={productId}/orderId={cartId}")
	public String deleteDetail(@PathVariable int productId, @PathVariable int cartId) {
		System.out.println(productId + " " + cartId);
		return "redirect:/cart";
	}
	

	public void handleSaveOrder(int soLuong, String productId) {
		Customer customer = customerService.getCustomer(1);
		Product product = productService.getProductById(Integer.parseInt(productId));
		Cart cart = cartService.getOrderByIdCustomer(1);
		
		// kiểm tra khách hàng đã có hóa đơn chưa thanh toán ko?
		// có
		if (cart != null) {
			// tạo chi tiết hóa đơn và thêm vào sql
			List<CartDetail> listCartDetail = cartService.getOrderDetailByOrder(cart.getId());
			CartDetail cartDetail = null;
			for (CartDetail temp : listCartDetail) {
				if (temp.getProduct().getId() == product.getId()) {
					cartDetail = temp;
				}
			}
			if (cartDetail == null) {
				cartDetail = new CartDetail(cart, product, soLuong, product.getPrice());
				cartService.saveCartDetail(cartDetail);
			} else {
				cartDetail.setSoLuong(cartDetail.getSoLuong() + soLuong);
				cartService.updateCartDetail(cartDetail);
			}
		// không
		} else {
			// tạo hóa đơn và thêm và thêm vào sql
			// tạo chi tiết hóa đơn và thêm vào sql
			cart = new Cart(LocalDate.now(), null, customer, null);
			CartDetail cartDetail = new CartDetail(cart, product, soLuong, product.getPrice());
			String[] gia = product.getPrice().split(" ");
			cart.setThanhTien((cartDetail.getSoLuong() * Double.parseDouble(gia[0].replace(".", ""))) + " " + gia[1]);
			cart.setThanhToan("chưa thanh toán");
			cartService.saveCart(cart);
			cartService.saveCartDetail(cartDetail);
		}
	}
}
