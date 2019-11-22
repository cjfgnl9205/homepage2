package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {



	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));   // yyyy-mm-dd 로 변환해서 오늘 날짜 저장
			cal.add(Calendar.DATE, -1);  // 어제 날짜
		}

		return list;
	}

	
	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if(wdate.equals(list.get(0))  || wdate.equals(list.get(1))  || wdate.equals(list.get(2))) {
			flag = true;
		}
		return flag;
	}
	
	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}
		return str;
	}

	/**
	 * 
	 * @param totalRecord   전체 레코드수
	 * @param nowPage       현재 페이지
	 * @param recordPerPage 페이지당 레코드 수
	 * @param col           검색 컬럼
	 * @param word          검색어
	 * @return 페이징 생성 문자열
	 */
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination justify-content-center'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append(
					"<li class='page-item'><a class='page-link' href='./list.jsp?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "' >이전</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='page-item active' ><a class='page-link' href=#>" + i + "</a></li>");
			} else {
				str.append("<li class='page-item'><a  class='page-link' href='./list.jsp?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i
						+ "</A></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append(
					"<li class='page-item'><A class='page-link' href='./list.jsp?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}
}
