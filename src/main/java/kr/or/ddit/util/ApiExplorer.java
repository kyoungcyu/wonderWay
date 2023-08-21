package kr.or.ddit.util;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.JsonObject;

import java.io.BufferedReader;
import java.io.IOException;


//기차 api 쓰기 위한 클래스
public class ApiExplorer {
	//오라클 연결 
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String DB_USER = "test";
	private static final String DB_PASSWORD = "java";
    
    public static void main(String[] args) throws IOException, ParseException, SQLException {
		       
        for (int cityCode = 0; cityCode <= 100; cityCode++) {
        		//api 제공코드
	        	StringBuilder sb = new StringBuilder();
	
		        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList"); /*URL*/
		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=oES3DXCsu2x08XrIBSHcSXPsqYTxcC%2Fla15cKrNZZktKySptIVZtTsDE%2BDpH0N7d3kqGBBO7NIw4aMhG2GaZ3w%3D%3D"); /*Service Key*/
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
		        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
		        urlBuilder.append("&" + URLEncoder.encode("cityCode","UTF-8") + "=" + URLEncoder.encode(String.valueOf(cityCode), "UTF-8")); /*시/도 ID*/
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/json");
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		       
		        //db 인서트하기 위해 json파싱하고 데이터 꺼내오기 
		        JSONParser jsonParser=new JSONParser();
		        JSONObject jsonObject =(JSONObject) jsonParser.parse(sb.toString());
		        JSONObject jsonResponse=(JSONObject) jsonObject.get("response");
		        JSONObject jsonBody=(JSONObject) jsonResponse.get("body");
		        
		        Object itemsObj = jsonBody.get("items");
		        if (itemsObj != null && itemsObj instanceof JSONObject) {
		            JSONObject jsonItems = (JSONObject) itemsObj;
		            JSONArray jsonArray=(JSONArray) jsonItems.get("item");
		            
		            //db연결
		            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		            
	                String sql = "INSERT INTO TRN_STATION (STATION_ID, STATION_NM) VALUES (?, ?)";

			        
		            //item에서 아이디랑 이름을 꺼내온다 
			        for (Object item : jsonArray) {
		                JSONObject itemObject = (JSONObject) item;
		                String nodeId = (String) itemObject.get("nodeid");
		                String nodeName = (String) itemObject.get("nodename");
		                System.out.println(nodeId+" "+nodeName);
		                
		                PreparedStatement preparedStatement = connection.prepareStatement(sql);
		                preparedStatement.setString(1, nodeId);
		                preparedStatement.setString(2, nodeName);

		                // 쿼리 실행
		                int a = preparedStatement.executeUpdate();
		                System.out.println(a);
			        }
		        } else {
		        	System.out.println("넘김");
		        
		        }
		        
		        rd.close();
		        conn.disconnect();
		        
        }
    }
}
