package com.pdsu.education.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pdsu.education.model.AgeRange;
import com.pdsu.education.model.EducationType;
import com.pdsu.education.service.SystemService;



@Controller
@RequestMapping("/page/system")
public class SystemSettingController extends BaseController {
	
	@Autowired
    private SystemService systemService;

    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }
	
	@RequestMapping(value = "/type-setting", method = RequestMethod.GET)
    public ModelAndView getInitData() {
		List<AgeRange> allAgeRange = systemService.getAllAgeRange();
		this.addSession("all_ageRange", allAgeRange);
		List<EducationType> noSelectType = systemService.getNoSelectType(allAgeRange.get(0).getId());
        List<EducationType> selectType = systemService.getSelectType(allAgeRange.get(0).getId());
        this.addSession("noSelectType", noSelectType);
        this.addSession("selectType", selectType);
		ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("type_setting");
        return modelAndView;
    }
	
	@RequestMapping(value = "/type-setting-change/{id}", method = RequestMethod.GET)
	@ResponseBody
    public Map<String, Object> getData(@PathVariable String id) {
		Integer rangeId = Integer.parseInt(id);
		List<EducationType> noSelectType = systemService.getNoSelectType(rangeId);
        List<EducationType> selectType = systemService.getSelectType(rangeId);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("noSelectType", noSelectType);
        data.put("selectType", selectType);
        return data;
    }
	
	@RequestMapping(value = "/type-change/{rangeId}/{type}/{typeId}", method = RequestMethod.GET)
    public void updateType(@PathVariable String rangeId,
    		               @PathVariable String type,
    					   @PathVariable String typeId) {
		systemService.upateEducationType(Integer.parseInt(rangeId), Integer.parseInt(type), Integer.parseInt(typeId));
    }
}
