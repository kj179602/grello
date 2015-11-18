package grello

import grails.transaction.Transactional

@Transactional
class OperationHistoryService {

    def addToHistory(operationCode) {
		def operation = new OperationHistory(operationName: operationCode)
		operation.save()
    }
}
