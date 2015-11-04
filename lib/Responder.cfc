component {

	function throwNotFoundError() {
		respond({
			errorCode: 404,
			type: "Not found"
		});
	}

	function throwValidationError(array errors) {
		respond({
			errorCode: 400,
			type: "Validation Error",
			content: serializeJSON( errors )
		});
	}

	private void function respond(struct response) {

		if(isDefined("response.content")) {
			throw(errorCode = response.errorCode, type = response.type, detail = response.content);
		} else {
			throw(errorCode = response.errorCode, type = response.type);
		}
	}
}