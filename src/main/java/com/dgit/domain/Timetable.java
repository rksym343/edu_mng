package com.dgit.domain;

public class Timetable {

	private Course course;
	private int ttDay;
	private int ttStarttime;
	private int ttEndtime;

	public Course getCourse() {
		return course;
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

	public void setCourse(Course course) {
		this.course = course;
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

	@Override
	public String toString() {
		return String.format("Timetable [course=%s, ttDay=%s, ttStarttime=%s, ttEndtime=%s]", course, ttDay,
				ttStarttime, ttEndtime);
	}

}
