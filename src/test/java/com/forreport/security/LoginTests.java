package com.forreport.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class LoginTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testInsertUser() {
		String sql = "insert into tbl_user(id, password, name, phone, email, grade) values (?,?,?,?,?,?)";		
			Connection con = null;
			PreparedStatement pstmt = null;
			String id = "member";
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);				
				
				if(id == "member") {
					pstmt.setString(1, "member");
					pstmt.setString(2, pwencoder.encode("member"));
					pstmt.setString(3, "member");
					pstmt.setString(4, "123123123");				
					pstmt.setString(5, "abc@abc.com");				
					pstmt.setString(6, "0");				
				} else {
					pstmt.setString(1, "user");
					pstmt.setString(2, "1234");
					pstmt.setString(3, "hong");				
					pstmt.setString(4, "123123123");				
					pstmt.setString(5, "abc@abc.com");				
					pstmt.setString(6, "0");	
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
						
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (Exception e) {

					}
				}
			}
		
	}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into tbl_auth2 (auth, id) values (?,?)";
	
			Connection con = null;
			PreparedStatement pstmt = null;
			String id = "member";
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if( id == "member" ) {
					pstmt.setString(1, "ROLE_MEMBER");
					pstmt.setString(2, "member");				
				} else {
					pstmt.setString(1, "0");
					pstmt.setString(2, "aa");
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
			
			} finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) { }
				}
				if(con != null) {
					try {
						con.close();
					} catch (Exception e) { }
				}
			}
		
	}
	
}
