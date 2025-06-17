package org.spring.example;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.domain.UserTest;
import org.spring.example.mapper.UserMapperTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml"})
public class MyBatisTest {

    @Autowired
    private UserMapperTest userMapperTest;

    @Test
    public void testFindAll() {
        List<UserTest> userList = userMapperTest.findAll();
        for (UserTest user : userList) {
            System.out.println(user.getUser_id() + " - " + user.getName() + " - " + user.getEmail());
        }
    }
}
