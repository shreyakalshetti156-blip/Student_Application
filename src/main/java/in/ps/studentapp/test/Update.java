package in.ps.studentapp.test;

import java.util.Scanner;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOImpl;
import in.ps.studentapp.dto.Student;

public class Update {
	public static void update(Student s) {
		Scanner sc=new Scanner(System.in);
		StudentDAO sdao=new StudentDAOImpl();
		
		System.out.println("Enter the field to be updated:");
		System.out.println("1. NAME");
		System.out.println("2. PHONE");
		System.out.println("3. MAIL");
		int choice=0;
		choice=sc.nextInt();
		
		switch(choice) {
		
		}
		
	}
}
