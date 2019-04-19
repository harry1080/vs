package com.vshow.control.api.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

/**
 * 添加用户
 * @param account账号
 * @param password 密码
 * @param newaccount 新用户账号
 * @param newpassword 新用户密码
 * @param ocheck 审核状态  0需要审核 1不需要审核 2节目需要审核 3发布需要审核
 * @param name 昵称
 * @param email 邮箱
 * @param phone 手机
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiAddUserAction extends ActionSupport {

	private String password;
	private String account;
	private String content;
	
	private String newaccount;
	private String newpassword;
	private int ocheck;
	private String name;
	private String email;
	private String phone;

	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2操作成功3操作失败4用户被禁用

		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject(
				"sel_check_user_login", usparam);
		if (user == null) {
			code = "1";
		} else {
			if (user.getBan() == 0) {
				User u = new User();
				u.setAccount(newaccount);
				u.setPassword(newpassword);
				u.setOcheck(ocheck);
				u.setName(name);
				u.setEmail(email);
				u.setPhone(phone);
				u.setFatherid(user.getId());
				u.setPowerid(user.getPowerid());
				try {
					Integer cuid=(Integer)SqlConnect.getSqlMapInstance().insert("adduser", u);
					u.setId(cuid);
					u.setTkey(user.getTkey() + u.getId() + "_");
					SqlConnect.getSqlMapInstance().update("up_user_tkey", u);
					LogHandle.insertTheLog(LogType.type50, user.getId(),Constant.LOCAL.getA00705()+":" + u.getAccount(), 1,1);
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code="3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons1 = JSONArray.fromObject(map);

		content = jsons1.toString();
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getNewaccount() {
		return newaccount;
	}

	public void setNewaccount(String newaccount) {
		this.newaccount = newaccount;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public int getOcheck() {
		return ocheck;
	}

	public void setOcheck(int ocheck) {
		this.ocheck = ocheck;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}