package com.pdsu.education.model;

import java.util.List;

/**
 * USer model class
 */
public class User {

    private Integer id;
    private String userName;
    private String loginName;
    private String password;
    private String phone;
    private String address;
    private Boolean deleted;
    private String sex;
    private String roleType;
    private String image;
    private List<Child> childs;
    private Integer childCount;
    private String loginTime;
    
	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public List<Child> getChilds() {
		return childs;
	}
    
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getChildCount() {
		if(childs != null && childs.size()>0){
			return childs.size();
		}else{
			return 0;
		}
	}

	public void setChildCount(Integer childCount) {
		this.childCount = childCount;
	}

	public void setChilds(List<Child> childs) {
		this.childs = childs;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    

    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	

    public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString(){
        return loginName + "," + userName + "," + password+ "," + sex + "," + address + "," + phone + image;
    }
}
