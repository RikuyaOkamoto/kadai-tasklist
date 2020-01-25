package controllers;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Tasklist;
import utils.DBUtil;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        EntityManager em = DBUtil.createEntityManager();

        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        }catch(NumberFormatException e){}

        List<Tasklist> tasklist = em.createNamedQuery("getAllTasklists", Tasklist.class)
                                     .setFirstResult(15 * (page -1))
                                     .setMaxResults(15)
                                     .getResultList();

        long tasklist_count = (long)em.createNamedQuery("getTasklistsCount", Long.class)
                                      .getSingleResult();

        em.close();

        request.setAttribute("tasklist", tasklist);
        request.setAttribute("tasklist_count", tasklist_count);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/tasklist/index.jsp");
        rd.forward(request, response);
    }

}
