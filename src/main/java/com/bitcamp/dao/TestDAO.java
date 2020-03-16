package com.bitcamp.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
	public int test1(int bno);
}
