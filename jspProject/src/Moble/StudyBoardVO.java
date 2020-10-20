package Moble;

public class StudyBoardVO {
   private Long fileNo;
   private String studyTitle;
   private String studyContent;
   private String file;
   private String reg_date;
   
   public StudyBoardVO(Long fileNo, String studyTitle, String studyContent, String file, String reg_date ) {
      this.fileNo = fileNo;
      this.studyTitle = studyTitle;
      this.studyContent = studyContent;
      this.file = file;
      this.reg_date = reg_date;
   }
   
   public StudyBoardVO(String studyTitle, String studyContent, String file) {
      this.studyTitle = studyTitle;
      this.studyContent = studyContent;
      this.file = file;
   }
   
   public StudyBoardVO(String file) {
      this.file = file;
   }
   public Long getFileNo() {
      return fileNo;
   }
   public void setFileNo(Long fileNo) {
      this.fileNo = fileNo;
   }
   public String getStudyTitle() {
      return studyTitle;
   }
   public void setStudyTitle(String studyTitle) {
      this.studyTitle = studyTitle;
   }
   public String getStudyContent() {
      return studyContent;
   }
   public void setStudyContent(String studyContent) {
      this.studyContent = studyContent;
   }
   public String getFile() {
      return file;
   }
   public void setFile(String file) {
      this.file = file;
   }
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   } 
}