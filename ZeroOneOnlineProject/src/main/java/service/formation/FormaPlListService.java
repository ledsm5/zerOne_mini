package service.formation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfo;
import Model.FormationDTO;
import Model.FormationPlayerDTO;
import repository.FormationRepository;

public class FormaPlListService {
	@Autowired
	FormationRepository formationRepository;
	public void forPlList(HttpSession session , Model model) {
	
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo"); 
		String memId = authInfo.getUserId();
		
		
		List<String> plerNames = formationRepository.plNameSel(memId);
		List<FormationPlayerDTO> list =  new ArrayList<FormationPlayerDTO>();
		for(String plerName :plerNames) {
			FormationDTO dto = new FormationDTO();
			dto.setMemId(memId);
			dto.setPlerName(plerName);
			FormationPlayerDTO formationPlayerDTO = formationRepository.forPlList(dto);
			list.add(formationPlayerDTO);
		}
		
		
		
		model.addAttribute("plForList",list);
	}
}
