package com.se.suanha.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.suanha.dao.CustomerDAOImpl;
import com.se.suanha.entity.CrmUser;
import com.se.suanha.entity.Customer;
import com.se.suanha.service.CustomerService;
import com.se.suanha.service.CustomerServiceImpl;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private UserDetailsManager userDetailsManager;
	@Autowired
	private CustomerService customerService;
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	private Logger logger = Logger.getLogger(getClass().getName());

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {

		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/showRegistrationForm")
	public String showMyLoginPage(Model theModel) {

		theModel.addAttribute("crmUser", new CrmUser());

		return "customer-form-register";

	}

	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser,
			BindingResult theBindingResult, Model theModel) {
		System.out.println(theCrmUser.getTen());
		System.out.println(theCrmUser.getGioiTinh());
		String userName = theCrmUser.getUserName();
		String ten = theCrmUser.getTen();
		String sdt = theCrmUser.getSdt();
		String gioiTinh = theCrmUser.getGioiTinh();
		String email = theCrmUser.getEmail();
		logger.info("Processing registration form for: " + userName);

		// form validation
		if (theBindingResult.hasErrors()) {

			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "Tên đăng nhập/ Mật khẩu không được để trống.");

			logger.warning("User name/password can not be empty.");

			return "customer-form-register";
		}

		// check the database if user already exists
		boolean userExists = doesUserExist(userName);

		if (userExists) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name already exists.");

			logger.warning("User name already exists.");

			return "customer-form-register";
		}

		//
		// whew ... we passed all of the validation checks!
		// let's get down to business!!!
		//

		// encrypt the password
		String encodedPassword = passwordEncoder.encode(theCrmUser.getPassword());

		// prepend the encoding algorithm id
		encodedPassword = "{bcrypt}" + encodedPassword;

		// give user default role of "employee"
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");

		// create user object (from Spring Security framework)
		User tempUser = new User(userName, encodedPassword, authorities);
		Customer tempCustomer = new Customer(userName, ten, sdt, gioiTinh, email);
		// save user in the database
		userDetailsManager.createUser(tempUser);
		customerService.addCustomer(tempCustomer);
		// userDetailsManager.createUser(tempCustomer);
		logger.info("Successfully created user: " + userName);

		return "registration-confirmation";
	}

	private boolean doesUserExist(String userName) {

		logger.info("Checking if user exists: " + userName);

		// check the database if the user already exists
		boolean exists = userDetailsManager.userExists(userName);

		logger.info("User: " + userName + ", exists: " + exists);

		return exists;
	}

}
