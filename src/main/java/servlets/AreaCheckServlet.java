package servlets;

import jakarta.servlet.ServletContext;
import models.Point;
import java.util.ArrayList;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import validators.HitStatus;
import validators.Validator;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;


@WebServlet("/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        long timer = System.nanoTime();
        Validator validator = new Validator(req);

        HitStatus hitStatus = validator.getStatus();
        Point point = validator.getPoint();

        if(hitStatus.equals(HitStatus.NOT_VALIDATED)) return;

        int timezone = Integer.parseInt(req.getParameter("timezone"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String currentTime = formatter.format(LocalDateTime.now(ZoneOffset.UTC).plusMinutes(timezone));
        long scriptTime = (long) ((System.nanoTime() - timer) * 0.001);

        point.setTime(currentTime);
        point.setStatus(hitStatus == HitStatus.HIT);
        point.setScriptTime(scriptTime);

        ServletContext servletContext = getServletContext();
        servletContext.setAttribute("resultX", point.getX());
        servletContext.setAttribute("resultY", point.getY());
        servletContext.setAttribute("resultR", point.getR());
        servletContext.setAttribute("resultHit", point.getStatus());
        servletContext.setAttribute("resultTime", point.getTime());
        servletContext.setAttribute("resultScriptTime", point.getScriptTime());

        ArrayList<Point> resultsCollection = (ArrayList<Point>) servletContext.getAttribute("resultsCollection");
        if (resultsCollection == null) {
            resultsCollection = new ArrayList<Point>();
        }
        resultsCollection.add(0, point);
        servletContext.setAttribute("resultsCollection", resultsCollection);
    }
}
