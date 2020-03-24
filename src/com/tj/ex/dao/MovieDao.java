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

import com.tj.ex.dto.MovieDto;
import com.tj.ex.dto.NoticeDto;


public class MovieDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static MovieDao instance = new MovieDao();
	public static MovieDao getInstance() {
		return instance;
	}
	private MovieDao() {}
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
	public ArrayList<MovieDto> mList(int startRow, int endRow){
		ArrayList<MovieDto> dtos = new ArrayList<MovieDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM MOVIE ORDER BY MRDATE DESC) A) "
				+ "WHERE RN BETWEEN ? AND ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String MTitle = rs.getString("MTitle");
				String MPhoto = rs.getString("MPhoto");
				String MStory = rs.getString("MStory");
				String MDName = rs.getString("MDName");
				String MActor = rs.getString("MActor");
				String MW = rs.getString("MW");
				int MBRank = rs.getInt("MBRank");
				String MRdate = rs.getString("MRdate");
				dtos.add(new MovieDto(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate));
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
	public int getMovieTotCnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM MOVIE";
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
	public int write(String MTitle, String MPhoto, String MStory, String MDName,
			String MActor, String MW, int MBRank, String MRdate) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MOVIE(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate) " + 
				"           VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MTitle);
			pstmt.setString(2, MPhoto);
			pstmt.setString(3, MStory);
			pstmt.setString(4, MDName);
			pstmt.setString(5, MActor);
			pstmt.setString(6, MW);
			pstmt.setInt(7, MBRank);
			pstmt.setString(8, MRdate);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "영화등록성공":"영화등록실패");
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
	private void hitUp(String MTitle) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MOVIE SET MHIT = MHIT +1 WHERE MTitle=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MTitle);
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
	public MovieDto contentView(String MTitle) {
		hitUp(MTitle);
		MovieDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MOVIE WHERE MTitle=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MTitle);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String MPhoto = rs.getString("MPhoto");
				String MStory = rs.getString("MStory");
				String MDName = rs.getString("MDName");
				String MActor = rs.getString("MActor");
				String MW = rs.getString("MW");
				int MBRank = rs.getInt("MBRank");
				String MRdate = rs.getString("MRdate");
				dto = new MovieDto(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate);
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
	public MovieDto mmodifyView_replyView(String MTitle) {
		MovieDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MOVIE WHERE MTitle=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MTitle);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String MPhoto = rs.getString("MPhoto");
				String MStory = rs.getString("MStory");
				String MDName = rs.getString("MDName");
				String MActor = rs.getString("MActor");
				String MW = rs.getString("MW");
				int MBRank = rs.getInt("MBRank");
				String MRdate = rs.getString("MRdate");
				dto = new MovieDto(MTitle, MPhoto, MStory, MDName, MActor, MW, MBRank, MRdate);
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
	public int modify(String MTitle, String MPhoto, String MStory, String MDName, String MActor, String MRdate,
			int MBRank) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MOVIE SET MPhoto=?, "
				+ "MStory=?, "
				+ "MDName=?, "
				+ "MActor=?, "
				+ "MBRank=?, "
				+ "MRdate=? "
				+ "WHERE MTitle=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MPhoto);
			pstmt.setString(2, MStory);
			pstmt.setString(3, MDName);
			pstmt.setString(4, MActor);
			pstmt.setInt(5, MBRank);
			pstmt.setString(6, MRdate);
			pstmt.setString(7, MTitle);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "정보수정성공":"정보수정실패");
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
	public int delete(String MTitle) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MOVIE WHERE MTitle=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MTitle);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "영화삭제성공":"영화삭제실패");
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
