package Moble;

public class WishBoardVO {
	private Long wish_ID;         // 게시판 번호
	private Long user_ID;         // 유저 학번( 본인 삭제 시 필요 )
	private String wish_Title;    // 게시판 제목
	private String wish_Content;  // 게시판 내용
	private String wish_Date;     // 게시판 날짜
	
	// 생성자 생성
	public WishBoardVO(Long wish_ID, Long user_ID, String wish_Title, String wish_Content, String wish_Date) {
		super();
		this.wish_ID = wish_ID;
		this.user_ID = user_ID;
		this.wish_Title = wish_Title;
		this.wish_Content = wish_Content;
		this.wish_Date = wish_Date;
	}
	
	// Getter & Setter 생성
	public Long getWish_ID() {
		return wish_ID;
	}

	public void setWish_ID(Long wish_ID) {
		this.wish_ID = wish_ID;
	}

	public Long getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(Long user_ID) {
		this.user_ID = user_ID;
	}

	public String getWish_Title() {
		return wish_Title;
	}

	public void setWish_Title(String wish_Title) {
		this.wish_Title = wish_Title;
	}

	public String getWish_Content() {
		return wish_Content;
	}

	public void setWish_Content(String wish_Content) {
		this.wish_Content = wish_Content;
	}

	public String getWish_Date() {
		return wish_Date;
	}

	public void setWish_Date(String wish_Date) {
		this.wish_Date = wish_Date;
	}

	// 확인 출력
	@Override
	public String toString() {
		return "WishBoardVO ["+ wish_ID + ", " + user_ID + ", " + wish_Title 
				 + ", " + wish_Content + ", " + wish_Date + "]";
	}

}
