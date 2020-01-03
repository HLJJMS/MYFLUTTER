class AddressBeanEntity {
	AddressBeanResult result;
	String status;

	AddressBeanEntity({this.result, this.status});

	AddressBeanEntity.fromJson(Map<String, dynamic> json) {
		result = json['result'] != null ? new AddressBeanResult.fromJson(json['result']) : null;
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] = this.result.toJson();
    }
		data['status'] = this.status;
		return data;
	}
}

class AddressBeanResult {
	String formattedAddress;
	String business;
	int cityCode;
	AddressBeanResultLocation location;
	AddressBeanResultAddresscomponent addressComponent;

	AddressBeanResult({this.formattedAddress, this.business, this.cityCode, this.location, this.addressComponent});

	AddressBeanResult.fromJson(Map<String, dynamic> json) {
		formattedAddress = json['formatted_address'];
		business = json['business'];
		cityCode = json['cityCode'];
		location = json['location'] != null ? new AddressBeanResultLocation.fromJson(json['location']) : null;
		addressComponent = json['addressComponent'] != null ? new AddressBeanResultAddresscomponent.fromJson(json['addressComponent']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['formatted_address'] = this.formattedAddress;
		data['business'] = this.business;
		data['cityCode'] = this.cityCode;
		if (this.location != null) {
      data['location'] = this.location.toJson();
    }
		if (this.addressComponent != null) {
      data['addressComponent'] = this.addressComponent.toJson();
    }
		return data;
	}
}

class AddressBeanResultLocation {
	double lng;
	double lat;

	AddressBeanResultLocation({this.lng, this.lat});

	AddressBeanResultLocation.fromJson(Map<String, dynamic> json) {
		lng = json['lng'];
		lat = json['lat'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lng'] = this.lng;
		data['lat'] = this.lat;
		return data;
	}
}

class AddressBeanResultAddresscomponent {
	String distance;
	String province;
	String city;
	String street;
	String district;
	String streetNumber;
	String direction;

	AddressBeanResultAddresscomponent({this.distance, this.province, this.city, this.street, this.district, this.streetNumber, this.direction});

	AddressBeanResultAddresscomponent.fromJson(Map<String, dynamic> json) {
		distance = json['distance'];
		province = json['province'];
		city = json['city'];
		street = json['street'];
		district = json['district'];
		streetNumber = json['street_number'];
		direction = json['direction'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['distance'] = this.distance;
		data['province'] = this.province;
		data['city'] = this.city;
		data['street'] = this.street;
		data['district'] = this.district;
		data['street_number'] = this.streetNumber;
		data['direction'] = this.direction;
		return data;
	}
}
