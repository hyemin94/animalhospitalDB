package com.multi.animalhospitalDAO;

import java.util.ArrayList;

import com.multi.animalhospitalVO.Medical;

public interface MedicalDAO {
	public ArrayList<Medical> searchAddress(String a1, String a2);

	ArrayList<String> searchCounty(String a1);
}
