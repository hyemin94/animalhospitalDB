package com.multi.animalhospitalDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.multi.animalhospitalVO.Medical;
import com.multi.animalhospitalVO.PharmacyVO;

@Component("pharmacy")
public class PharmacyDAO implements MedicalDAO {

	@Override
	public ArrayList<Medical> searchAddress(String a1, String a2) {
		ArrayList<Medical> list = new ArrayList<Medical>(); 		
		try {
			String sql = "select * from pharmacy where address_1=? and address_2=?";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, a1);
			pt.setString(2, a2);
			ResultSet rs = pt.executeQuery();
			while(rs.next()) {
				Medical vo = new PharmacyVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setName(rs.getString("name"));
				vo.setNameAddress(rs.getString("name_Address"));
				vo.setSeg(rs.getString("seg"));
				vo.setStatusCode(rs.getString("status_Code"));
				vo.setStatusName(rs.getString("status_Name"));
				vo.setTel(rs.getString("tel"));
				vo.setX(rs.getString("X"));
				vo.setY(rs.getString("Y"));
				list.add(vo);
			}
			pt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<String> searchCounty(String a1) {
		ArrayList<String> list = new ArrayList<String>(); 		
		try {
			String sql = "select distinct address_2 from pharmacy where address_1=?";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, a1);
			ResultSet rs = pt.executeQuery();
			while(rs.next()) {
				String county=rs.getString("address_2");
				list.add(county);
			}
			pt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
