package co.lucjay.lmstest.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "lucjay";
	private String password = "lucjay";

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private final String MEMBER_LIST = "SELECT * FROM member";
	private final String MEMBER_CHECK = "SELECT * FROM member WHERE id =? and pw=?";
	private final String MEMBER_INSERT = "INSERT INTO member values(?,?,?,?,?,?,?)";
	private final String MEMBER_ID_CHECK = "SELECT id FROM member WHERE id =?";

	public MemberDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

//select 메소드작성
	public ArrayList<MemberVo> select() {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		MemberVo member = null;
		try {
			psmt = conn.prepareStatement(MEMBER_LIST);
			rs = psmt.executeQuery();
			while (rs.next()) {
				member = new MemberVo();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));
				member.setGender(rs.getString("gender"));
				member.setHobby(rs.getString("hobby"));
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public MemberVo selectMember(MemberVo member) {
		MemberVo vo = null;
		try {
			psmt = conn.prepareStatement(MEMBER_CHECK);
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getPw());
			rs = psmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				vo = new MemberVo(id, pw);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;

	}

	public int memberInsert(MemberVo member) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(MEMBER_INSERT);
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getName());
			psmt.setString(3, member.getPw());
			psmt.setString(4, member.getAddress());
			psmt.setString(5, member.getTel());
			psmt.setString(6, member.getGender());
			psmt.setString(7, member.getHobby());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return n;
	}

	public int memberIdCheck(String id) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(MEMBER_ID_CHECK);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				n = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

}
