package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.dao.TestDAO;

@Service(value="testService")
public class TestServiceImple implements TestService{
	
	@Autowired
	private TestDAO testDAO;
	
	@Override
	public int test1(int bno) {
		int result = testDAO.test1(bno);
		System.out.println(result);
		return result;
	}
	
	
}
