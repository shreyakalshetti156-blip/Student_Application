package in.ps.studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.studentapp.connection.Connector;
import in.ps.studentapp.dto.Courses;

public class CoursesDAOImpl implements CoursesDAO{
	private Connection con;
	
	public CoursesDAOImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public boolean insertCourse(Courses c) {
		String query="INSERT INTO COURSES VALUES (0,?,?,?,?,?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,c.getCourseName());
			ps.setString(3,c.getCategory());
			ps.setString(3,c.getCourseInfo());
			ps.setInt(4,c.getMonths());
			ps.setDouble(5,c.getFees());
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
	public boolean updateCourse(Courses c) {
		String query="UPDATE COURSES SET CourseName=?,CourseInfo=?,category=?,Month=?,Fees=? WHERE CourseId=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,c.getCourseName());
			ps.setString(2, c.getCategory());
			ps.setString(3,c.getCourseInfo());
			ps.setInt(4,c.getMonths());
			ps.setDouble(5,c.getFees());
			ps.setInt(6,c.getCourseId());
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
	public boolean deleteCourse(int CourseId) {
		String query="DELETE FROM COURSES WHERE CourseId=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,CourseId);
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
	public Courses getCourses(int courseId) {
		Courses c=null;
		String query="SELECT * FROM COURSES WHERE COURSE_ID=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,courseId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Courses();
				c.setCourseId(rs.getInt("course_Id"));
				c.setCourseName(rs.getString("course_Name"));
				c.setCategory(rs.getString("category"));
				c.setCourseInfo(rs.getString("course_Info"));
				c.setMonths(rs.getInt("months"));
				c.setFees(rs.getDouble("fees"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public ArrayList<Courses> getCourses() {
		ArrayList<Courses> courses=new ArrayList<Courses>();
		Courses c=null;
		String query="SELECT * FROM COURSES";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Courses();
				c.setCourseId(rs.getInt("course_Id"));
				c.setCourseName(rs.getString("course_Name"));
				c.setCategory(rs.getString("category"));
				c.setCourseInfo(rs.getString("course_Info"));
				c.setMonths(rs.getInt("months"));
				c.setFees(rs.getDouble("fees"));
				courses.add(c);
				System.out.println("courses added!");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courses;
	}

	@Override
	public ArrayList<Courses> getCoursesByCategory(String category) {
		ArrayList<Courses> courses=new ArrayList<Courses>();
		Courses c=null;
		String query="SELECT * FROM COURSES WHERE CATEGORY=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, category);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Courses();
				c.setCourseId(rs.getInt("course_Id"));
				c.setCourseName(rs.getString("course_Name"));
				c.setCategory(rs.getString("category"));
				c.setCourseInfo(rs.getString("course_Info"));
				c.setMonths(rs.getInt("months"));
				c.setFees(rs.getDouble("fees"));
				courses.add(c);
				System.out.println(c.getCourseName());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courses;
	}

}
