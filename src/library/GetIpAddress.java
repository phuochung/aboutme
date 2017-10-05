package library;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public class GetIpAddress  {
		public static String getClientIpAddress(HttpServletRequest request) throws Exception{
			String ip = request.getHeader("X-FORWARDED-FOR");
			 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		            ip = request.getHeader("Proxy-Client-IP");  
		        }  
		        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		            ip = request.getHeader("WL-Proxy-Client-IP");  
		        }  
		        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		            ip = request.getHeader("HTTP_CLIENT_IP");  
		        }  
		        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
		        }  
		        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
		            ip = request.getRemoteAddr();  
		        }
		        if (ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
		        	InetAddress inetAddress = null;
					try {
						inetAddress = InetAddress.getLocalHost();
					} catch (UnknownHostException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		            String ipAddress = inetAddress.getHostAddress();
		            ip = ipAddress;
		        }
			return ip;
		}

}
