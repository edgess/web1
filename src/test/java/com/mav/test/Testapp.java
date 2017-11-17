package com.mav.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mav.dao.Agent;
import com.mav.dao.ItMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")

public class Testapp {
	// private static Logger logger = Logger.getLogger(AppTest.class);

	@Autowired
	private ItMapper itMapper;
	@Autowired
	private Agent agent;

	// @Test
	// public void test1() {
	// List<Map<Object, Object>> map = new ArrayList<Map<Object, Object>>();
	// map = itMapper.getItById(1);
	// System.out.println(map);
	// }

	// @Test
	// public void test2() {
	// List<Map<Object, Object>> map = new ArrayList<Map<Object, Object>>();
	// map = itMapper.getAllItWithMap("W", "", "", "", "", "", "");
	// System.out.println(map);
	// }

	@Test
	public void test3() {
		List<Map<Object, Object>> map = new ArrayList<Map<Object, Object>>();
		map = agent.getDeptName();
		System.out.println(map);
	}

}
