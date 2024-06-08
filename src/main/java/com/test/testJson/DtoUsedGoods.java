package com.test.testJson;

import java.util.*;

import org.json.simple.JSONObject;

public class DtoUsedGoods {

	private int sellerId;
	private String title;
	private String description;
	private int price;
	private String pictureUrl;
	
	public DtoUsedGoods (int sellerId, String title, String description, int price, String pictureUrl) {
		this.sellerId = sellerId;
		this.title = title;
		this.description = description;
		this.price = price;
		this.pictureUrl = pictureUrl;
	}
	
	public Map<String, Object> mapDto(){
		Map<String, Object> map = new HashMap<>();
		map.put("sellerId", this.sellerId);
		map.put("title", this.title);
		map.put("description", this.description);
		map.put("price", this.price);
		map.put("pictureUrl", this.pictureUrl);
		
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject jsonObjectFromDto() {
		JSONObject jsonObject = new JSONObject();
		for(Map.Entry<String, Object> entry:  mapDto().entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			jsonObject.put(key, value);
		}
		return jsonObject;
	}
}
