package Moble;

import java.util.List;

public interface DAO {

	   // 로그인 창
	   public List<VO_USER> userlist(); // 유저 정보
	   public boolean insert_user(VO_USER vo_user);// 회원 가입
	   public VO_LOGIN login(Long user_id, String user_password);// 로그인
	   public String id_find(String user_name, String user_phone);// id 찾기
	   public String password_find(String user_name, Long user_id, String user_phone);// password 찾기
	   
	   
	   // 학습 자료 게시판
	   public List<StudyBoardVO> getListStudyBoard(String study_choice, String study_search);
	   public boolean selectStudyBoard(String file);
	   public boolean insertStudyBoard(StudyBoardVO StudyBoardVO);
	   public boolean deleteStudyBoard(Long fileNo);
	    
	    
	   // 자유 게시판
	   public List<FreeBoardVO> getList_FreeBoard(String Free_Choice, String Free_Search);
	   public FreeBoardVO get_FreeBoard(Long free_ID);
	   public boolean insert_FreeBoard(FreeBoardVO vo_FreeTable);
	   public boolean delete_FreeBoard(Long free_ID);
	   

	   // 소원 수리함
	   public List<WishBoardVO> getList_WishBoard(String wish_Choice, String wish_Search);
	   public boolean insert_WishBoard(WishBoardVO vo_WishTable);
	   public boolean delete_WishBoard(Long wish_ID);
}
