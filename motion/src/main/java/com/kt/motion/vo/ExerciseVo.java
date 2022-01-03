package com.kt.motion.vo;

import java.util.Date;

/**
 * @날짜 : 2022.01.02
 * @작성자 : 조진선
 * @기능 : 운동횟수에 대한 객체 생성 DTO
 *
 */
public class ExerciseVo {
	
	int pushupCount;
	int squatCount;
	int steamCount;
	int lungeCount;
	long time;
	int timerOn;
	
	public int getPushupCount() {
		return pushupCount;
	}
	public void setPushupCount(int pushupCount) {
		this.pushupCount = pushupCount;
	}
	public int getSquatCount() {
		return squatCount;
	}
	public void setSquatCount(int squatCount) {
		this.squatCount = squatCount;
	}
	public int getSteamCount() {
		return steamCount;
	}
	public void setSteamCount(int situpCount) {
		this.steamCount = situpCount;
	}
	public int getLungeCount() {
		return lungeCount;
	}
	public void setLungeCount(int lungeCount) {
		this.lungeCount = lungeCount;
	}
	
	@Override
	public String toString() {
		return "{\\\"pushupCount\\\":" + pushupCount + ", \\\"squatCount\\\":" + squatCount + ", \\\"steamCount\\\":" + steamCount
				+ ", \\\"lungeCount\\\":" + lungeCount + ", \\\"time\\\":" + time+", \\\"timerOn\\\":"+timerOn+"}";
	}
	
}
