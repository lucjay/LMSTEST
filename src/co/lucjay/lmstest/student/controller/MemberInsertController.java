package co.lucjay.lmstest.student.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.lucjay.lmstest.student.dao.MemberDao;
import co.lucjay.lmstest.student.dao.MemberVo;

@WebServlet("/memberInsert.do")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberInsertController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();

		String filepath = request.getSession().getServletContext().getRealPath("fileupload");
		int filesize = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, filepath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String str = (String) files.nextElement();

		// 디비처리
		vo.setId(multi.getParameter("id"));
		vo.setName(multi.getParameter("name"));
		vo.setPw(multi.getParameter("pw"));
		vo.setAddress(multi.getParameter("address"));
		vo.setGender(multi.getParameter("gender"));
		vo.setTel(multi.getParameter("tel"));
		String[] hobbys = multi.getParameterValues("hobby");
		String item = ""; // 이런방법은 편법임
		if (hobbys != null) {
			for (String h : hobbys) {
				item += h.concat("|");
			}

		} // 여기까지
		vo.setHobby(item);
		String ofile = multi.getOriginalFileName(str);
		vo.setFilename(ofile); // 파일명을 담음
		
		int n = dao.memberInsert(vo);
		String view = null;
		if (n != 0) {
			String file = multi.getFilesystemName(str);
			view = "views/student/fileOk.jsp";
		} else
			view = "views/student/fileFail.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
