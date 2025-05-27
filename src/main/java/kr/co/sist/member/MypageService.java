package kr.co.sist.member;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.member.login.LoginResultDTO;
public class MypageService {

	public boolean modifyMember(MypageDTO mpDTO, HttpSession session) {
		boolean flag=false;
		
		MypageDAO mpDAO=MypageDAO.getInstance();
		System.out.println( mpDAO );
		try {
			//세션에서 아이디를 꺼내와서 DTO에 설정
			mpDTO.setId(((LoginResultDTO)session.getAttribute("userData")).getId());
			
			String key="abcdef0123456789";
			DataDecryption dd=new DataDecryption(key);
			//이미지를 선택하지 않았을때 이미지명 처리
			if(mpDTO.getImgName().isEmpty()) {
				mpDTO.setImgName("default.jyb");
			}//end if
			
			try {
				mpDTO.setTel(dd.decrypt(mpDTO.getTel()));
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
			
			mpDAO.updateMember(mpDTO);
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}
}//class
