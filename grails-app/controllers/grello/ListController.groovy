package grello

class ListController extends SecureController{

   	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
   
	   def operationHistoryService
	   def operationCode
	   
	def index() {
		
		[ listsList: List.list( params ) ]
		}
	
	def show () {
		[ lists : List.get( params.id ) ]
		
		}
	def delete (List lists) {
		operationCode = "delete list "+"$lists.listName"
		if(lists == null){
			flash.message = message(code: 'default.updated.message', args: [message(code: 'Lists.label', default: 'List'), lists.id])
			return
		} 
		lists.delete flush:true
		operationHistoryService.addToHistory(operationCode)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'List.label', default: 'List'), lists.id])
                redirect action:"index", method:"GET"
            }
            
        }
		
		}
	def edit = {
		def lists = List.get( params.id )
		if(!lists) {
		flash.message = "List not found with id ${params.id}"
		redirect(action:index)
			}
		else {
		return [ lists : lists ]
			}
		}
	
	def update(List lists) {
		operationCode = "update list "+"$lists.listName"
		if(lists == null) {
			request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lists.label', default: 'List'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
			return
		}
		if (lists.hasErrors()) {
			respond lists.errors, view:'edit'
			return
		}
		lists.save flush:true
		operationHistoryService.addToHistory(operationCode)
		request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'List.label', default: 'List'), lists.id])
                redirect lists
            }
            '*'{ respond lists, [status: OK] }
        }
		}
	def create()  {
		respond new List(params)
		
		}
	def save (List lists){
		operationCode = "create new list "+"$lists.listName"
		if (lists == null) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'lists.label', default: 'List'), params.id])
			return
		}
		if (lists.hasErrors()) {
			respond lists.errors, view:'create'
			return
		}
		lists.save flush:true
		operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'List.label', default: 'List'), lists.id])
                redirect lists
            }
            '*' { respond lists, [status: CREATED] }
        }
	}
}