package ru.beeline.iot.binding.exception

import java.lang.Exception

class BindingReadException extends Exception {
	
	new() {
		super()
	}
	
	new(String arg0) {
		super(arg0)
	}
	
	new(String arg0, Throwable arg1) {
		super(arg0, arg1)
	}
	
	protected new(String arg0, Throwable arg1, boolean arg2, boolean arg3) {
		super(arg0, arg1, arg2, arg3)
	}
	
	new(Throwable arg0) {
		super(arg0)
	}
	
}