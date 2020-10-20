package Moble;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class DAOImpl implements DAO {
	private Connection getConnection() throws SQLException {
	      Connection conn = null;
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	         conn = DriverManager.getConnection(dburl, "test", "1234");
	      } catch (ClassNotFoundException e) {
	         System.err.println("JDBC 드라이버 로드 실패!");
	      }
	      return conn;
	   }

	   
	   
	   
	   // ------------- 로그인유저 정보 보기 ------------- //
	   @Override
	   public List<VO_USER> userlist() {
	      Connection conn = null;
	         Statement stmt = null;
	         ResultSet rs = null;
	         List<VO_USER> list = new ArrayList<>();
	         
	         try {
	            conn = getConnection();
	            stmt = conn.createStatement();
	            String sql = "SELECT user_id, user_Author, " +
	               "user_name, user_password, user_phone FROM userinfo";
	            
	            rs = stmt.executeQuery(sql);
	            
	            while(rs.next()) {
	               VO_USER authorVO = new VO_USER(
	                     rs.getLong(1),
	                     rs.getLong(2),
	                     rs.getString(3),
	                     rs.getString(4),
	                     rs.getString(5)
	                     );
	               list.add(authorVO);
	            }
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }
	         return list;
	   }



	   // ------------- 유저 회원가입  ------------- //
	   @Override
	   public boolean insert_user(VO_USER vo_user) {
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         int insertedCount = 0;

	         try {
	            conn = getConnection();
	            String sql = "INSERT INTO userinfo " +
	                  "VALUES(SEQ_USERINFO.NEXTVAL, " +
	                  "0, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, vo_user.getuserName());
	            pstmt.setString(2, vo_user.getuserPassword());
	            pstmt.setString(3, vo_user.getuserPhone());
	            
	            insertedCount = pstmt.executeUpdate();
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return insertedCount == 1;
	   }



	   // ------------- 로그인  ------------- //
	   @Override
	   public VO_LOGIN login(Long user_id, String user_password) {
	      Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         VO_LOGIN vologin = null;
	         
	         try {
	            
	            conn = getConnection();
	            String sql = "Select user_id, user_password  From userinfo where user_id = ? and user_password = ?";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setLong(1, user_id);
	            pstmt.setString(2, user_password);
	                     
	            rs= pstmt.executeQuery();
	            
	            while (rs.next()) {
	               vologin = new VO_LOGIN(
	                     rs.getLong("user_id"),
	                     rs.getString("user_password")
	                     );
	            }
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if(rs != null) rs.close();
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return vologin;
	   }



	   // ------------- 아이디(학번) 찾기  ------------- //
	   @Override
	   public String id_find(String user_name, String user_phone) {
	      Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         
	         String id="" ;
	         try {
	            
	            conn = getConnection();
	            String sql = "Select user_id from userinfo where user_name = ? and user_phone = ?";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, user_name);
	            pstmt.setString(2, user_phone);
	                     
	            rs= pstmt.executeQuery();
	            while(rs.next()) {
	               id=rs.getString("user_id");
	            }
	            
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if(rs != null) rs.close();
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return id;
	   }



	   // ------------- 비밀번호 찾기  ------------- //
	   @Override
	   public String password_find(String user_name, Long user_id, String user_phone) {
	      Connection conn = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         String password="" ;
	         
	         try {
	            
	            conn = getConnection();
	            String sql = "Select user_password from userinfo where user_name = ? and user_id = ? and user_phone = ?";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, user_name);
	            pstmt.setLong(2,user_id);
	            pstmt.setString(3, user_phone);
	                     
	            rs= pstmt.executeQuery();
	            while(rs.next()) {
	               password = rs.getString("user_password");
	            }
	            
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if(rs != null) rs.close();
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return password;
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   // ------------- FREEBOARD 불러오기 ------------- //
	   @Override
	   public List<FreeBoardVO> getList_FreeBoard(String free_Choice, String free_Search) {
	      
	      Connection conn = null;
	      Statement stmt = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      List<FreeBoardVO> list = new ArrayList<>();
	      
	      try {
	         // **** FreeBoard에서 검색을 안할 시 **** //
	         if(free_Search == null) {
	            conn = getConnection();
	            stmt = conn.createStatement();
	            String sql = "SELECT FB.FREE_ID, FB.USER_ID, FB.FREE_Title, "
	                  + "FB.FREE_Content, UI.USER_Name, "
	                  + "to_char(FB.FREE_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                  + "FROM FREEBOARD FB JOIN USERINFO UI ON FB.USER_ID = UI.USER_ID "
	                  + "ORDER BY FB.FREE_ID desc ";
	            
	            rs = stmt.executeQuery(sql);
	            while(rs.next()) {
	               FreeBoardVO vo = new FreeBoardVO(
	                     rs.getLong(1),
	                     rs.getLong(2),
	                     rs.getString(3),
	                     rs.getString(4),
	                     rs.getString(5),
	                     rs.getString(6)
	                     );
	               list.add(vo);
	            }
	         }
	         // **** FreeBoard에서 검색 할 시 **** //
	         else {
	            conn = getConnection();   
	            // **** free_choice가 제목이라면 **** //
	            if(free_Choice.equals("free_Title")) {
	               
	               String sql = "SELECT FB.FREE_ID, FB.USER_ID, FB.FREE_Title, "
	                     + "FB.FREE_Content, UI.USER_Name, "
	                       + "to_char(FB.FREE_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                     + "FROM FREEBOARD FB JOIN USERINFO UI ON FB.USER_ID = UI.USER_ID "
	                       + "WHERE FB." + free_Choice + " like '%" + free_Search + "%' "
	                     + "ORDER BY Free_ID desc";
	               pstmt = conn.prepareStatement(sql);
	               
	               System.out.println("쿼리 부분까지 들어옴");
	               rs = pstmt.executeQuery();
	            }
	            // **** free_choice가 작성자라면 **** //
	            else if(free_Choice.equals("User_Name")) {
	               String sql = "SELECT FB.FREE_ID, FB.USER_ID, FB.FREE_Title, "
	                     + "FB.FREE_Content, UI.USER_Name, "
	                       + "to_char(FB.FREE_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                     + "FROM FREEBOARD FB JOIN USERINFO UI ON FB.USER_ID = UI.USER_ID "
	                       + "WHERE UI." + free_Choice + " like '%" + free_Search + "%' "
	                     + "ORDER BY Free_ID desc";
	               pstmt = conn.prepareStatement(sql);
	               
	               System.out.println("쿼리 부분까지 들어옴");
	               rs = pstmt.executeQuery();
	            }
	            // **** free_choice가 날짜라면 **** //
	            else {
	               String sql = "SELECT FB.FREE_ID, FB.USER_ID, FB.FREE_Title, "
	                     + "FB.FREE_Content, UI.USER_Name, "
	                       + "to_char(FB.FREE_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                     + "FROM FREEBOARD FB JOIN USERINFO UI ON FB.USER_ID = UI.USER_ID "
	                       + "WHERE FB." + free_Choice + " like '%____" + free_Search + "%' "
	                     + "ORDER BY Free_ID desc";
	               pstmt = conn.prepareStatement(sql);
	               
	               System.out.println("쿼리 부분까지 들어옴");
	               rs = pstmt.executeQuery();
	            }
	            while(rs.next()) {
	               FreeBoardVO vo = new FreeBoardVO(
	                     rs.getLong(1),
	                     rs.getLong(2),
	                     rs.getString(3),
	                     rs.getString(4),
	                     rs.getString(5),
	                     rs.getString(6)
	                     );
	               list.add(vo);
	               System.out.println("리스트에 담는것 까지 들어옴");
	            }
	            
	         }
	      }catch (SQLException e) {
	         System.err.println("ERROR:" + e.getMessage());
	      }
	      return list;
	   }
	   
	   // ---------------- 게시글 보기 하나만  ---------------- //
	   @Override
	   public FreeBoardVO get_FreeBoard(Long free_ID) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      FreeBoardVO freeboardVO = null;
	      ResultSet rs = null;
	      
	      try {
	         conn = getConnection();
	         String sql = "SELECT FB.FREE_ID, FB.USER_ID, FB.FREE_Title, "
	               + "FB.FREE_Content, UI.USER_Name, "
	               + "to_char(FB.FREE_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	               + "FROM FREEBOARD FB JOIN USERINFO UI ON FB.USER_ID = UI.USER_ID "
	               + "WHERE FB.FREE_ID = ? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setLong(1, free_ID);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            freeboardVO = new FreeBoardVO(
	                  rs.getLong(1),
	                  rs.getLong(2),
	                  rs.getString(3),
	                  rs.getString(4),
	                  rs.getString(5),
	                  rs.getString(6)
	                  );
	            }
	         }catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if(rs != null) rs.close();
	               if(pstmt != null) pstmt.close();
	               if(conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return freeboardVO;
	   }
	   
	   

	   // ------------- FreeBoard 정보 넣기 ------------- //
	   @Override
	   public boolean insert_FreeBoard(FreeBoardVO vo_FreeTable) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int insertedCount = 0;
	      
	      try {
	         conn = getConnection();
	         String sql = "INSERT INTO FREEBOARD "
	               + "VALUES(SEQ_FREEBOARD.NEXTVAL, "
	               + "?, ?, ?, SYSDATE) ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setLong(1, vo_FreeTable.getUser_ID());
	         pstmt.setString(2, vo_FreeTable.getFree_Title());
	         pstmt.setString(3, vo_FreeTable.getFree_Content());

	         insertedCount = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         System.err.println("ERROR:" + e.getMessage());
	      }finally {
	         try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	         } catch (Exception e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }
	      }
	      return insertedCount == 1;
	   }
	   // ------------- FreeBoard 삭제 ------------- //
	   @Override
	   public boolean delete_FreeBoard(Long Free_ID) {
	        Connection conn = null;
	         PreparedStatement pstmt = null;
	         int deletedCount = 0;
	         
	         try {
	            conn = getConnection();
	            String sql = "DELETE FROM FREEBOARD WHERE FREE_ID = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setLong(1, Free_ID);   
	            
	            deletedCount = pstmt.executeUpdate();
	            
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         
	         return deletedCount == 1;
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   // ------------- WishBoard 불러오기 ------------- //
	   
	   @Override
	   public List<WishBoardVO> getList_WishBoard(String wish_Choice, String wish_Search) {
	      
	      Connection conn = null;
	      Statement stmt = null;
	      PreparedStatement pstmt = null;   
	      ResultSet rs = null;
	      
	      List<WishBoardVO> list = new ArrayList<>();
	      
	      try {
	         // **** WishBoard에서 검색을 안할 시 **** //
	         if(wish_Search == null) {
	            conn = getConnection();
	            stmt = conn.createStatement();
	            String sql = "SELECT wish_ID, user_ID, wish_Title, wish_Content, "
	                  + "to_char(wish_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                  + "FROM WISHBOARD "
	                  + "ORDER BY wish_ID desc ";
	            
	            rs = stmt.executeQuery(sql);
	            while(rs.next()) {
	               WishBoardVO vo = new WishBoardVO(
	                     rs.getLong(1),
	                     rs.getLong(2),
	                     rs.getString(3),
	                     rs.getString(4),
	                     rs.getString(5)
	                     );
	               list.add(vo);
	            }
	         }
	         // **** WishBoard에서 검색 할 시 **** //
	         else {
	            conn = getConnection();         
	            String sql = "SELECT wish_ID, user_ID, wish_Title, wish_Content, "
	                    + "to_char(wish_Date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                  + "FROM WISHBOARD "
	                    + "WHERE " + wish_Choice + " like '%" + wish_Search + "%' "
	                  + "ORDER BY wish_ID desc";
	            pstmt = conn.prepareStatement(sql);
	            
	            System.out.println("쿼리 부분까지 들어옴");
	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	               WishBoardVO vo = new WishBoardVO(
	                     rs.getLong(1),
	                     rs.getLong(2),
	                     rs.getString(3),
	                     rs.getString(4),
	                     rs.getString(5)
	                     );
	               list.add(vo);
	               System.out.println("리스트에 담는것 까지 들어옴");
	            }
	            
	         }
	      }catch (SQLException e) {
	         System.err.println("ERROR:" + e.getMessage());
	      }
	      return list;
	   }

	   // ------------- WishBoard 정보 넣기 ------------- //
	   @Override
	   public boolean insert_WishBoard(WishBoardVO vo_WishTable) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int insertedCount = 0;
	      
	      try {
	         conn = getConnection();
	         String sql = "INSERT INTO WISHBOARD "
	               + "VALUES(SEQ_WishBoard.NEXTVAL, "
	               + "?, ?, ?, SYSDATE) ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setLong(1, vo_WishTable.getUser_ID());
	         pstmt.setString(2, vo_WishTable.getWish_Title());
	         pstmt.setString(3, vo_WishTable.getWish_Content());;

	         insertedCount = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         System.err.println("ERROR:" + e.getMessage());
	      }finally {
	         try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	         } catch (Exception e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }
	      }
	      return insertedCount == 1;
	   }
	   // ------------- WishBoard 삭제 ------------- //
	   @Override
	   public boolean delete_WishBoard(Long wish_ID) {
	        Connection conn = null;
	         PreparedStatement pstmt = null;
	         int deletedCount = 0;
	         
	         try {
	            conn = getConnection();
	            String sql = "DELETE FROM WISHBOARD WHERE wish_ID = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setLong(1, wish_ID);   
	            
	            deletedCount = pstmt.executeUpdate();
	            
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         
	         return deletedCount == 1;
	   }

	   
	   
	   
	   
	   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //학습자료게시판
	   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	      @Override
	      public List<StudyBoardVO> getListStudyBoard(String study_choice, String study_search) {
	         // TODO Auto-generated method stub
	         
	         Connection conn = null;
	         Statement stmt = null;
	         PreparedStatement pstmt = null;
	         ResultSet rs = null;
	         
	         List<StudyBoardVO> list = new ArrayList<>();
	         
	         try {
	            if(study_search == null) {
	               conn = getConnection();
	               stmt = conn.createStatement();
	               String sql = "SELECT study_fileno, study_title, study_content, study_filename, " +
	                     " to_char(study_date, 'YYYY\"년\" MM\"월\" DD\"일\"') " +
	                     " FROM studyboard " +
	                     " order by study_fileno desc ";
	               
	               rs = stmt.executeQuery(sql);
	               
	               while(rs.next()) {
	                  StudyBoardVO vo = new StudyBoardVO(
	                        rs.getLong(1),
	                        rs.getString(2),
	                        rs.getString(3),
	                        rs.getString(4),
	                        rs.getString(5)
	                        );
	                  list.add(vo);
	               }
	            } else {
	                  conn = getConnection();         
	                  String sql = "SELECT study_fileno, study_title, study_content, study_filename, "
	                          + "to_char(study_date, 'YYYY\"년\" MM\"월\" DD\"일\"') "
	                        + "FROM studyboard"
	                          + "WHERE " + study_choice + " like '%" + study_search + "%' "
	                        + "ORDER BY study_fileno desc";
	                  pstmt = conn.prepareStatement(sql);
	                  
	                  System.out.println("쿼리 부분까지 들어옴");
	                  rs = pstmt.executeQuery();
	                  
	                  while(rs.next()) {
	                     StudyBoardVO vo = new StudyBoardVO(
	                           rs.getLong(1),
	                           rs.getString(2),
	                           rs.getString(3),
	                           rs.getString(4),
	                           rs.getString(5)
	                           );
	                     list.add(vo);
	                     System.out.println("리스트에 담는것 까지 들어옴");
	                  }
	            }
	         }catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }
	         return list;
	      }
	      
	      @Override
	      public boolean selectStudyBoard(String file) {
	         // TODO Auto-generated method stub
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         int insertedCount = 0;
	         
	         ResultSet rs = null;
	         try {
	            //sql 실행 기본키 갖고오기
	            //rs에 저장
	            //변수 = rs.getInt()
	            
	            //외래키 갖고오기
	            conn = getConnection();
	            String sql = "SELECT study_filename FROM studyboard WHERE study_filename= ? ";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, file);;

	            insertedCount = pstmt.executeUpdate();
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }finally {
	            try {
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return insertedCount == 1;
	      }
	      
	      @Override
	      public boolean insertStudyBoard(StudyBoardVO StudyBoardVO) {
	         // TODO Auto-generated method stub
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         int insertedCount = 0;
	         
	         ResultSet rs = null;
	         try {
	            //sql 실행 기본키 갖고오기
	            //rs에 저장
	            //변수 = rs.getInt()
	            
	            //외래키 갖고오기
	            conn = getConnection();
	            String sql = "INSERT INTO studyboard " +
	                  " VALUES(seq_studyboard.nextval, ?, ?, ?, sysdate) ";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, StudyBoardVO.getStudyTitle());
	            pstmt.setString(2, StudyBoardVO.getStudyContent());
	            pstmt.setString(3, StudyBoardVO.getFile());;

	            insertedCount = pstmt.executeUpdate();
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }finally {
	            try {
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         return insertedCount == 1;
	      }
	      
	      @Override
	      public boolean deleteStudyBoard(Long fileNo) {
	         // TODO Auto-generated method stub
	         Connection conn = null;
	         PreparedStatement pstmt = null;
	         int deletedCount = 0;
	         
	         try {
	            conn = getConnection();
	            String sql = "DELETE FROM studyboard WHERE study_fileNo = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setLong(1, fileNo);
	         
	            
	            
	            deletedCount = pstmt.executeUpdate();
	         } catch (SQLException e) {
	            System.err.println("ERROR:" + e.getMessage());
	         } finally {
	            try {
	               if (pstmt != null) pstmt.close();
	               if (conn != null) conn.close();
	            } catch (Exception e) {
	               System.err.println("ERROR:" + e.getMessage());
	            }
	         }
	         
	         return deletedCount == 1;
	      }
    
	

}
