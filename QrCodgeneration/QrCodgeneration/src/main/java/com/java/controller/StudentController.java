package com.java.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.WriterException;
import com.java.entity.Student;
import com.java.qrgenerater.QrGenerater;
import com.java.serviec.StudetnServie;

@RestController
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudetnServie service;

	@GetMapping("/hai")
	public String hai() {
		return "hi ";
	}

	@PostMapping("/addstudent")
	public ResponseEntity<String> saveData(@RequestBody Student student) {
		String saveStudent = service.saveStudent(student);
		return ResponseEntity.ok(saveStudent);

	}

	@GetMapping("/getstudent")
	public ResponseEntity<List<Student>> getAllStudent() throws WriterException, IOException {
		List<Student> allStudent = service.getAllStudent();
		if (allStudent.size()!=0) {
			for (Student stu : allStudent) {

				QrGenerater.generateQRCode(stu);
				System.out.println("Qr_is generated");
			}
		}
		return ResponseEntity.ok(allStudent);
	}
}
