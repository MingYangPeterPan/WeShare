package com.ws;

public class Constant {

    /**
     *Method Parameters Constant
     * */
    public static final String F = "F";
    public static final String P = "p";
    public static final String GO = "go";
    public static final String BLANK = "";
    public static final String MD5 = "MD5";
    public static final String COMMA = ",";
    public static final String COLON = ":";
    public static final String SLASH = "/";
    public static final String EQUAL = "=";
    public static final String ALPHA = "&";
    public static final String JSS = ".js";
    public static final String GET = "get";
    public static final String CSS = ".css";
    public static final String PNG = ".png";
    public static final String JPG = ".jpg";
    public static final String UTF = "UTF-8";
    public static final String SET_ATTRIBUTE = "setAttribute";
    public static final String GET_ATTRIBUTE = "getAttribute";
    public static final String REMOVE_ATTRIBUTE = "removeAttribute";
    public static final String INVALIDATE = "invalidate";

    public static final String CREATE = "create";
    public static final String LOGOUT = "logout";
    public static final String QUESTIONMARK = "?";
    public static final String STUDENT = "student";
    public static final String TEACHER = "teacher";
    public static final String SUCCESS = "success";
    public static final String ENCODING = "encoding";
    public static final String USERNAME = "userName";
    public static final String PASSWORD = "password";
    public static final String SYS_ADMIN = "sysAdmin";
    public static final String GO_QUESTIONMARK = "?go=";
    public static final String ATTRIBUTE = "attribute";
    public static final String QUERYSTRING = "queryString";
    public static final String APP_CONTEXT_SESSION = "appSession";
    public static final String QUESTIONS_JSP = "questions";
    public static final String USER_DAO_CONFIG = "userDao";
    public static final String TIP_MESSAGES = "TIP_MESSAGE";
    public static final String CONTENT_ADMIN = "contenAdmin";
    public static final String FALSH_MESSAGE = "FlahMessage";
    public static final String UPDATEUSER_METHOD = "updateUser";
    public static final String UPDATE_SUCCESS = "update success!";
    public static final String DELETE_SUCCESS = "delete success!";
    public static final String CREATE_SUCCESS = "success operation!";
    public static final String QUESTION_DAO_CONFIG = "questionDao";
    public static final String USER_SERVICE_CONFIG = "userService";
    public static final String SAVEQUESTION_METHOD = "saveQuestion";
    public static final String CONNECTIONHOLDER = "ConnectionHolder";
    public static final String UPDATEQUESTION_METHOD = "updateQuestion";
    public static final String DELETEQUESTION_METHOD = "deleteQuestionById";
    public static final String QUESTION_SERVICE_CONFIG = "questionService";
    public static final String ERROR_NAME_MESSAGE = "errorNameMessage";
    public static final String SYSTEM_PROPERTIES = "system.properties";
    public static final String NOT_NEED_LOGIN_PAGE = "notNeedLoginPages";
    public static final String ERROR_PASSWORD_MESSAGE = "errorPasswordMessage";

    //If user input error userName,error message will save a map,1000 is a key.
    public static final Integer NAME_ERROR_CODE = 1000;
    //If user input error password,error message will save a map,1001 is a key.
    public static final Integer PASSWORD_ERROR_CODE = 1001;
    //The current page default value for String type.
    public static final String CURRENTPAGE_STRING = "1";
    //The current page default value for Integer type.
    public static final Integer DEFAULT_CURRENTPAGE = 1;
    public static final Integer ZERO = 0;


    /**
     * URL Constant.
     * */
    public static final String APP_URL_PREFIX = "page";
    public static final String APP_URL_USER_PREFIX = "/page/user";
    public static final String APP_URL_QUESTION_PREFIX = "/page/question";
    public static final String APP_URL_EXAM_PREFIX = "/page/exam";
    public static final String LOGIN_URL_PAGE = "user/login";
    public static final String LOGIN_CONTEXT = "page/user/login";
    public static final String USER_URL_PAGE = "page/user/content";
    public static final String QUESTION_LIST = "page/question/question-list";
    public static final String USER_PROFILE_LIST = "page/user/profile-list";
    public static final String QUESTION_SAVE_URL_PAGE = "question/save-question";
    public static final String QUESTION_UPDATE_URL_PAGE = "question/update-question";
    public static final String USER_URL_UPDATE_PROFILE = "user/save-profile";
    public static final String EXAM_LIST_URL = "/exam-list";
    public static final String CREATE_EXAM_LIST_URL = "/create-exam";

