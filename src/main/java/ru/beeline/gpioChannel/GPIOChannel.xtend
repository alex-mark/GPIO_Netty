package ru.beeline.gpioChannel

import java.util.Properties
import jdk.dio.DeviceConfig
import jdk.dio.DeviceManager
import jdk.dio.gpio.GPIOPin
import jdk.dio.gpio.GPIOPinConfig

import io.netty.channel.nio.AbstractNioMessageChannel
import java.util.List
import io.netty.channel.ChannelOutboundBuffer
import java.net.SocketAddress
import io.netty.channel.Channel
import java.nio.channels.SelectableChannel
import ru.beeline.iot.binding.exception.BindingWriteException
import ru.beeline.iot.binding.exception.BindingBindException
import ru.beeline.iot.binding.exception.BindingUnbindException
import ru.beeline.iot.binding.exception.BindingReadException
import ru.beeline.iot.binding.properties.PropertiesExtension

class GPIOChannel extends AbstractNioMessageChannel{
	val private extension PropertiesExtension ext = new PropertiesExtension

	private GPIOPin gpioPin
	
	protected new(Channel parent, SelectableChannel ch, int readInterestOp) {
		super(parent, ch, readInterestOp)
	}

	def bind(Properties config) throws BindingBindException {
		val controllerNumber = config.getInteger(BIND_CONTROLLER_NUMBER, DeviceConfig.DEFAULT)
		val pinNumber = config.getInteger(BIND_PIN_NUMBER, DeviceConfig.DEFAULT)
		val direction = config.getInteger(BIND_DIRECTION, DeviceConfig.DEFAULT)
		val mode = config.getInteger(BIND_MODE, DeviceConfig.DEFAULT)
		val trigger = config.getInteger(BIND_TRIGGER, GPIOPinConfig.TRIGGER_NONE)
		val initValue = config.getBoolean(BIND_INIT_VALUE, false)

		try {
			val pinConfig = new GPIOPinConfig(controllerNumber, pinNumber, direction, mode, trigger, initValue)
			gpioPin = DeviceManager.open(pinConfig)
		} catch (Exception e) {
			throw new BindingBindException(e)
		}
	}

	def unbind(Properties config) throws BindingUnbindException {
		try {
			gpioPin =>[ GPIOPin a |
				a.close
			]
			gpioPin = null
		} catch (Exception e) {
			throw new BindingUnbindException(e)
		}
	}

	def read(Properties config) throws BindingReadException {
		try {
			return gpioPin.value
		} catch (Exception e) {
			throw new BindingReadException(e)
		}
	}

	def write(Properties config) throws BindingWriteException {
		val command = config.getInteger(WRITE_VALUE, 0)

		try {
			if (command == 1) {
				gpioPin.value = true
			} else if (command == 0) {
				gpioPin.value = false
			} else {
			}
		} catch (Exception e) {
			throw new BindingWriteException(e)
		}
	}
	
	override protected doReadMessages(List<Object> buf) throws Exception {
		try {
			return gpioPin.value
		} catch (Exception e) {
			throw new BindingReadException(e)
		}	}
	
	override protected doWriteMessage(Object msg, ChannelOutboundBuffer in) throws Exception {
		val command = config.getInteger(WRITE_VALUE, 0)

		try {
			if (command == 1) {
				gpioPin.value = true
			} else if (command == 0) {
				gpioPin.value = false
			//} else {
			}
		} catch (Exception e) {
			throw new BindingWriteException(e)
		}
	}
	
	override protected doConnect(SocketAddress remoteAddress, SocketAddress localAddress) throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected doFinishConnect() throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected doBind(SocketAddress localAddress) throws Exception {
		val controllerNumber = config.getInteger(BIND_CONTROLLER_NUMBER, DeviceConfig.DEFAULT)
		val pinNumber = config.getInteger(BIND_PIN_NUMBER, DeviceConfig.DEFAULT)
		val direction = config.getInteger(BIND_DIRECTION, DeviceConfig.DEFAULT)
		val mode = config.getInteger(BIND_MODE, DeviceConfig.DEFAULT)
		val trigger = config.getInteger(BIND_TRIGGER, GPIOPinConfig.TRIGGER_NONE)
		val initValue = config.getBoolean(BIND_INIT_VALUE, false)

		try {
			val pinConfig = new GPIOPinConfig(controllerNumber, pinNumber, direction, mode, trigger, initValue)
			gpioPin = DeviceManager.open(pinConfig)
		} catch (Exception e) {
			throw new BindingBindException(e)
		}
	}
	
	override protected doClose() throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected doDisconnect() throws Exception {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected localAddress0() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected remoteAddress0() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override config() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override isActive() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override metadata() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}