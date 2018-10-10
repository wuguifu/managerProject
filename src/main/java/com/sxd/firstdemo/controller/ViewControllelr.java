package com.sxd.firstdemo.controller;

import com.sxd.firstdemo.dao.UserInfoDao;
import com.sxd.firstdemo.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/view")
public class ViewControllelr {
    /**
     *
     */
    @Autowired
    private UserInfoDao userInfoDao;

    @RequestMapping(value = "/home")
    public String hello(){
        System.out.println("hello");
        return "hello";
    }
    @RequestMapping(value = "/login")
    public String login(){
        System.out.println("login ......");

        return "login";
    }
    @RequestMapping(value = "/validateLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map validateLogin(@RequestParam("username")String username, @RequestParam("password")String password){
        System.out.println("validateLogin ......");
        System.out.println("username:"+username+"   password:"+password);
        Map params = new HashMap();
        params.put("username",username);
        params.put("password",password);
        Map resutlMap = new HashMap();
        UserInfo userInfo = userInfoDao.showUserInfo(params);
        if(userInfo == null){
            System.out.println("this member not in the group");
            resutlMap.put("flag",false);
        }else{
            System.out.println("logining success ......");
            resutlMap.put("flag",true);
        }
        return resutlMap;
    }
    @RequestMapping(value = "/homepage")
    public String homepage(){
        System.out.println("homepage ......");
        return "homepage";
    }
    @RequestMapping(value = "/customInfoCfgView")
    public String customInfoCfgView(){
        System.out.println("customInfoCfgView ......");
        return "customInfoCfg";
    }
}
