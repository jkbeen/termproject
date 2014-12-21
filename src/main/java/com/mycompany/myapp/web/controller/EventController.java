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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("user")
@RequestMapping(value = "/events")
public class EventController {
	@Autowired
	private CalendarService calendarService;	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView viewAllEvents(Model model, Locale locale, ModelAndView mav) {
		mav.addObject("message", "모든 이벤트를 열람합니다.");
		List<Event> eventList = new ArrayList<Event>();
		eventList = this.calendarService.getAllEvents();
		model.addAttribute("EventList", eventList);
		
		mav.setViewName("viewAllEvents");
		return mav;
	}
	@RequestMapping(value = "/my", method = RequestMethod.GET)
	public ModelAndView viewEvent(@ModelAttribute("userForm") CalendarUser user, Model model, Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");
		List<Event> eventList = new ArrayList<Event>();
		eventList = this.calendarService.getEventForOwner(user.getId());
		model.addAttribute("EventList", eventList);
		mav.setViewName("viewMyEvents");
		return mav;
	}
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView createEvent(Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");
		mav.setViewName("createEvent");
		return mav;
	}
}
