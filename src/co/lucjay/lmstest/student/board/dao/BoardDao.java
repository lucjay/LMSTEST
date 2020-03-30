package co.lucjay.lmstest.student.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.lucjay.lmstest.student.board.vo.BoardVo;

public class BoardDao {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "lucjay";
	private String password = "lucjay";

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private final String SELECT_ALL = "SELECT * FROM board";
	private final String SELECT = "SELECT * FROM board WHERE boardid=?";
	private final String INSERT = "INSERT INTO board VALUES(b_num.nextval,?,?,?,?,0,?)";
	private final String DELETE = "DELETE FROM board WHERE boardid =?";
	private final String UPDATE = "UPDATE board SET contents = ? WHERE boardid=?";

	public BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		}
	}

	public ArrayList<BoardVo> selectAll() { // 전체게시글 보기
		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		BoardVo vo = null;
		try {
			psmt = conn.prepareStatement(SELECT_ALL);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVo();
				vo.setBoardid(rs.getInt("boardid"));
				vo.setWriter(rs.getString("writer"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setTitle(rs.getString("title"));
				vo.setContents(rs.getString("contents"));
				vo.setHit(rs.getInt("hit"));
				vo.setFilename(rs.getString("filename"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public BoardVo select(BoardVo vo) { // 게시글 하나 조회
		try {
			psmt = conn.prepareStatement(SELECT);
			psmt.setInt(1, vo.getBoardid());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setWriter(rs.getString("writer"));
				vo.setWdate(rs.getDate("wdate"));
				vo.setTitle(rs.getString("title"));
				vo.setHit(rs.getInt("hit"));
				hitCountUp(rs.getInt("boardid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public int insert(BoardVo vo) {
		int n = 0;
		try {
			psmt = conn.prepareStatement(INSERT);
			psmt.setString(1, vo.getWriter());
			psmt.setDate(2, vo.getWdate());
			psmt.setString(3, vo.getTitle());
			psmt.setString(4, vo.getContents());
			psmt.setString(5, vo.getFilename());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	public int update(BoardVo vo) { // 내용만 수정가능

		int n = 0;
		try {
			psmt = conn.prepareStatement(UPDATE);
			psmt.setInt(1, vo.getBoardid());
			psmt.setString(2, vo.getContents());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return n;
	}

	public int delete(BoardVo vo) { // 글삭제
		int n = 0;
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setInt(1, vo.getBoardid());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	private void hitCountUp(int id) {
		final String sql = "UPDATE board SET hit = hit+1 WHERE boardid = ? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
