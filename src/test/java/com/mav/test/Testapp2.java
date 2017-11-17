package com.mav.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class Testapp2 {
	@Test
	public void test() throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String p9 = "888";
		String p11 = "2000-01-01";
		Integer p9i = 0;
		Date p11d = format.parse("1980-01-01");
		if (p9 != null) {
			p9i = Integer.parseInt(p9);
		}
		if (p11 != null) {
			p11d = format.parse(p11);
		}

		System.out.println(p9i.getClass() + " p9i " + p9i);
		System.out.println(p11d.getClass() + " p11d " + p11d);
	}
}
