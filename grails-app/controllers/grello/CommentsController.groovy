package grello

class CommentsController extends SecureController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def operationHistoryService
	def operationCode
	
	 def index() {
		 
		 [ commentsList: Comments.list( params ) ]
		 }
	 
	 def show () {
		 [ comments : Comments.get( params.id ) ]
		 
		 }
	 def delete (Comments comments) {
		 operationCode = "delete comments by "+"$comments.commentCreater.firstName"
		 if(comments == null){
			 flash.message = message(code: 'default.updated.message', args: [message(code: 'Comments.label', default: 'Comments'), comments.id])
			 return
		 }
		 comments.delete flush:true
		 operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comments.label', default: 'Comments'), comments.id])
				 redirect action:"index", method:"GET"
			 }
			 
		 }
		 
		 }
	 def edit = {
		 def comments = Comments.get( params.id )
		 if(!comments) {
		 flash.message = "Comments not found with id ${params.id}"
		 redirect(action:index)
			 }
		 else {
		 return [ comments : comments ]
			 }
		 }
	 
	 def update(Comments comments) {
		 operationCode = "update comments by "+"$comments.commentCreater.firstName"
		 
		 if(comments == null) {
			 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.not.found.message', args: [message(code: 'comments.label', default: 'Comments'), params.id])
				 redirect action: "index", method: "GET"
			 }
			 '*'{ render status: NOT_FOUND }
		 }
			 return
		 }
		 if (comments.hasErrors()) {
			 respond comments.errors, view:'edit'
			 return
		 }
		 comments.save flush:true
		 operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.updated.message', args: [message(code: 'Comments.label', default: 'Comments'), comments.id])
				 redirect comments
			 }
			 '*'{ respond comments, [status: OK] }
		 }
		 }
	 def create()  {
		 respond new Comments(params)
		 
		 }
	 def save (Comments comments){
		 operationCode = "create new comments by "+"$comments.commentCreater.firstName"
		 if (comments == null) {
			 flash.message = message(code: 'default.not.found.message', args: [message(code: 'comments.label', default: 'Comments'), params.id])
			 return
		 }
		 if (comments.hasErrors()) {
			 respond comments.errors, view:'create'
			 return
		 }
		 comments.save flush:true
		 operationHistoryService.addToHistory(operationCode)
		  request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.created.message', args: [message(code: 'comments.label', default: 'Comments'), comments.id])
				 redirect comments
			 }
			 '*' { respond comments, [status: CREATED] }
		 }
	 }
}
