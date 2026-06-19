package in.ps.studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.studentapp.connection.Connector;
import in.ps.studentapp.dto.Student;

public class StudentDAOImpl implements StudentDAO {

	private Connection con;
	
	public StudentDAOImpl() {
		this.con=Connector.requestConnection();
	}
	
	@Override
	public boolean insertStudent(Student s) {
		String query="INSERT INTO STUDENT VALUES (0,?,?,?,?,SYSDATE())";
		Integer i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getPassword());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean updateStudent(Student s) {
		String query="UPDATE STUDENT SET NAME=?,PHONE=?,MAIL=?,PASSWORD=? WHERE ID=?";
		Integer i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getMail());
			ps.setString(4, s.getPassword());
			ps.setInt(5,s.getId());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0){
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean deleteStudent(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override  //login
	public Student getStudent(String mail, String password) {
		String query="SELECT * FROM STUDENT WHERE MAIL=? AND PASSWORD=?";
		Student s=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				
				s.setId(rs.getInt("id"));	
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone")); 
				s.setMail(rs.getString("mail"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
	}

	@Override
	public Student getStudent(long phone, String mail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override  //This method is only for admin dashboard 
	public ArrayList<Student> getStudent() {
		String query="SELECT * FROM STUDENT WHERE ID!=1";
		//SID=1 AS ADMIN
		ArrayList<Student> studentList=new ArrayList<>();
		Student s=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setMail(rs.getString("mail"));
				s.setPassword(rs.getString("password"));
				s.setDate(rs.getString("date"));
				studentList.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return studentList;
	}

	@Override
	public Student getStudentById(Integer id) {
		String query="SELECT * FROM STUDENT WHERE ID=?";
		Student s=null;
		try {
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					s=new Student();
					s.setId(rs.getInt("id"));
					s.setName(rs.getString("name"));
					s.setMail(rs.getString("mail"));
					s.setPhone(rs.getLong("phone"));
					s.setPassword(rs.getString("password"));
					s.setDate(rs.getString("date"));
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return s;
	}

	
}
