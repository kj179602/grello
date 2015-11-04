package grello

class BoardController extends SecureController{
	
	def index(){
		def boards = Board.list()
		[boards:boards]
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
