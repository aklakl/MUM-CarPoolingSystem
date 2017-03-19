package util;

import com.google.gson.*;

//kit
public class JsonUtil {

	public JsonUtil() {
		// TODO Auto-generated constructor stub
		
	}
	

	public static String beanToJSONString(Object bean) {
	    return new Gson().toJson(bean);
	}
	 
	public static Object JSONToObject(String json,Class beanClass) {
	    Gson gson = new Gson();
	    Object res = gson.fromJson(json, beanClass);
	    return res;
	}
	
	public static JsonArray jsonStringToJsonArray(String jsonstr) {
		JsonParser parser = new JsonParser();
		JsonArray Jarray = parser.parse(jsonstr).getAsJsonArray();
	    return Jarray;
	}
	
	public static JsonObject jsonStringToJsonObject(String jsonstr) {
		JsonObject returnData = new JsonParser().parse(jsonstr).getAsJsonObject();
	    return returnData;
	}
	
	
	public  static void main(String[] arg) {
		/*
		ArrayList<channelSearchEnum>  = new ArrayList<channelSearchEnum>();

		for(JsonElement obj : Jarray ){
		    channelSearchEnum cse = gson.fromJson( obj , channelSearchEnum.class);
		    lcs.add(cse);   
		}
		*/
		String json = "[{\"username\":\"test\"},{\"username\":\"test2\"}]";
		System.out.println(new JsonParser().parse(json).getAsJsonArray().get(0).getAsJsonObject().get("username").getAsString());

		String json1= "{\"pids\":[\"1\",\"2\",\"3\"]}";
		System.out.println(new JsonParser().parse(json).getAsJsonObject().getAsJsonArray("pids").get(0).getAsString());
	}

}
