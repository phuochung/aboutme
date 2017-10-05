package library;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class LibStringMd5 {
	public static String LibStringMd5(String str){
		String resultstr="";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			System.out.println(str.getBytes());
			BigInteger bigInteger = new BigInteger(1, md.digest());		
			resultstr=bigInteger.toString(16);

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return resultstr;
	}
	public static void main(String[] args) {
		System.out.println(LibStringMd5("123456"));
		
	}

}