    /**
     * Test Constant.
     * */
    public static final String TEST_CONTEXT_PATH = "/OES";
    public static final String TEST_USER_CONTROLLER = "userController";
    public static final String TEST_USER_NAME = "gavin";
    public static final String TEST_ERROE_USER_NAME = "gavin1";
    public static final String TEST_USER_PASSSWORD = "456789";
    public static final String TEST_ERROR_PASSSWORD = "123456";
    public static final String TEST_USER_URL_CONTENT = "user/content";
    public static final String TEST_APPLICATION_XML = "classpath:applicationContext.xml";
    public static final String TEST_OES_MVC = "classpath:ws-mvc.xml";

    /**
     * Log appender
     * */
    public static final String DOLLAR_M = "$M$";
    public static final String NETTY = "netty";
    public static final String HASHTAG_T = "#T#";
    public static final String HASHTAG_M = "$T$ #M#";
    public static final String TIMEFORMAT = "MM/DD HH:MM:SS";
    public static final String DATEFORMAT = "yyyy-MM-dd HH:mm:ss";

    /**
     *XML Parameters Constant
     * */
    public static final String ID = "id";
    public static final String HASH = "#";
    public static final String PERCENT_SIGN = "%";
    public static final String SET = "set";
    public static final String REF = "ref";
    public static final String BEAN = "bean";
    public static final String VIEW = "view";
    public static final String VALUE = "value";
    public static final String SCOPE = "scope";
    public static final String INPUT = "input";
    public static final String FALSE = "false";
    public static final String ACTION = "action";
    public static final String METHOD = "method";
    public static final String RESULT = "result";
    public static final String GET_METHOD = "GET";
    public static final String SESSION = "session";
    public static final String HADlOGIN = "hadLogin";
    public static final String KEYWORD = "keyword";
    public static final String PAGESIZE = "pageSize";
    public static final String OFFSET = "offset";
    public static final String CLASS_PATH = "class";
    public static final String BEAN_XML = "bean.xml";
    public static final String PROPERTY = "property";
    public static final String DISPATCH = "dispatch";
    public static final String SINGLETON = "singleton";
    public static final String PARAMETER = "parameter";
    public static final String ACTION_XML = "action.xml";
    public static final String HTTPMETHOD = "httpMethod";
    public static final String VIEWPARAMETER = "viewParameter";
    public static final String PAGE_PATH = "com.augmentum.oes.service.impl";

    /**
     *Prompt information constants.
     * */
    public static final String NAME_BLANK = "user name is required";
    public static final String ERROR = "Wrong username or password";
    public static final String PASSWORD_ERROR = "Incorrect password";
    public static final String PASSWORD_BLANK = "password is required";
    public static final String USERNAME_NO_EXIST = "Username does not exist";

    /**
     *User property Constants.
     * */
    public static final String NAME = "name";
    public static final String USER = "USER";
    public static final String PK_ID = "pk_id";
    public static final String EMAIL = "email";
    public static final String GENDER = "gender";
    public static final String ADDRESS = "address";
    public static final String ROLETYPE = "roletype";
    public static final String FULL_Name = "fulle_name";
    public static final String DISPLAY_NAME = "display_name";
    public static final String TELEPHONE_NUMBER = "telephone_number";
    public static final String TITLE = "title";
    public static final String OPTION_A = "option_a";
    public static final String OPTION_B = "option_b";
    public static final String OPTION_C = "option_c";
    public static final String OPTION_D = "option_d";
    public static final String ANSWER = "answer";
    public static final String CREATED_BY = "created_by";
    public static final String CREATED_TIME = "created_time";
    public static final String MODIFIED_BY = "modified_by";
    public static final String MODIFIED_TIME = "modified_time";
    public static final String COUNT = "count";
    public static final String PAGE_SIZE = "pagination.pageSize";
    public static final String QUESTION_ID = "question_id";

