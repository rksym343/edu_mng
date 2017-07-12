package com.dgit.domain;

public class Timetable {

	private int cNo;
	private int ttDay;
	private int ttStarttime;
	private int ttEndtime;

	public int getcNo() {
		return cNo;
	}

	public int getTtDay() {
		return ttDay;
	}

	public int getTtStarttime() {
		return ttStarttime;
	}

	public int getTtEndtime() {
		return ttEndtime;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public void setTtDay(int ttDay) {
		this.ttDay = ttDay;
	}

	public void setTtStarttime(int ttStarttime) {
		this.ttStarttime = ttStarttime;
	}

	public void setTtEndtime(int ttEndtime) {
		this.ttEndtime = ttEndtime;
	}

}
