package grello

class Team {
	
	String teamName
	static hasMany = [teamMembers : User]
	
    static constraints = {
		teamName()
		
		   }
	String toString(){
		 "$teamName, $teamMembers"
	}
}