    /**
     * Database connection constant.
     * */
    public static final String DRIVER = "jdbc.driver";
    public static final String JDBC_USER = "jdbc.user";
    public static final String PROPERTIES = "jdbc.properties";
    public static final String JDBC_PASSWORD = "jdbc.password";
    public static final String CONNECTION = "connection.string";

    /**
     * DaoImplement constant.
     * */
    public static final String SQL_ID_QUESTION_GET_ALL_QUESTIONS = ".queryAllQuestions";
    public static final String SQL_ID_QUESTION_GET_QUESTION_AMOUNT = ".getQuestionCount";
    public static final String SQL_ID_QUESTION_CREATE_QUESTION = ".createQuestion";
    public static final String SQL_ID_QUESTION_GET_QUESTIONS_BY_ID = ".getQuestionById";
    public static final String SQL_ID_QUESTION_UPDATE_QUESTION = ".updateQuestion";
    public static final String SQL_ID_QUESTION_DELETE_QUESTION = ".deletedQuestion";
    public static final String SQL_ID_USER_GET_UESR_BY_NAME = ".getUserByName";
    public static final String SQL_ID_USER_UPDATE_UESR_BY_ID = ".updateUser";
    public static final String SQL_ID_USER_UPDATE_UESR_NO_PASSWORD = ".updateUserNoPassword";

    /**
     * URI constant
     * */

    public static final String LOGIN_PAGE = "/login";
    public static final String LOGIN_JSP = "login";
    public static final String ROLE_PAGE = "/content";
    public static final String LOGOUT_PAGE = "/logout";
    public static final String STATIC_URL = "static_url";
    public static final String EDIT_PROFILE_PAGE = "/edit-profile";
    public static final String SAVE_PROFILE_PAGE = "/save-profile";
    public static final String PROFILE_LIST_PAGE = "/profile-list";
    public static final String CREATE_QUESTION_PAGE = "create-question";
    public static final String SAVE_QUESTION_PAGE = "save-question";
    public static final String UPDATE_QUESTION_PAGE = "update-question";
    public static final String DELETE_QUESTION_PAGE = "delete-question";
    public static final String QUESTION_LIST_PAGE = "question-list";


    /**
     * Address constants.
     * */
    public static final String KEY = "key";
    public static final String SUFFIX = "suffix";
    public static final String LOGIN_WORD = "login";
    public static final String ANSWER_A = "answer_a";
    public static final String ANSWER_B = "answer_b";
    public static final String ANSWER_C = "answer_c";
    public static final String ANSWER_D = "answer_c";
    public static final String QUESTION = "Question";
    public static final String CURRENT = "currentPage";
    public static final String QUESTIONS = "questions";
    public static final String ACTION_SUFFIX = ".action";
    public static final String PAGINATION = "pagination";
    public static final String LOGIN_GO = "/user/login";
    public static final String LOGIN = "login";
    public static final String ERROR_PAGE = "static/html/500.html";
    public static final String PROFILE_ACTION = "profile.action";
    public static final String QUESTION_TITTLE = "question_title";
    public static final String CONTENT_SERVICE = "/content.action";
    public static final String CREATE_EXAM = "create_exam";
    public static final String STUDENT_HOME = "student_home";
    public static final String TEACHER_HOME = "teacher_home";
    public static final String EDIT_PROFILE = "edit_profile";
    public static final String CREATE_QUESTION = "create_question";
    public static final String QUESTION_MANAGE = "question_manage";
    public static final String EDIT_QUESTION_PAGE = "edit_question";
    public static final String USER_MANAGE_HOME = "user_manage_home";
    public static final String EXAM_MANAGE_HOME = "exam_manage_home";
    public static final String PROFILE_MANAGE = "profile_manage_home";
    public static final String CONTENT_MANAGE_HOME = "content_manage_home";
}
