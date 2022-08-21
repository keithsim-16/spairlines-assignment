Title: SP Airlines - Assignment\
Description: Singapore Polytechnic 
  Enterprise Application Development Module\
Author: P1625765 (Sim Shi Jie, Keith)\
Date: 01 August 2017

-------------How to import Dynamic Web Project:-------------
1. Open Eclipse
2. File > import
3. Type into the filter text war and select WAR file > next
4. Browse to the assignment_two1.war file
5. Rename the web project if name already exists
6. Finish

Disclaimer: Some JSP files that import java.sql may require you to change the String connURL password to your 
MYSQL server password.

e.g String connURL ="jdbc:mysql://127.0.0.1/aircraft?user=root&password=(your MySQL server password here)";

------------------ How to import Database:------------------
1. Open MySQL Workbench
2. Create a schema and enter the name "aircraft"
3. Under management > Data Import/Restore
4. Import from Dump Project Folder > Browse to "Dump20170806"
5. Start import
6. Once import is completed, return to Import from disk
7. Select Import from Self-Contained File > Browse to "aircraft_routines" located in "Dump20170806" folder
8. Select Default Target Schema > "aircraft"
9. Start import
10. Finish

------------------------References--------------------------\
Oracle, 2017. JavaMail API. [Online] Available at: http://www.oracle.com/technetwork/java/javamail/index.html [Accessed 7 August 2017].\
Oracle, n.d. JavaBeans Activation Framework. [Online] Available at: http://www.oracle.com/technetwork/java/javase/jaf-136260.html [Accessed 7 August 2017].
