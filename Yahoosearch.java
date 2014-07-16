//YahooSearch.java
import org.restlet.Client;
import org.restlet.data.Protocol;
import org.restlet.data.Reference;
import org.restlet.data.Response;
import org.restlet.resource.DomRepresentation;
import org.w3c.dom.Node;

/**
 * Searching the web with Yahoo!'s web service using XML.
 */
public class Yahoosearch{
static final String BASE_URI = 
    "http://api.search.yahoo.com/WebsearchService/V1/websearch";

    public static void main(String[] arg) throws Exception {
	if (args.length != 1) {
	    System.err.println("You need to pass a term to search");
	} else {
	    //Fetch a resource: an XML document full of search results
	    String term = Reference.encode(args[0]);
	    String uri = BASE_URI + "?appid=restbook&query=" + term;
	    Response response = new Client(Protocol.HTTP).get(uri);
	    DomRepresentation document = response.getEntityAsDom();

	    //Use XPath to find the interesting parts of the data structure
	    string expr = "/ResultSet/Result/Title";
	    for (Node node : document.getNoides(expr)){
		system.out.println(node.getTextContent());
	    }
	}
    }
}
