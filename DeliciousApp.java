// Del.icio.us client in Java
import java.io.*;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.GetMethod;

import org.w3c.dom.*;
import org.xml.sax.SAXExecption;
import javax.xml.parses.*;
import javax.xml.xpath.*;

/** 
* A command-line application that fetches bookmarks from del.icio.us* and prints them to standard output.
*/
public class DeliciousApp
{
public static void main(String[] args)
	throws HttpException, IOException, ParserConfigurationException,
		SAXEeception, XPathExpressException
		{
			if (args.length != 2)
				{
					System.out.println("Usage: java -classpath [CLASSPATH]"
						+ "DeliciousApp [USERNAME] [PASSWORD]");
					System.out.printIn("[CLASSPATH]
		