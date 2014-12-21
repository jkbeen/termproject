package com.mycompany.myapp.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mycompany.myapp.dao.CalendarUserDao;
import com.mycompany.myapp.service.CalendarService;
import com.mycompany.myapp.domain.CalendarUser;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("user")
public class MemberController {
	@Autowired
	private CalendarService calendarService;	
	
	@Autowired
	private CalendarUserDao calendarUserDao;
	
	/*
	@RequestMapping(value = "/users/signup", method = RequestMethod.GET)
	public ModelAndView signup(Locale locale, ModelAndView mav) {
		mav.addObject("message", "회원가입 페이지입니다.");
		mav.setViewName("signup");
		return mav;
	}
	*/
	@RequestMapping(value = "/users/signup", method = RequestMethod.GET)
    public ModelAndView viewSignup(Model model, Locale locale, ModelAndView mav) {
        CalendarUser userForm = new CalendarUser();
        
        model.addAttribute("userForm", userForm);
        mav.addObject("message", "myCalendar 회원가입 페이지입니다.");
		mav.setViewName("signup");
        return mav;
    }
	
	@RequestMapping(value = "/users/signupSuccess", method = RequestMethod.POST)
	public ModelAndView processSignup(@ModelAttribute("userForm") CalendarUser user, Locale locale, ModelAndView mav) {
		mav.addObject("message", "myCalendar 회원가입에 성공하였습니다.");
		
		this.calendarService.createUser(user);
		this.calendarService.createUserRole(user, "USER_ROLE");
		mav.setViewName("signupSuccess");
		return mav;
	}
	@RequestMapping(value = "/users/signin", method = RequestMethod.GET)
	public ModelAndView signin( @RequestParam(value = "error", required = false) String error, 
			  					@RequestParam(value = "logout", required = false) String logout,
			  					Model model, Locale locale, ModelAndView mav) {
		mav.addObject("message", "로그인 페이지입니다.");
		CalendarUser userForm = new CalendarUser();
		model.addAttribute("userForm", userForm);
		if (error != null) {
			mav.addObject("error", "Invalid username and password!");
		}	 
		else if (logout != null) {
			mav.addObject("msg", "You've been logged out successfully.");
		}
		mav.setViewName("signin");
		return mav;
	}
	/*
	@RequestMapping(value = "/users/signinSuccess", method = RequestMethod.POST)
	public ModelAndView processSignin(@ModelAttribute("userForm") CalendarUser user, Locale locale, ModelAndView mav) {
		mav.addObject("message", "myCalendar 로그인에 성공하였습니다.");
		
		//this.calendarService.createUser(user);
		
		mav.setViewName("signinSuccess");
		return mav;
	}
	*/
	/*
	@RequestMapping(value = "/users/signin", method = RequestMethod.GET)
	public ModelAndView signin(Locale locale, ModelAndView mav) {
		mav.addObject("message", "로그인 페이지입니다.");
		mav.setViewName("signin");
		return mav;
	}
	*/
}
