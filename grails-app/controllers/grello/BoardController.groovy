package grello

class BoardController extends SecureController{
		static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
   
		def operationHistoryService
		def operationCode
		
	def index() {
		
		def boardList = [ boardList: Board.list( params) ]
		
		}
	
	def show () {
		[ board : Board.get( params.id ) ]
		
		}
	def delete (Board board) {
		operationCode = "delete board "+"$board.boardName"
		if(board == null){
			flash.message = message(code: 'default.updated.message', args: [message(code: 'Board.label', default: 'Board'), board.id])
			return
		} 
		board.delete flush:true
		operationHistoryService.addToHistory(operationCode)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Board.label', default: 'Board'), board.id])
                redirect action:"index", method:"GET"
            }
            
        }
		
		}
	def edit = {
		def board = Board.get( params.id )
		if(!board) {
		flash.message = "Board not found with id ${params.id}"
		redirect(action:index)
			}
		else {
		return [ board : board ]
			}
		}
	
	def update(Board board) {
		operationCode = "update board"+"$board.boardName"
		if(board == null) {
			request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'board.label', default: 'Board'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
			return
		}
		if (board.hasErrors()) {
			respond board.errors, view:'edit'
			return
		}
		board.save flush:true
		operationHistoryService.addToHistory(operationCode)
		request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'board.label', default: 'Board'), board.id])
                redirect board
            }
            '*'{ respond board, [status: OK] }
        }
		}
	def create()  {
		respond new Board(params)
		
		}
	def save (Board board){
		operationCode = "create new board"+"$board.boardName"
		if (board == null) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'board.label', default: 'Board'), params.id])
			return
		}
		if (board.hasErrors()) {
			respond board.errors, view:'create'
			return
		}
		board.save flush:true
		operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'board.label', default: 'Board'), board.id])
                redirect board
            }
            '*' { respond board, [status: CREATED] }
        }
	}
}