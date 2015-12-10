package grello



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


class DocumentController extends SecureController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def operationHistoryService
	def operationCode
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Document.list(params), model:[documentCount: Document.count()]
    }

    def show(Document document) {
        respond document
    }

    def create() {
        respond new Document(params)
    }

 
    def save(Document document) {
		operationCode = "create document "+"$document.documentName"
		if (document == null) {
            notFound()
            return
        }

        if (document.hasErrors()) {
            respond document.errors, view:'create'
            return
        }

        document.save flush:true
		operationHistoryService.addToHistory(operationCode)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'document.label', default: 'Document'), document.id])
                redirect document
            }
            '*' { respond document, [status: CREATED] }
        }
    }

    def edit(Document document) {
        respond document
    }


    def update(Document document) {
		operationCode = "update document "+"$document.documentName"
        if (document == null) {
            notFound()
            return
        }

        if (document.hasErrors()) {
            respond document.errors, view:'edit'
            return
        }

        document.save flush:true
		operationHistoryService.addToHistory(operationCode)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Document.label', default: 'Document'), document.id])
                redirect document
            }
            '*'{ respond document, [status: OK] }
        }
    }


    def delete(Document document) {
		operationCode = "delete document "+"$document.documentName"
        if (document == null) {
            notFound()
            return
        }

        document.delete flush:true
		operationHistoryService.addToHistory(operationCode)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Document.label', default: 'Document'), document.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'document.label', default: 'Document'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
