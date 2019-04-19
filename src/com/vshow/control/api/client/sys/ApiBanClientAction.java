package com.vshow.control.api.client.sys;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.client.play.ClientPlayHandle;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.Log;
import com.vshow.control.data.Result;
import com.vshow.control.data.Scene;
import com.vshow.control.data.Send;
import com.vshow.control.data.ShutNew;
import com.vshow.control.data.User;
import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.ResultType;
import com.vshow.control.tool.SqlConnect;


/**
 * 禁用终端
 * @param account账号
 * @param password 密码 
 * @param state 是否禁用 0否 1是 
 * @param cids 终端id
 * @author cyn
 * @version 6.1 API接口
 *
 */
public class ApiBanClientAction extends ActionSupport{

	
	private String password;
	private String account;
	private String content;
	
	private int state;
	private String cids;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String code = "0"; // 1账户或者密码错误 2查询成功3未查询到数据4用户被禁用

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
				String[] cid = cids.split("\\_");
				Client client;
				try{
					Log log = LogHandle.insertTheLogSend(LogType.type94, user.getId(),Constant.LOCAL.getA00765(),1);
					String sendkey = log.getSendkey();
					
					String msg = "49+sendkey!" + sendkey + "%" + state;   //0否   1禁用
					log.setMsg(msg);
					SqlConnect.getSqlMapInstance().update("upd_log_send_msg", log);
					MyMsg mymsg;
					
			        for (int i = 0; i < cid.length; i++) {
			        	client=new Client();
			        	client.setId(Integer.parseInt(cid[i]));
			        	client.setDisabledstate(state);
			        	SqlConnect.getSqlMapInstance().update("update_disabled", client);
			        	
			        	//获取终端信息
			        	client=(Client)SqlConnect.getSqlMapInstance().queryForObject("sel_client_byid", Integer.parseInt(cid[i]));
						if (client.getServerid() == 0) {
							Mlt mt = Constant.messageMap.get(client.getMark());
							if (mt != null) {
								mymsg = new MyMsg();
								mymsg.msg = msg;
								mymsg.sendkey = log.getSendkey();
								mt.allmsg.add(mymsg);
							}
						}
			        }
					code = "2";
				} catch (Exception e) {
					// TODO: handle exception
					code = "3";
				}
			} else {
				code = "4";
			}
		}

		map.put("code", code);
		JSONArray jsons = JSONArray.fromObject(map);
	
		content = jsons.toString();
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCids() {
		return cids;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public void setCids(String cids) {
		this.cids = cids;
	}
	
}