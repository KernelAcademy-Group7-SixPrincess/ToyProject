package org.spring.example;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.example.accommodation.mapper.AccMapper;
import org.spring.example.accommodation.domain.Acc;
import org.spring.example.accommodation.mapper.AccMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/applicationContext.xml"})
public class AccTest {

    @Autowired
    private AccMapper accMapper;

    @Test
    public void testFindAll() {
        List<Acc> accList = accMapper.findAll();
        for (Acc acc : accList) {
            System.out.println(acc);
        }
    }
}