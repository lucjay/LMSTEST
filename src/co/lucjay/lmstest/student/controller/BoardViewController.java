package co.lucjay.lmstest.student.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.lucjay.lmstest.student.board.dao.BoardDao;
import co.lucjay.lmstest.student.board.vo.BoardVo;

@WebServlet("/boardView.do")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardViewController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();

		vo.setBoardid(Integer.parseInt(request.getParameter("boardid")));
		vo = dao.select(vo);
		request.setAttribute("view", vo);
		String path = "views/board/boardView.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

}
