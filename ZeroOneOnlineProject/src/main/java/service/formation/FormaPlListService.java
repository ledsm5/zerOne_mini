package service.formation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfo;
import Model.FormationPlayerDTO;
import repository.FormationRepository;

public class FormaPlListService {
	@Autowired
	FormationRepository formationRepository;
	public void forPlList(HttpSession session , Model model) {
	
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo"); 
		String memId = authInfo.getUserId();
		
		List<FormationPlayerDTO> list = formationRepository.forPlList(memId);
		/*
		 * for(FormationPlayerDTO i : list){
		 * System.out.println(i.getPlayerDTO().getPlerPrice()); }
		 */
		
		for(int i=0;i<list.size();i++){
			String bbbb []=list.get(i).getPlayerDTO().getPlerPrice().split(","); 
			System.out.println(bbbb);
		}
		model.addAttribute("plForList",list);
		
	}
}
