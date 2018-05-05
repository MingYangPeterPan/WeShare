package com.pdsu.education.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.pdsu.education.common.AppContext;
import com.pdsu.education.exception.ParameterException;
import com.pdsu.education.exception.ServiceException;
import com.pdsu.education.model.Child;
import com.pdsu.education.model.Pagination;
import com.pdsu.education.model.User;
import com.pdsu.education.service.UserService;
import com.pdsu.education.util.MD5Util;
import com.pdsu.education.util.RoleMapUtil;
import com.pdsu.education.util.StringUtil;

@Controller
@RequestMapping("/page/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "go", defaultValue = "") String go) {
        User user = AppContext.getContext().getUser();
        ModelAndView modelAndView = new ModelAndView();
        if (user != null) {
            modelAndView.setView(this.getRedirectView("page/user/content"));
        } else {
            modelAndView.addObject("go", go);
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginCheck(
                                   @RequestParam(value = "userName", defaultValue = "") String userName,
                                   @RequestParam(value = "password", defaultValue = "") String password,
                                   @RequestParam(value = "queryString", defaultValue = "") String queryString,
                                   @RequestParam(value = "go", defaultValue = "") String go
                                   ) {
        ModelAndView modelAndView = new ModelAndView();
        Map<String,String> message = new HashMap<String, String>();
        try {
            User user = null;
            user = userService.login(userName, password);
            user.setPassword("");
            this.addSession("USER", user);
            if (!StringUtil.isEmpty(queryString)) {
                if (queryString.startsWith("#")) {
                    queryString = queryString.substring(1);
                }
                go = go + "?" + queryString;
            }
            RedirectView redirectView = StringUtil.isEmpty(go) ? this.getRedirectView("page/user/content")
                                                               : new RedirectView(AppContext.getContextPath() + "/" + go);
            modelAndView.setView(redirectView);
        } catch (ParameterException parameterException) {
            message = parameterException.getErrorMessage();
            modelAndView.addObject("TIP_MESSAGE", message);
            modelAndView.setViewName("login");
        } catch (ServiceException serviceException) {
            int errorCode = serviceException.getCode();
            if (errorCode == 1000) {
                message.put("errorNameMessage", serviceException.getExceptionMessage());
            }
            if (errorCode == 1001) {
                message.put("errorPasswordMessage", serviceException.getExceptionMessage());
            }
            modelAndView.addObject("TIP_MESSAGE", message);
            modelAndView.setViewName("login");
        }
        this.removeSession("hiddens");
        return modelAndView;
    }

    @RequestMapping(value = "/content", method = RequestMethod.GET)
    public ModelAndView checkRoleType() {
        ModelAndView modelAndView = new ModelAndView();
        String roleType = AppContext.getContext().getUser().getRoleType();
        modelAndView.setView(this.getRedirectView(RoleMapUtil.getPageUri(roleType)));
        return modelAndView;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout() {
        ModelAndView modelAndView = new ModelAndView();
        this.removeSession("USER");
        modelAndView.setView(this.getRedirectView("page/home/init-data"));
        return modelAndView;
    }

    @RequestMapping(value = "/user-information", method = RequestMethod.GET)
    public ModelAndView editProfile() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user_information");
        return modelAndView;
    }
    
    @RequestMapping(value = "/all-users", method = RequestMethod.GET)
    public ModelAndView allUser() {
    	String keyWord="";
    	String currentPageStr="";
    	if (StringUtil.isEmpty(currentPageStr)) {
            currentPageStr = "1";
        }
        Integer currentPage = Integer.parseInt(currentPageStr);
        if (currentPage < 1) {
            currentPage = 1;
        }
        Pagination pagination = new Pagination();
        pagination.setCurrentPage(currentPage);
    	List<User> allUser = userService.getAllUser(pagination);
    	this.addSession("allUser", allUser);
    	this.addSession("pagination", pagination);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user_manage");
        return modelAndView;
    }

    @RequestMapping(value = "/submit-user", method = RequestMethod.POST)
    public ModelAndView saveProfile(
                                    @RequestParam(value = "userName", defaultValue = "") String userName,
                                    @RequestParam(value = "userSex", defaultValue = "") String userSex,
                                    @RequestParam(value = "loginName", defaultValue = "") String loginName,
                                    @RequestParam(value = "password", defaultValue = "") String password,
                                    @RequestParam(value = "repassword", defaultValue = "") String repassword,
                                    @RequestParam(value = "phone", defaultValue = "") String phone,
                                    @RequestParam(value = "address", defaultValue = "") String address,
                                    @RequestParam(value = "childName", defaultValue = "") String childName,
                                    @RequestParam(value = "childSex", defaultValue = "") String childSex,
                                    @RequestParam(value = "birthday", defaultValue = "") String birthday
                                    ) {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        user.setUserName(userName);
        user.setSex(userSex);
        user.setLoginName(loginName);
        user.setPassword(MD5Util.getEncryptPassword(password));
        user.setPhone(phone);
        user.setAddress(address);
        user.setRoleType("user");
        Child child = new Child();
        child.setName(childName);
        child.setSex(childSex);
        child.setBirthday(birthday);
        List<Child> childs = new ArrayList<Child>();
        childs.add(child);
        user.setChilds(childs);
        userService.createUser(user);
        this.addSession("FlahMessage", "注册成功!");
        modelAndView.addObject("FlahMessage", "注册成功!");
        this.addSession("hiddens", 1);
        modelAndView.setView(this.getRedirectView("page/home/init-data"));
        return modelAndView;
    }

    
    @RequestMapping(value = "/delete-user/{id}", method = RequestMethod.GET)
    public ModelAndView showProfile(@PathVariable String id) {
    	userService.deleteUser(Integer.parseInt(id));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setView(this.getRedirectView("page/user/all-users"));
        return modelAndView;
    }
}
