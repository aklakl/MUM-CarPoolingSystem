package util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import Model.Users;
import dao.DataAccess;

public class DBUtil {

	static String[] numberTypeArray = {"java.lang.Long","java.lang.Int","java.lang.Integer","java.lang.Short","java.lang.Float","java.lang.Double","int","long","double","float"};
	static List<String> numberTypes = Arrays.asList(numberTypeArray);
	//convert to sql Paramter
	public static String  mapConvertParamterString( Map m ){
		
		return null;
	}
	

    
	public static Collection resultSetToBean(final ResultSet result, final Class clazz) {
		Collection collection = null;
		try {
			ResultSetMetaData rsmd = result.getMetaData();
			int cols = rsmd.getColumnCount();
			//  arraylist collection 
			collection = new ArrayList(cols);
			while (result.next()) {
				Object object = null;
				try {
					//  from class get object 
					object = clazz.newInstance();
				} catch (Exception e) {
					System.out.println("convert error!");
				}
				for (int i = 1; i <= cols; i++) {
					beanRegister(object, rsmd.getColumnName(i), result.getString(i));
				}
				// insert collection
				collection.add(object);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
		}
		return collection;
	}
	 
	private static void beanRegister(Object object, String beanProperty, String value) {
		if (beanProperty.toLowerCase().equals("row_num")) {
			return;
		}
		//  setter getter
		Object[] beanObject = beanMatch(object.getClass(), beanProperty);
		Object[] cache = new Object[1];
		Method getter = (Method) beanObject[0];
		Method setter = (Method) beanObject[1];
		try {
			String methodType = getter.getReturnType().getName();
			if (value != null && !value.equals("")) {
				if (methodType.equalsIgnoreCase("java.lang.Long")) {
					cache[0] = new Long(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.lang.Int") || methodType.equalsIgnoreCase("java.lang.Integer") || methodType.equalsIgnoreCase("int")) {
					cache[0] = new Integer(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.lang.Short")) {
					cache[0] = new Short(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.lang.Float")) {
					cache[0] = new Float(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.lang.Double")) {
					cache[0] = new Double(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.lang.Boolean")) {
					cache[0] = new Boolean(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.util.Date")) {
					SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					cache[0] = sdft.parse(value);
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.lang.String")) {
					cache[0] = value;
					setter.invoke(object, cache);
				} else if (methodType.equalsIgnoreCase("java.io.InputStream")) {

				} else if (methodType.equalsIgnoreCase("char")) {
					cache[0] = (Character.valueOf(value.charAt(0)));
					setter.invoke(object, cache);
				}
			}
		} catch (Exception e) {
			//e.printStackTrace();  //this need to fix
		}
	}
	
	private static Object[] beanMatch(Class clazz, String beanProperty) {
		Object[] result = new Object[2];//setterã€�getter
		beanProperty = beanProperty.toLowerCase();
		char beanPropertyChars[] = beanProperty.toCharArray();
		beanPropertyChars[0] = Character.toUpperCase(beanPropertyChars[0]);
		String s = new String(beanPropertyChars);
		String names[] = { ("get" + s).intern(), ("set" + s).intern() };
		Method getter = null;
		Method setter = null;
		Method methods[] = clazz.getMethods();
		for (int i = 0; i < methods.length; i++) {
			Method method = methods[i];
			if (!Modifier.isPublic(method.getModifiers()))
				continue;
			String methodName = method.getName().intern();
			for (int j = 0; j < names.length; j++) {
				String name = names[j];
				if (!name.equals(methodName))
					continue;
				if (methodName.startsWith("set"))
					setter = method;
				else
					getter = method;
			}
		}
		result[0] = getter;
		result[1] = setter;
		return result;
	}
	
	/**
     *  
     * @param model
     * @return
     * @throws Exception
     */
    public static Map<String,String> getModelAttriButeType(Object model) throws Exception{
        Field[] field = model.getClass().getDeclaredFields();         
        Map<String,String> map = new HashMap<String, String>();
        for(int j=0 ; j<field.length ; j++){     // 
              String name = field[j].getName();    //get attribute
              //System.out.print("attribute name:"+name);     
              name = name.substring(0,1).toUpperCase()+name.substring(1);  
              String type = field[j].getGenericType().toString();     
              /*if(type.equals("class java.lang.String")){    
                  Method m = model.getClass().getMethod("get"+name);
                  String value = (String) m.invoke(model);     
                  if(value != null){

                      System.out.println("attribute value:"+value);
                  }
              }*/
              type = type.replace("class ", "");
              //System.out.println("=>:"+type);
              map.put(name, type);
          }
        return map;
    }
	
    
    public static String generInsertString(Object model) throws Exception{
        Field[] field = model.getClass().getDeclaredFields();
        String tableName = model.getClass().getName().toLowerCase();
        tableName = tableName.split("\\.")[tableName.split("\\.").length-1];
    	StringBuffer sqlBufferHead = new StringBuffer("insert into "+tableName+"");
		StringBuffer sqlBufferField = new StringBuffer("(");
		StringBuffer sqlBufferValue = new StringBuffer(" value(");
				
        for(int j=1 ; j<field.length ; j++){     	// 
              String name = field[j].getName();    	//get attribute
              field[j].setAccessible(true);
              Object value = field[j].get(model);
              String methodType = field[j].getGenericType().toString(); 
              //System.out.println("attribute:"+name +"|value:"+value +"|type:"+methodType); 
              //name = name.substring(0,1).toUpperCase()+name.substring(1); // 
              methodType = methodType.replace("class ", "");
              //System.out.println("=>:"+methodType);
            
              if (value != null && !value.equals("")) {
            	  	sqlBufferField.append(name);
  					if (numberTypes.contains(methodType)) {
  						sqlBufferValue.append(value);
	  				} else if (methodType.equalsIgnoreCase("java.lang.Boolean")) {
	  					sqlBufferValue.append(value);
	  				} else if (methodType.equalsIgnoreCase("java.util.Date")) {
	  					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  					String dateString = formatter.format(value);
	  					sqlBufferValue.append(dateString);
	  				} else if (methodType.equalsIgnoreCase("java.lang.String")) {
	  					sqlBufferValue.append("'"+value+"'");
	  				} else if (methodType.equalsIgnoreCase("java.io.InputStream")) {
	  					System.err.println("error:");
	  				} else if (methodType.equalsIgnoreCase("char")) {
	  					sqlBufferValue.append("'"+value+"'");
	  				}
  					
  			}
              if (j<field.length-1){
            	  if (value != null && !value.equals("")){
	            	  sqlBufferField.append(",");
	            	  sqlBufferValue.append(",");
            	  }else{
            		  System.out.println("field.length:"+field.length);
            	  }
              }else{
            	  sqlBufferField.append(")");
            	  sqlBufferValue.append(")");
              }
              
        }
        sqlBufferHead.append(sqlBufferField);
        sqlBufferHead.append(sqlBufferValue);
        //System.out.println("generInsertString:"+sqlBufferHead.toString());
        return sqlBufferHead.toString();
    }
    
    
    public static void main(String[] arg){
    	DataAccess dataAccess = new DataAccess();
    	
    	DBUtil dbUtil = new DBUtil();
    	try {
    		
    		String  search = "select * from users ";
    		ResultSet rs = dataAccess.executeQuery(search);
    		List list = (List)DBUtil.resultSetToBean(rs, Users.class);
    		System.out.println(list.size());
    		Users user =  (Users)list.get(0);
    		dbUtil.generInsertString(user);
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
    

}
