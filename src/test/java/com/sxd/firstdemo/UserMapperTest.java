package com.sxd.firstdemo;

import com.sxd.firstdemo.dao.UserInfoDao;
import com.sxd.firstdemo.model.UserInfo;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserMapperTest {
    @Autowired//18926069939
    private UserInfoDao userInfoDao;

    @Test
    public void testvalidateLogin(){
        String name = "wuguifu";
        Map params = new HashMap();
        params.put("name",name);
        UserInfo userInfo = userInfoDao.showUserInfo(params);
        if(userInfo == null){
            System.out.println("this member not in the group");
        }else{
            System.out.println("logining success ......");
        }
        Assert.assertEquals(userInfo.getName(),name);
    }

}
