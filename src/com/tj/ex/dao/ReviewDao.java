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
import com.tj.ex.dto.ReviewDto;
public class ReviewDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static ReviewDao instance = new ReviewDao();
	public static ReviewDao getInstance() {
		return instance;
	}
	private ReviewDao() {}
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
	public ArrayList<ReviewDto> list(int startRow, int endRow){
		ArrayList<ReviewDto> dtos = new ArrayList<ReviewDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM " + 
				"    (SELECT ROWNUM RN, A.* FROM " + 
				"    (SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID " + 
				"                ORDER BY RGROUP DESC, RSTEP) A) " + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int RNum      = rs.getInt("RNum");
				String MId   = rs.getString("MId");
				String MName = rs.getString("MName"); // join해서 출력
				String RTitle= rs.getString("RTitle");
				String RContent= rs.getString("RContent");
				String RFileName= rs.getString("RFileName");
				Date   RRdate   = rs.getDate("RRdate");
				int    RHit    = rs.getInt("RHit");
				int    RGroup  = rs.getInt("RGroup");
				int    RStep   = rs.getInt("RStep");
				int    RIndent = rs.getInt("RIndent");
				String RIp     = rs.getString("RIp");
				dtos.add(new ReviewDto(RNum, MId, MName, RTitle, RContent, RFileName, RRdate, RHit, RGroup, RStep, RIndent, RIp));
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
	public int getReviewTotCnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM REVIEWBOARD";
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
	public int write(String MId, String RTitle, String RContent, String RFileName,
			String RIp) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp) " + 
				"    VALUES (REVIEWBOARD_SEQ.NEXTVAL, ?,?,?,?, " + 
				"        REVIEWBOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MId);
			pstmt.setString(2, RTitle);
			pstmt.setString(3, RContent);
			pstmt.setString(4, RFileName);
			pstmt.setString(5, RIp);
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
	private void hitUp(int RNum) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RHIT = RHIT +1 WHERE RNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, RNum);
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
	public ReviewDto contentView(int RNum) {
		hitUp(RNum);
		ReviewDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE M.MID=R.MID AND RNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, RNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String MId   = rs.getString("MId");
				String MName = rs.getString("MName"); // join해서 출력
				String RTitle= rs.getString("RTitle");
				String RContent= rs.getString("RContent");
				String RFileName= rs.getString("RFileName");
				Date   RRdate   = rs.getDate("RRdate");
				int    RHit    = rs.getInt("RHit");
				int    RGroup  = rs.getInt("RGroup");
				int    RStep   = rs.getInt("RStep");
				int    RIndent = rs.getInt("RIndent");
				String RIp     = rs.getString("RIp");
				dto = new ReviewDto(RNum, MId, MName, RTitle, RContent, RFileName, RRdate, RHit, RGroup, RStep, RIndent, RIp);
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
	public ReviewDto modifyView_replyView(int RNum) {
		ReviewDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE M.MID=R.MID AND RNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, RNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String MId   = rs.getString("MId");
				String MName = rs.getString("MName"); // join해서 출력
				String RTitle= rs.getString("RTitle");
				String RContent= rs.getString("RContent");
				String RFileName= rs.getString("RFileName");
				Date   RRdate   = rs.getDate("RRdate");
				int    RHit    = rs.getInt("RHit");
				int    RGroup  = rs.getInt("RGroup");
				int    RStep   = rs.getInt("RStep");
				int    RIndent = rs.getInt("RIndent");
				String RIp     = rs.getString("RIp");
				dto = new ReviewDto(RNum, MId, MName, RTitle, RContent, RFileName, RRdate, RHit, RGroup, RStep, RIndent, RIp);
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
	public int modify(int RNum, String RTitle, String RContent, String RFileName, 
			String RIp) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RTITLE = ?, " + 
				"                    RCONTENT = ?, " + 
				"                    RFILENAME = ?, " + 
				"                    RIP = ?, " + 
				"                    RRDATE = SYSDATE " + 
				"            WHERE RNum = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, RTitle);
			pstmt.setString(2, RContent);
			pstmt.setString(3, RFileName);
			pstmt.setString(4, RIp);
			pstmt.setInt(5, RNum);
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
	public int delete(int RNum) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM REVIEWBOARD WHERE RNum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, RNum);
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
	// step a
	private void preReplyStepA(int RGroup, int RStep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RSTEP = RSTEP+1 " + 
				"    WHERE RGROUP = ? AND RSTEP > ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, RGroup);
			pstmt.setInt(2, RStep);
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
	// 답변글 쓰기
	public int reply(String MId, String RTitle, String RContent,
			String RFileName, String RIp,
			int RGroup, int RStep, int RIndent) {
		preReplyStepA(RGroup, RStep); // 답변글 저장전 step A 먼저 실행
		// bgroup, bstep, bindent 원글정보
		// bname, btitle, bcontent, bip 답변글 정보
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REVIEWBOARD(RNum, MId, RTitle, RContent, RFileName, RGroup, RStep, RIndent, RIp) " + 
				"    VALUES (FILEBOARD_SEQ.NEXTVAL, ?,?,?,?, " + 
				"        ?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MId);
			pstmt.setString(2, RTitle);
			pstmt.setString(3, RContent);
			pstmt.setString(4, RFileName);
			pstmt.setInt(5, RGroup);
			pstmt.setInt(6, RStep+1);
			pstmt.setInt(7, RIndent+1);
			pstmt.setString(8, RIp);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "답변쓰기성공":"답변쓰기실패");
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