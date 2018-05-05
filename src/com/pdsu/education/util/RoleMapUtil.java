package com.pdsu.education.util;

import java.util.HashMap;
import java.util.Map;

import com.pdsu.education.Constant;
/**
 * The class is used to seek the user role information.
 * */
public class RoleMapUtil {

    private static Map<String, String> roles = null;
    static {
        roles = new HashMap<String, String>();
        roles.put("user", "page/home/init-data");
        roles.put("admin", "page/admin/init-data");
    }
    /**
     * The method is used to get the role type by key.
     * @ user role type.
     * */
    public static String getPageUri(String roleType){
        return roles.get(roleType);
    }
}
