package grello

class BoardController extends SecureController{
	
	List boardList
	
	def index(){
		
	}
	
	def create(){}
	
	def handleCreate(){
		def board = new Board(params)
		 
		if ( board.save() ){
			flash.boardName = board
			redirect(action:create)
		}
		
	 }

	
}
