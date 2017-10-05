package library;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class LibProrerties {
	public Properties readFileproperties() {
		Properties properties = new Properties();
		String dirPath = this.getClass().getResource("").getPath();
		
		dirPath = dirPath.replaceFirst("/", "").replace("classes/library/", "");
		String urlFile = dirPath + "config.properties";
		
		try {
			properties.load(new FileInputStream(urlFile));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return properties;
	}
	public static void main(String[] args) {
		LibProrerties lib = new LibProrerties();
		lib.readFileproperties();
	}
}
