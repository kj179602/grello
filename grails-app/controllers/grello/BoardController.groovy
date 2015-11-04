package grello

class BoardController extends SecureController{

    //def scaffold = Board;
	
	
	def index(){
		
	}
	
	def create(){}
	
	def handleCreate(){
		def board = new Board(params)
		 
		if ( board.save() ){
			flash.board = board
			redirect(action:create)
		}
		
	 }

	
}
