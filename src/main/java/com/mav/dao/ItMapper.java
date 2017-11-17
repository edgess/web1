package com.mav.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ItMapper {

	List<Map<Object, Object>> getAllItWithMap(@Param("status") String a, @Param("type") String b,
			@Param("belong") String c, @Param("equip_no") String d, @Param("username") String e,
			@Param("dept_id") String f, @Param("sn") String g, @Param("pgstr") Integer h, @Param("pgsiz") Integer i);

	Integer getAllItWithMapCount(@Param("status") String a, @Param("type") String b, @Param("belong") String c,
			@Param("equip_no") String d, @Param("username") String e, @Param("dept_id") String f,
			@Param("sn") String g);

	List<Map<Object, Object>> getItById(@Param("id") Integer id);

	@Transactional
	void updateByPrimaryKeySelective(@Param("status") String a, @Param("type") String b, @Param("belong") String c,
			@Param("equip_no") String d, @Param("username") String e, @Param("dept_id") String f, @Param("sn") String g,
			@Param("model") String h, @Param("price") Integer i, @Param("memo") String j, @Param("startuse") Date k,
			@Param("id") Integer l);

	@Transactional
	void insertSelective(@Param("status") String a, @Param("type") String b, @Param("belong") String c,
			@Param("equip_no") String d, @Param("username") String e, @Param("dept_id") String f, @Param("sn") String g,
			@Param("model") String h, @Param("price") Integer i, @Param("memo") String j, @Param("startuse") Date k,
			@Param("id") Integer l);

	Integer getItMaxId();

	void delItByID(@Param("id") Integer id);

}
