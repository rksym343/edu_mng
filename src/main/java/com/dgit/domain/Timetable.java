package com.dgit.domain;

public class Timetable {

	private int ttNo;
	private Course course;
	private int ttDay;
	private int ttStarttime;
	private int ttEndtime;
	private int ttVersion;

	public int getTtNo() {
		return ttNo;
	}

	public void setTtNo(int ttNo) {
		this.ttNo = ttNo;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getTtDay() {
		return ttDay;
	}

	public void setTtDay(int ttDay) {
		this.ttDay = ttDay;
	}

	public int getTtStarttime() {
		return ttStarttime;
	}

	public void setTtStarttime(int ttStarttime) {
		this.ttStarttime = ttStarttime;
	}

	public int getTtEndtime() {
		return ttEndtime;
	}

	public void setTtEndtime(int ttEndtime) {
		this.ttEndtime = ttEndtime;
	}

	public int getTtVersion() {
		return ttVersion;
	}

	public void setTtVersion(int ttVersion) {
		this.ttVersion = ttVersion;
	}

	@Override
	public String toString() {
		return String.format("Timetable [ttNo=%s, course=%s, ttDay=%s, ttStarttime=%s, ttEndtime=%s, ttVersion=%s]",
				ttNo, course, ttDay, ttStarttime, ttEndtime, ttVersion);
	}

}
