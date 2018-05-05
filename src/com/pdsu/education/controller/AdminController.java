package com.pdsu.education.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pdsu.education.service.UserService;



@Controller
@RequestMapping("/page/admin")
public class AdminController extends BaseController {
	
	@Autowired
    private UserService userService;

    /**
     * The method is used to get the userService by IOC.
     * @param UserService object.
     * */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
	
	@RequestMapping(value = "/init-data", method = RequestMethod.GET)
    public ModelAndView getInitData() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin_manage");
        return modelAndView;
    }
}
