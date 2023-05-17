package com.java.serviec;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.entity.Student;
import com.java.repo.StudentRepo;
@Service
public class StudetnServie {

	@Autowired
	private StudentRepo repo;
	
	public String saveStudent(Student student) {
		Student save = repo.save(student);
		String ms= "";
		if(save != null)
			ms= "Data is saved.........";
		else
			ms="data isnot saved";
		return ms;
		
	}
	
	public List<Student> getAllStudent(){
		
		List<Student> findAll = repo.findAll();
		return findAll;
	}
}
