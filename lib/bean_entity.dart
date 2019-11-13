class BeanEntity {
	BeanResponse response;
	String status;

	BeanEntity({this.response, this.status});

	BeanEntity.fromJson(Map<String, dynamic> json) {
		response = json['response'] != null ? new BeanResponse.fromJson(json['response']) : null;
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.response != null) {
      data['response'] = this.response.toJson();
    }
		data['status'] = this.status;
		return data;
	}
}

class BeanResponse {
	List<BeanResponseData> data;

	BeanResponse({this.data});

	BeanResponse.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<BeanResponseData>();(json['data'] as List).forEach((v) { data.add(new BeanResponseData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class BeanResponseData {
	String address;
	String province;
	String road;
	String city;
	String district;
	String name;
	double x;
	double y;
	List<Null> pois;

	BeanResponseData({this.address, this.province, this.road, this.city, this.district, this.name, this.x, this.y, this.pois});

	BeanResponseData.fromJson(Map<String, dynamic> json) {
		address = json['address'];
		province = json['province'];
		road = json['road'];
		city = json['city'];
		district = json['district'];
		name = json['name'];
		x = json['x'];
		y = json['y'];
		if (json['pois'] != null) {
			pois = new List<Null>();
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['address'] = this.address;
		data['province'] = this.province;
		data['road'] = this.road;
		data['city'] = this.city;
		data['district'] = this.district;
		data['name'] = this.name;
		data['x'] = this.x;
		data['y'] = this.y;
		if (this.pois != null) {
      data['pois'] =  [];
    }
		return data;
	}
}
