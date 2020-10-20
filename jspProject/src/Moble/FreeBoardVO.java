package Moble;

public class FreeBoardVO {
	private Long free_ID;              // 게시판 번호
	private Long user_ID;              // 유저 학번
	private String free_Title;         // 게시판 제목
	private String free_Content;       // 게시판 내용
	private String user_name;          // 유저 이름
	private String free_Date;          // 게시판 날짜

	// 생성자 생성
	public FreeBoardVO(Long free_ID, Long user_ID, String free_Title,
			String free_Content, String user_name, String free_Date) {
		super();
		this.free_ID = free_ID;
		this.user_ID = user_ID;
		this.free_Title = free_Title;
		this.free_Content = free_Content;
		this.user_name = user_name;
		this.free_Date = free_Date;
	}
	
	// Getter & Setter 생성	

	public Long getFree_ID() {
		return free_ID;
	}

	public void setFree_ID(Long free_ID) {
		this.free_ID = free_ID;
	}

	public Long getUser_ID() {
		return user_ID;
	}

	public void setUser_ID(Long user_ID) {
		this.user_ID = user_ID;
	}

	public String getFree_Title() {
		return free_Title;
	}

	public void setFree_Title(String free_Title) {
		this.free_Title = free_Title;
	}

	public String getFree_Content() {
		return free_Content;
	}

	public void setFree_Content(String free_Content) {
		this.free_Content = free_Content;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getFree_Date() {
		return free_Date;
	}

	public void setFree_Date(String free_Date) {
		this.free_Date = free_Date;
	}

	// 확인 출력
	@Override
	public String toString() {
		return "WishBoardVO ["+ free_ID + ", " + user_ID + ", " + free_Title + ", " 
				+ free_Content + ", " + user_name + ", " + free_Date + "]";
	}
	
}
