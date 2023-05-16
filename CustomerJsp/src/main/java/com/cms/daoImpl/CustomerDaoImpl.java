package com.cms.daoImpl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cms.dao.CustomerDao;
import com.cms.pojo.Customer;
import com.cms.queries.QueryConstants;
import com.cms.utility.ConnectionUtility;

public class CustomerDaoImpl implements CustomerDao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean register(Customer cus) {
		int count = 0;
		boolean flag = false;
		try {
			con = ConnectionUtility.getConnection();
			ps = con.prepareStatement(QueryConstants.insert_query);
			ps.setInt(1, cus.getCid());
			ps.setString(2, cus.getName());
			ps.setString(3, cus.getAdd());
			count = ps.executeUpdate();
			if (count != 0) {
				flag = true;
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ConnectionUtility.closeConnection(con, ps);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;
	}

	public List<Customer> viewall() {

		List<Customer> clist = new ArrayList<Customer>();
		try {
			con = ConnectionUtility.getConnection();
			ps = con.prepareStatement("select * from custjsp");
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer customer = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3));
				clist.add(customer);
			}
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return clist;
	}

	public int update(Customer c) {
		int c1 = 0;

		try {
			con = ConnectionUtility.getConnection();
			ps = con.prepareStatement(QueryConstants.update_query);
			ps.setString(1, c.getName());
			ps.setString(2, c.getAdd());
			ps.setInt(3, c.getCid());
			c1 = ps.executeUpdate();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return c1;
	}

	public int delete(int cid) {

		return 0;
	}

	public Customer edit(int cid) {
		Customer c1 = new Customer();
		try {
			con = ConnectionUtility.getConnection();
			ps = con.prepareStatement(QueryConstants.SELECT_ONE_ROW);
			ps.setInt(1, cid);
			rs = ps.executeQuery();
			while (rs.next()) {
				c1.setCid(rs.getInt(1));
				c1.setName(rs.getString(2));
				c1.setAdd(rs.getString(3));
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return c1;
	}

}
