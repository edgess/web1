package com.mav.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mav.dao.Agent;
import com.mav.dao.ItMapper;

@Controller
public class Control {

	@Autowired
	private ItMapper itMapper;
	@Autowired
	private Agent agent;

	@RequestMapping("/list")
	public String searchsent(
			@RequestParam(value = "p1", required = false, defaultValue = "")String p1, 
			@RequestParam(value = "p2", required = false, defaultValue = "")String p2, 
			@RequestParam(value = "p3", required = false, defaultValue = "")String p3, 
			@RequestParam(value = "p4", required = false, defaultValue = "")String p4, 
			@RequestParam(value = "p5", required = false, defaultValue = "")String p5, 
			@RequestParam(value = "p6", required = false, defaultValue = "")String p6, 
			@RequestParam(value = "p7", required = false, defaultValue = "")String p7,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") String pageNoStr,
			@RequestParam(value = "edge", required = false, defaultValue = "") String edge,
			Map<String, Object> map){
		// 单页显示数设置
		int pgsiz = 20;
		// 页数判断
		int pgstr = 1;
		try {
			pgstr = Integer.parseInt(pageNoStr);
			if (pgstr < 1) {
				pgstr = 1;
			}
		} catch (Exception e) {
		}
		// 分页带参查询数据
		List<Map<Object, Object>> page = new ArrayList<Map<Object, Object>>();
		page = itMapper.getAllItWithMap(p1, p2, p3, p4, p5, p6, p7, (pgstr - 1) * pgsiz, pgsiz);
		// 带参数据总数
		int resultCount = itMapper.getAllItWithMapCount(p1, p2, p3, p4, p5, p6, p7);
		// 查部门
		List<Map<Object, Object>> page2 = new ArrayList<Map<Object, Object>>();
		page2 = agent.getDeptName();
		// 回显map
		Map<Object, Object> page3 = new HashMap<Object, Object>();
		page3.put("p1", p1);
		page3.put("p2", p2);
		page3.put("p3", p3);
		page3.put("p4", p4);
		page3.put("p5", p5);
		page3.put("p6", p6);
		page3.put("p7", p7);
		// 分页数据
		page3.put("pageNo", pageNoStr);
		page3.put("resultCount", resultCount);
		int pageCount = (resultCount + pgsiz - 1) / pgsiz;
		page3.put("pageCount", pageCount);
		// 插入返回map中
		map.put("page", page);
		map.put("page2", page2);
		map.put("page3", page3);
		return "list";
	}

	@RequestMapping("/edit")
	public String edit(String id, Map<String, Object> map) {
		// id号强转
		int idi = 0;
		if (id != null) {
			idi = Integer.parseInt(id);
		}
		// 根据id取纪录
		List<Map<Object, Object>> page = new ArrayList<Map<Object, Object>>();
		page = itMapper.getItById(idi);
		map.put("page", page);
		// 取部门
		List<Map<Object, Object>> page2 = new ArrayList<Map<Object, Object>>();
		page2 = agent.getDeptName();
		map.put("page2", page2);
		return "edit";
	}

	@RequestMapping("/doedit")
	public String doedit(String p0, String p1, String p2, String p3, String p4, String p5, String p6, String p7,
			String p8, String p9, String p10, String p11) throws ParseException {
		// System.out.println(p1 + "-" + p2 + "-" + p3 + "-" + p4 + "-" + p5 +
		// "-" + p6 + "-" + p7 + "-" + p8 + "-" + p9
		// + "-" + p10 + "-" + p11);
		// id号强转
		int p0i = Integer.parseInt(p0);
		// 默认日期设定
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// 强转日期
		Date p11d = format.parse("1980-01-01");
		// 价格强转
		int p9i = 0;
		if (p9 != "") {
			p9i = Integer.parseInt(p9);
		}
		if (p11 != "") {
			p11d = format.parse(p11);
		}
		// sql执行
		itMapper.updateByPrimaryKeySelective(p1, p2, p3, p4, p5, p6, p7, p8, p9i, p10, p11d, p0i);
		return "redirect:/list";
	}

	@RequestMapping("/add")
	public String add(Map<String, Object> map) {
		// 取部门
		List<Map<Object, Object>> page2 = new ArrayList<Map<Object, Object>>();
		page2 = agent.getDeptName();
		// 返回页面
		map.put("page2", page2);
		return "add";
	}

	@RequestMapping("/doadd")
	public String doadd(String p1, String p2, String p3, String p4, String p5, String p6, String p7, String p8,
			String p9, String p10, String p11 ) throws ParseException {
		// 默认日期设定
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date p11d = format.parse("1980-01-01");
		if (p11 != "") {
			p11d = format.parse(p11);
		}
		// 价格强转
		int p9i = 0;
		if (p9 != "") {
			p9i = Integer.parseInt(p9);
		}
		// 设定默认设备号
		if (p4 == "") {
			p4 = "satctemp";
		}
		// 取最大id号
		Integer p0i = itMapper.getItMaxId() + 1;
		itMapper.insertSelective(p1, p2, p3, p4, p5, p6, p7, p8, p9i, p10, p11d, p0i);
//		System.out.println("add" +"-"+p1 +"-"+ p2 +"-"+ p3 +"-"+ p4 +"-"+ p5 +"-"+ p6);

		return "forward:/list";
//		return "redirect:/list";
	}

	@RequestMapping("/del")
	public String del(String pagedel) {
		int p9i = Integer.parseInt(pagedel);
		itMapper.delItByID(p9i);
		// 带数据回现
		return "forward:/list";
	}
}
