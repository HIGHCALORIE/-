package membership;
//DAO : Data Access Object 데이터베이스의 데이터의 접근하기
//위한 객체 CRUD잡업이 가능한 기능

import javax.servlet.ServletContext;

public class MemberDAO extends JDBConnect{

	
//	public MemberDAO(String drv,String url, String id, String pw) {
//		super(drv,url,id,pw);
//	}
	
	
	// 3번째 접속방법 
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	
	
	
	
	public MemberDTO getMemberDTO(String uid, String upw) {
		MemberDTO dto = new MemberDTO();
		String query="select * from member where id=? and pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,uid);
			psmt.setString(2,upw);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setUser_id(rs.getString("id"));
				dto.setUser_pw(rs.getString("pass"));
				dto.setUsername(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return dto;
	}
		
}
