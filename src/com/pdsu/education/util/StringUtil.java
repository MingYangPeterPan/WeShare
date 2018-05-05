package com.pdsu.education.util;

import com.pdsu.education.Constant;

/**
 * The class is used to jump is empty.
 * */
public class StringUtil {

    /**
     * If is empty,return true,
     * else return false.
     * @return boolean
     * */
    public static Boolean isEmpty(String data) {
        if (data == null || data.equals(Constant.BLANK)) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }
}
