package grello

class TeamController extends SecureController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
		 def operationHistoryService
		 def operationCode
		 
	 def index() {
		 
		 def teamList = [ teamList: Team.list( params) ]
		 
		 }
	 
	 def show () {
		 [ team : Team.get( params.id ) ]
		 
		 }
	 def delete (Team team) {
		 operationCode = "delete team "+"$team.teamName"
		 if(team == null){
			 flash.message = message(code: 'default.updated.message', args: [message(code: 'Team.label', default: 'Team'), team.id])
			 return
		 }
		 team.delete flush:true
		 operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.deleted.message', args: [message(code: 'Team.label', default: 'Team'), team.id])
				 redirect action:"index", method:"GET"
			 }
			 
		 }
		 
		 }
	 def edit = {
		 def team = Team.get( params.id )
		 if(!team) {
		 flash.message = "Team not found with id ${params.id}"
		 redirect(action:index)
			 }
		 else {
		 return [ team : team ]
			 }
		 }
	 
	 def update(Team team) {
		 operationCode = "update team "+"$team.teamName"
		 if(team == null) {
			 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
				 redirect action: "index", method: "GET"
			 }
			 '*'{ render status: NOT_FOUND }
		 }
			 return
		 }
		 if (team.hasErrors()) {
			 respond team.errors, view:'edit'
			 return
		 }
		 team.save flush:true
		 operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), team.id])
				 redirect team
			 }
			 '*'{ respond team, [status: OK] }
		 }
		 }
	 def create()  {
		 respond new Team(params)
		 
		 }
	 def save (Team team){
		 operationCode = "create new team "+"$team.teamName"
		 if (team == null) {
			 flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])
			 return
		 }
		 if (team.hasErrors()) {
			 respond team.errors, view:'create'
			 return
		 }
		 team.save flush:true
		 operationHistoryService.addToHistory(operationCode)
		  request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), team.id])
				 redirect team
			 }
			 '*' { respond team, [status: CREATED] }
		 }
	 }
 
}
