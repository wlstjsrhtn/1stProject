package com.tj.ex.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.tj.ex.dto.NoticeDto;
public class NoticeDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static NoticeDao instance = new NoticeDao();
	public static NoticeDao getInstance() {
		return instance;
	}
	private NoticeDao() {}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// 글목록
	public ArrayList<NoticeDto> list(int startRow, int endRow){
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM " + 
				"    (SELECT ROWNUM RN, B.* FROM " + 
				"    (SELECT N.*, AName FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId " + 
				"                ORDER BY NNum DESC) B) " + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int NNum = rs.getInt("NNum");
				String AId = rs.getString("AId");
				String NTitle = rs.getString("NTitle");
				String NPhoto = rs.getString("NPhoto");
				String NContent = rs.getString("NContent");
				Date NDate = rs.getDate("NDate");
				int NHit = rs.getInt("NHit");
				dtos.add(new NoticeDto(NNum, AId, NTitle, NPhoto, NContent, NDate, NHit));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dtos;
	}
	// 글갯수
	public int getNoticeTotCnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM NOTICEBOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return cnt;
	}
	// 글쓰기(원글쓰기)
	public int write(String AId, String NTitle, String NPhoto, String NContent) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO NOTICEBOARD (NNum, AId, NTitle, NPhoto, NContent) " + 
				"    VALUES (NOTICEBOARD_SEQ.NEXTVAL, ?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, AId);
			pstmt.setString(2, NTitle);
			pstmt.setString(3, NPhoto);
			pstmt.setString(4, NContent);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "원글쓰기성공":"원글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	// 조회수올리기
	private void hitUp(int NNum) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICEBOARD SET NHIT = NHIT +1 WHERE NNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NNum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
	// 글 상세보기(조회수 up + bid로 dto리턴)
	public NoticeDto contentView(int NNum) {
		hitUp(NNum);
		NoticeDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT N.*, NTitle FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId AND NNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String AId = rs.getString("AId");
				String NTitle = rs.getString("NTitle");
				String NPhoto = rs.getString("NPhoto");
				String NContent = rs.getString("NContent");
				Date NDate = rs.getDate("NDate");
				int NHit = rs.getInt("NHit");
				dto = new NoticeDto(NNum, AId, NTitle, NPhoto, NContent, NDate, NHit);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;
	}
	// 답변글 view + 수정 view (bid로 dto리턴)
	public NoticeDto modifyView_replyView(int NNum) {
		NoticeDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT N.*, NTitle FROM NOTICEBOARD N, ADMIN A WHERE N.AId=A.AId AND NNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String AId = rs.getString("AId");
				String NTitle = rs.getString("NTitle");
				String NPhoto = rs.getString("NPhoto");
				String NContent = rs.getString("NContent");
				Date NDate = rs.getDate("NDate");
				int NHit = rs.getInt("NHit");
				dto = new NoticeDto(NNum, AId, NTitle, NPhoto, NContent, NDate, NHit);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;
	}
	// 글 수정하기
	public int modify(int NNum, String NTitle, String NPhoto, String NContent) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICEBOARD SET NTitle = ?, " + 
				"                    NPhoto = ?, " + 
				"                    NContent = ?, " + 
				"                    NDate = SYSDATE " + 
				"            WHERE NNum = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NTitle);
			pstmt.setString(2, NPhoto);
			pstmt.setString(3, NContent);
			pstmt.setInt(4, NNum);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글수정성공":"글수정실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	// 글 삭제하기(bid로 글 삭제하기)
	public int delete(int NNum) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM NOTICEBOARD WHERE NNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, NNum);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글삭제성공":"글삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}	
}