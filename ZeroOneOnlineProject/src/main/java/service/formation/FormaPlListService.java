package service.formation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;

import Model.AuthInfo;
import Model.TeamFormationDTO;
import repository.FormationRepository;

public class FormaPlListService {
	@Autowired
	FormationRepository formationRepository;
	public void forPlList(HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo"); 
		String memId = authInfo.getUserId();
		
		
		List<TeamFormationDTO> list = formationRepository.forPlList(memId);
	}
}
