package controller.formation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.FormationDTO;
import Model.SquadDTO;
import command.FormationCommand;
import service.formation.AddPlayerSquad;
import service.formation.FmPlayerDetailService;
import service.formation.ForPlayerDetailService;
import service.formation.FormaPlListService;
import service.formation.FormationDelService;
import service.formation.FormationDetailService;
import service.formation.FormationListService;
import service.formation.FormationRegistService;
import service.formation.SquadDelService;
import service.formation.SquadDetailService;
import service.formation.SquadListService;
import service.player.PlayerDetailService;


@Controller
@RequestMapping("fm")
public class FormationController {
	@Autowired
	FmPlayerDetailService fmPlayerDetailService;
	@Autowired
	AddPlayerSquad addPlayerSquad;
	@Autowired
	SquadListService squadListService;
	@Autowired
	SquadDelService squadDelService;
	@Autowired
	SquadDetailService squadDetailService;
	@Autowired
	FormationRegistService formationRegistService;
	@Autowired
	FormationListService formationListService;
	@Autowired
	FormationDelService formationDelService;
	@Autowired
	FormationDetailService formationDetailService;
	@Autowired
	ForPlayerDetailService forPlayerDetailService;
	@Autowired
	PlayerDetailService playerDetailService;
	@Autowired
	FormaPlListService formaPlListService;
	

	
	@RequestMapping("plerDetailView")
	public String plerDetailView(@RequestParam(value="plerName")String plerName,Model model) {
		playerDetailService.DetailPrint(plerName,model);
		return "formation/playerDetail";
	}
	
	
	@RequestMapping("forDetail")
	public String forDetail(String plerName , HttpSession session, Model model) {
		/* forPlayerDetailService.forPlerDt(plerName,session ,model); */
		squadListService.squadList(session,model);
		formationListService.forList(session,model);
		return "formation/formationHome";
	}
	
	@RequestMapping("forDel")
	public String formationDelete(@RequestParam(value="positionNum")String positionNum,HttpSession session) {
		//formationDelService.forDel(positionNum,session);
		
		return "main/main";
	}
	
	//ajax ??? ???????????? ????????? ???????????? 
	@RequestMapping("formationRegist")//????????? ?????? ????????? ?????? ????????? update ?????????  TEAM_Location_num??? ??????????????? 
	public String formationRegist(FormationCommand formationCommand,HttpSession session, Model model) {		
		squadListService.squadList(session,model);		
		formationRegistService.formationRegist(formationCommand,session);
		squadDelService.delAction(formationCommand);
		return "redirect:formation";
	}
	
	
	
	@RequestMapping("playerDetail")
	public String playerDetail(@RequestParam(value="plerName")String plerName) {
		squadDetailService.sqdDetail(plerName);
		return "formation/playerDetail";
	}
	
	@RequestMapping("squadDel")
	public String squadDel(FormationCommand formationCommand) {
		squadDelService.delAction(formationCommand);
		return "redirect:formation";
	}
	
	@RequestMapping("addPlayer")
	public String addPlayer(@RequestParam(value="plerName")String plerName, 
							@RequestParam(value="plerSalary")String plerSalary,
							@RequestParam(value="plerPrice")String plerPrice,
							@RequestParam(value="plerPosition")String plerPosition,
							@RequestParam(value="plerAbility")String plerAbility,
							HttpSession session,Model model) {
		
		if (plerName == null || plerName == "") {
			model.addAttribute("err2","???????????? ??????????????????");
			squadListService.squadList(session,model);
			formationListService.forList(session,model);
			return "formation/formationHome";
		}//?????? ????????? ??????
		
		SquadDTO dto1 = squadDetailService.sqdDetail(plerName);
		FormationDTO dto2 = formationDetailService.forDetail(session,plerName); 
	
		if(dto2 != null) {
			model.addAttribute("alreadyErr","?????? ????????? ???????????? ");
			squadListService.squadList(session,model);
			formationListService.forList(session,model);
			return "formation/formationHome";
		}
		
		if (dto1 == null) {
			addPlayerSquad.addPlSquad(plerName,plerSalary,plerPrice,plerPosition,plerAbility,session);
			squadListService.squadList(session,model);
			formationListService.forList(session,model);
			return "redirect:formation";
		} else {
			model.addAttribute("err", "??????????????????");
			squadListService.squadList(session,model);
			formationListService.forList(session,model);
			return "formation/formationHome";
		}
		
		
		
		
	}
	
	@RequestMapping("searchedPl")
	public String searchedPl(@RequestParam(value="plerName")String plerName,Model model,HttpSession session) {
		fmPlayerDetailService.searchDetail(plerName,model);
		squadListService.squadList(session,model);
		formationListService.forList(session,model);
		return "formation/formationHome";
	}
	@RequestMapping("formation")
	public String formation(FormationCommand formationCommand , HttpSession session,Model model) {
		squadListService.squadList(session,model); 
		formaPlListService.forPlList(session,model); 
		formationListService.forList(session,model);
		return "formation/formationHome";
	}
	
}
