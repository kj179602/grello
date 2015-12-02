package grello

class TaskController extends SecureController{
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def operationHistoryService
	def operationCode
	
	 def index() {
		 
		 [ taskList: Task.list( params ) ]
		 }
	 
	 def show () {
		 [ task : Task.get( params.id ) ]
		 
		 }
	 def delete (Task task) {
		 operationCode = "delete task "+"$task.taskName"
		 if(task == null){
			 flash.message = message(code: 'default.updated.message', args: [message(code: 'Task.label', default: 'Task'), task.id])
			 return
		 }
		 task.delete flush:true
		 operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.deleted.message', args: [message(code: 'Task.label', default: 'Task'), task.id])
				 redirect action:"index", method:"GET"
			 }
			 
		 }
		 
		 }
	 def edit = {
		 def task = Task.get( params.id )
		 if(!task) {
		 flash.message = "Task not found with id ${params.id}"
		 redirect(action:index)
			 }
		 else {
		 return [ task : task ]
			 }
		 }
	 
	 def update(Task task) {
		 operationCode = "update task "+"$task.taskName"
		 
		 if(task == null) {
			 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
				 redirect action: "index", method: "GET"
			 }
			 '*'{ render status: NOT_FOUND }
		 }
			 return
		 }
		 if (task.hasErrors()) {
			 respond task.errors, view:'edit'
			 return
		 }
		 task.save flush:true
		 operationHistoryService.addToHistory(operationCode)
		 request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.updated.message', args: [message(code: 'Task.label', default: 'Task'), task.id])
				 redirect task
			 }
			 '*'{ respond task, [status: OK] }
		 }
		 }
	 def create()  {
		 respond new Task(params)
		 
		 }
	 def save (Task task){
		 operationCode = "create new task "+"$task.taskName"
		 if (task == null) {
			 flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
			 return
		 }
		 if (task.hasErrors()) {
			 respond task.errors, view:'create'
			 return
		 }
		 task.save flush:true
		 operationHistoryService.addToHistory(operationCode)
		  request.withFormat {
			 form multipartForm {
				 flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), task.id])
				 redirect task
			 }
			 '*' { respond task, [status: CREATED] }
		 }
	 }
	 
 }

