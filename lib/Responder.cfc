component {

	function throwNotFoundError() {
		respond({
			errorCode: 404,
			content: "Not found"
		});
	}

	function throwValidationError() {
		respond({
			errorCode: 400,
			content: "Validation error"
		});
	}

	private void function respond(struct response) {
		
		var error = {
			errorCode: response.errorCode,
			type: (isDefined('response.content') ? response.content : "")
		};

		throw(errorCode = error.errorCode, type = error.type);
	}
}