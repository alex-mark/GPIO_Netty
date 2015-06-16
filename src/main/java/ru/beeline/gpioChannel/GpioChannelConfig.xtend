package ru.beeline.gpioChannel

import io.netty.channel.DefaultChannelConfig
import io.netty.channel.Channel

class GpioChannelConfig extends DefaultChannelConfig{

	//val public static String NAME = GPIOActivator.getContext.bundle.symbolicName

	val public static String BIND_CONTROLLER_NUMBER = "gpio-bind-controller-number"

	val public static String BIND_PIN_NUMBER = "gpio-bind-pin-number"

	val public static String BIND_DIRECTION = "gpio-bind-direction"

	val public static String BIND_MODE = "gpio-bind-mode"

	val public static String BIND_TRIGGER = "gpio-bind-trigger"

	val public static String BIND_CONTROLLER_NAME = "gpio-bind-controller-name"

	val public static String BIND_INIT_VALUE = "gpio-bind-init-value"

	val public static String WRITE_VALUE = "gpio-write-value"
	
	new(Channel channel) {
		super(channel)
	}
	
}