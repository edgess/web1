package com.mav.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("flag")
public class LoginCtl {

	@Autowired
	private com.mchange.v2.c3p0.ComboPooledDataSource dataSource3;

	@RequestMapping("/login")
	public String login(String user, String pawd, Map<String, Object> map) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource3);

		// String sql = "SELECT * from user where username=? and password=?
		// limit 1";
		String sql = "SELECT id,name from Operator_info where login_name=? and pwd=?";

		List<Map<String, Object>> map2 = new ArrayList<Map<String, Object>>();
		map2 = jdbcTemplate.queryForList(sql, user, pawd);
		if (map2.isEmpty()) {
			map.put("flag", "err");
			return "login";
		} else {
			map.put("flag", "admin");
			return "index";
		}
	}
}
