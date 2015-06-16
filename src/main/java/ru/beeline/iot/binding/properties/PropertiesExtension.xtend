package ru.beeline.iot.binding.properties

import java.util.ArrayList
import java.util.List
import java.util.Properties
import java.util.StringTokenizer

class PropertiesExtension {

	def Integer getInteger(Properties properties, String key) {
		try {
			Integer.parseInt(properties.getProperty(key))
		} catch (NumberFormatException e) {
			null
		}
	}

	def Integer getInteger(Properties properties, String key, int defaul) {
		try {
			Integer.parseInt(properties.getProperty(key))
		} catch (NumberFormatException e) {
			defaul
		}
	}

	def boolean getBoolean(Properties properties, String key, boolean defaul) {
		try {
			Boolean.parseBoolean(properties.getProperty(key))
		} catch (NumberFormatException e) {
			defaul
		}
	}

	def List<Integer> getListInteger(Properties properties, String key) {
		val result = new ArrayList<Integer>
		val string = properties.getProperty(key)
		val tokenizer = new StringTokenizer(string, ",")
		while (tokenizer.hasMoreTokens) {
			val token = tokenizer.nextToken.trim
			try {
				val integer = Integer.parseInt(token)
				result += integer
			} catch (NumberFormatException e) {
			}
		}
		return result
	}

}
