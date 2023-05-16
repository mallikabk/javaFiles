package com.cms.queries;

public class QueryConstants {
	public static String insert_query = "insert  into custjsp values(?,?,?)";
	public static String row_query = "select * from custjsp";
	public static String SELECT_ONE_ROW = "select * from custjsp where cid = ?";
	public static String update_query = "update custjsp set cname=?,cadd=? where cid=?";

}
