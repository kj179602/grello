package grello

class OperationHistoryController extends SecureController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
		def index(Integer max) {
			params.max = Math.min(max ?: 10, 100)
			respond OperationHistory.list(params), model:[operationCount: OperationHistory.count()]
		}
	
		def show(OperationHistory operation) {
			respond operation
		}
	
		def create() {
			respond new OperationHistory(params)
		}
	
	
		def save(OperationHistory operation) {
			if (operation == null) {
				notFound()
				return
			}
	
			if (operation.hasErrors()) {
				respond operation.errors, view:'create'
				return
			}
	
			operation.save flush:true
	
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'OperationHistory'), operation.id])
					redirect operation
				}
				'*' { respond operation, [status: CREATED] }
			}
		}
	
		def edit(OperationHistory operation) {
			respond operation
		}
	
		
		def update(OperationHistory operation) {
			if (operation == null) {
				request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'OperationHistory.label', default: 'OperationHistory'), params.id])
					redirect action: "index", method: "GET"
				}
				'*'{ render status: NOT_FOUND }
			}
				return
			}
	
			if (operation.hasErrors()) {
				respond operation.errors, view:'edit'
				return
			}
	
			operation.save flush:true
	
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.updated.message', args: [message(code: 'OperationHistory.label', default: 'OperationHistory'), operation.id])
					redirect operation
				}
				'*'{ respond operation, [status: OK] }
			}
		}
	
		
		def delete(OperationHistory operation) {
	
			if (operation == null) {
				request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'OperationHistory.label', default: 'OperationHistory'), params.id])
					redirect action: "index", method: "GET"
				}
				'*'{ render status: NOT_FOUND }
			}
				return
			}
	
			operation.delete flush:true
	
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'OperationHistory.label', default: 'OperationHistory'), operation.id])
					redirect action:"index", method:"GET"
				}
				'*'{ render status: NO_CONTENT }
			}
		}
	
}
