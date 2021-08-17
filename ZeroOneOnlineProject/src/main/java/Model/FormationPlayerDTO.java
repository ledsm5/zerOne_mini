package Model;



public class FormationPlayerDTO {
	FormationDTO formationDTO;    //dto 를 주면 resultMap 을 반드시 써야하고 
	PlayerDTO playerDTO;
	/*
	String plerNum;
	String plerName;
	String plerLeague;
	String plerTeam;
	String plerAge;
	String plerFoot;
	String plerRate;
	String plerPrice;
	String plerDetail;
	String plerImage;
	String plerAbility;
	String plerPosition;
	String plerSalary;
	String plerHeight;
	String plerIndiSkill;
	String plerSession;
	String memId;
	String plerName;
	String positionNum;
	String plerImage;    		이렇게 풀어서 쓰면 resultMap 을사용할 필요가없다   
	 */
	public FormationDTO getFormationDTO() {
		return formationDTO;
	}
	public void setFormationDTO(FormationDTO formationDTO) {
		this.formationDTO = formationDTO;
	}
	public PlayerDTO getPlayerDTO() {
		return playerDTO;
	}
	public void setPlayerDTO(PlayerDTO playerDTO) {
		this.playerDTO = playerDTO;
	}
	

	
	
	
	
}
