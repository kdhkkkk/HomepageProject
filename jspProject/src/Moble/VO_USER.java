package Moble;

public class VO_USER {
   private Long userId;
   private Long userAuthor;
   private String userName;
   private String userPassword;
   private String userPhone;
      
   public VO_USER(Long userId,Long userAuthor, String userName,String userPassword, String userPhone) {
         this.userId = userId;
         this.userAuthor = userAuthor;
         this.userName = userName;
         this.userPassword = userPassword;
         this.userPhone = userPhone;
      }
      
      public Long getuserId() {
         return userId;
      }
      public void setuserId(Long userId) {
         this.userId = userId;
      }
      
      public Long getuserAuthor() {
         return userAuthor;
      }
      public void setuserAuthor(Long userAuthor) {
         this.userAuthor = userAuthor;
      }
      
      public String getuserName() {
         return userName;
      }
      public void setuserName(String userName) {
         this.userName = userName;
      }
      
      public String getuserPassword() {
         return userPassword;
      }
      public void setuserPassword(String userPassword) {
         this.userPassword = userPassword;
      }
      
      public String getuserPhone() {
         return userPhone;
      }
      public void setuserPhone(String userPhone) {
         this.userPhone = userPhone;
      }
      
      @Override
      public String toString() {
         return "VO_LOGIN [user_id=" + userId + ", userAuthor=" + userAuthor +", userName =" + userName+ ", userPassword = "+userPassword + ",userPhone = "+ userPhone+ "]";
      }
}