package co.lucjay.lmstest.student.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.lucjay.lmstest.student.board.dao.BoardDao;
import co.lucjay.lmstest.student.board.vo.BoardVo;

@WebServlet("/boardInsert.do")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardInsertController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();

		String filepath = request.getSession().getServletContext().getRealPath("fileupload");
		int filesize = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, filepath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String str = (String) files.nextElement();

		vo.setWriter(multi.getParameter("writer"));
		vo.setWdate(Date.valueOf(multi.getParameter("wdate"))); // 문자를 날짜로 변환
		vo.setTitle(multi.getParameter("title"));
		vo.setContents(multi.getParameter("contents"));
		String ofile = multi.getOriginalFileName(str);
		vo.setFilename(ofile);

		int n = dao.insert(vo);
		String path = null;
		if (n != 0) {
			String file = multi.getFilesystemName(str);
			path = "boardList.do";
		} else {
			path = "views/board/boardInsertFail.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
