package com.yoon.emotions;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;

class JasyptConfigTest {

	@Test
	void stringEncryptor() {
		String username = "emotions";
		String password = "young0901";

		System.out.println(jasyptEncoding(username));
		System.out.println(jasyptEncoding(password));
	}

	public String jasyptEncoding(String value) {

		String key = "my_jasypt_key";
		StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
		pbeEnc.setAlgorithm("PBEWithMD5AndDES");
		pbeEnc.setPassword(key);
		return pbeEnc.encrypt(value);
		
	}
}
