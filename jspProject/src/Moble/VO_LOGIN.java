package Moble;

public class VO_LOGIN {
   private Long user_id;
      private String user_password;
      
      public VO_LOGIN(Long user_id, String user_password) {
         //super();
         this.user_id= user_id;
         this.user_password = user_password;
      }

      public Long getuser_id() {
         return user_id;
      }

      public void setuser_id(Long user_id) {
         this.user_id = user_id;
      }

      public String getuser_password() {
         return user_password;
      }

      public void setuser_password(String user_password) {
         this.user_password = user_password;
      }

      @Override
      public String toString() {
         return "VO_LOGIN [user_id=" + user_id + ", user_password=" + user_password + "]";
      }
      
}