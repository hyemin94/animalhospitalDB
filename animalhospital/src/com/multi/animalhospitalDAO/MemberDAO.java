package com.multi.animalhospitalDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.multi.animalhospitalVO.MemberVO;

public class MemberDAO {

	public boolean getMember(String id, String password) {
		boolean flag = false;
		try {
			String sql = "select id, password from signup where id= ? ";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			ResultSet rs = pt.executeQuery();
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					flag = true;
				} else
					flag = false;
			}
			rs.close();
			pt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean insertMember(String id, String name, String password) {
		boolean result = false;
		try {
			String sql = "select * From signup where id= ? ";
			String sql2 = "insert into signup values(?, ?, ?)";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			// select
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			ResultSet rs = pt.executeQuery();
			System.out.println(id);
			if (rs.next()) {
				result = false;
			}else {
				result = true;
			}
			
			PreparedStatement pt2 = con.prepareStatement(sql2);

			pt2.setString(1, name);
			pt2.setString(2, id);
			pt2.setString(3, password);
			
			int inserRow = pt2.executeUpdate();
			System.out.println(result);
			if (result == true) {
				if (inserRow == 1) {
					result = true;
				} else {
					result = false;
				}
			}
			pt.close();
			pt2.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}