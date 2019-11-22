package notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class NoticeTest {

	public static void main(String[] args) {

		NoticeDAO dao = new NoticeDAO();
		//create(dao);
		//delete(dao);
		//update(dao);
		//read(dao);
		//viewcnt(dao);
		//passCheck(dao);
		//total(dao);
		list(dao);
	}

	private static void list(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "수업");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<NoticeDTO> list = dao.list(map);
		
		Iterator<NoticeDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			NoticeDTO dto = new NoticeDTO();
			dto = iter.next();
			p(dto);
			p("-----------");
		}		
	}

	private static void total(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("col", "content");
		map.put("word", "수업");
		p("개수" + dao.total(map));
	}

	private static void passCheck(NoticeDAO dao) {
		Map map = new HashMap();
		map.put("no", 2);
		map.put("passwd", "1234");
		
		if(dao.passCheck(map)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void viewcnt(NoticeDAO dao) {
		dao.upViewcnt(2);
	}

	private static void read(NoticeDAO dao) {
		int no = 2;
		NoticeDTO dto = dao.read(no);
		p(dto);
	}

	private static void p(NoticeDTO dto) {
		System.out.println("번호 : " + dto.getNo());
		System.out.println("제목 : " + dto.getTitle());
		System.out.println("내용 : " + dto.getContent());
		System.out.println("날짜 : " + dto.getWdate());
		
	}

	private static void update(NoticeDAO dao) {
		NoticeDTO dto = dao.read(2);
		dto.setTitle("updateTitle");
		dto.setContent("updateContent");
		
		if(dao.update(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}



	private static void delete(NoticeDAO dao) {
	
		if(dao.delete(1)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void create(NoticeDAO dao) {
		NoticeDTO dto = new NoticeDTO();
		dto.setId("newid");
		dto.setTitle("newTitle");
		dto.setContent("newContent");
		dto.setPasswd("1234");
		
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void p(String string) {
		System.out.print(string);
	}

}
