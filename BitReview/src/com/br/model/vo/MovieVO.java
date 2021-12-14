package com.br.model.vo;

public class MovieVO {
	private int movie_id;
	private String title;
	private String genre;
	private String year;
	private String grade;
	private String director;
	private String cast;
	private String story;
	private double stt;
	
	
	
	public double getStt() {
		return stt;
	}

	public void setStt(double stt) {
		this.stt = stt;
	}
	
	public MovieVO() {}
	
	
	public MovieVO(int movie_id, String title, String genre, String year, String grade, String director, String cast,
			String story) {
		super();
		this.movie_id = movie_id;
		this.title = title;
		this.genre = genre;
		this.year = year;
		this.grade = grade;
		this.director = director;
		this.cast = cast;
		this.story = story;
	}
	
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}

	
	@Override
	public String toString() {
		return "MovieVO [movie_id=" + movie_id + ", title=" + title + ", genre=" + genre + ", year=" + year + ", grade="
				+ grade + ", director=" + director + ", cast=" + cast + ", story=" + story + "]";
	}
	
	
	
}
