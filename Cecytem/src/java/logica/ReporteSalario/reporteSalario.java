/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica.ReporteSalario;

import logica.conectarBD;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author arturo
 */
@WebServlet(name = "reporteSalario", urlPatterns = {"/reporteSalario"})
public class reporteSalario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        try {
            try {
                int control = Integer.parseInt(request.getParameter("control"));
                String Carrera = "";
                String Turno = "";
                String e = "";
                conectarBD bd = new conectarBD();
                String fecha = request.getParameter("fecha");
                Document documentoPDF = new Document();
                PdfWriter.getInstance(documentoPDF, out);
                documentoPDF.open();
                Image imagen = Image.getInstance("C:\\Users\\arturo\\Documents\\NetBeansProjects\\Cecytem\\web\\Administracion\\img\\cecytem.jpg");
                imagen.scaleToFit(80, 100);
                imagen.setAlignment(Image.ALIGN_CENTER);
                documentoPDF.add(imagen);
                Paragraph lineaEscribir = new Paragraph();
                Paragraph paTitulo = new Paragraph();
                Paragraph total = new Paragraph();
                Paragraph lineaEscribir2 = new Paragraph();

                Font fuenteTitulo = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD, BaseColor.BLACK);
                Font fuenteContenido = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
                paTitulo.add(new Phrase("Colegio de Estudios Cientificos y Tecnológicos de Mexico", fuenteTitulo));
                paTitulo.setAlignment(Element.ALIGN_CENTER);
                paTitulo.add(new Phrase(Chunk.NEWLINE));
                documentoPDF.add(paTitulo);
                lineaEscribir.add(new Phrase("                                                 Plantel San Jose del Rincon ", fuenteTitulo));
                lineaEscribir.add(new Phrase(Chunk.NEWLINE));
                lineaEscribir.setAlignment(Element.ALIGN_LEFT);

                Object[] fila = new Object[6];
                if (bd.conectar()) {

                    ResultSet resul = bd.consultas("Select alumno.Nombre, alumno.ApellidoP, carrera.nombreCarrera, grupos.Turno, grupos.Grupo, "
                            + " periodoesc.periodo from alumno,grupos,periodoesc,carrera where alumno.Id_Grupo=grupos.Id_Grupo and grupos.Id_Periodo=periodoesc.Id_Periodo and"
                            + " carrera.Id_Carrera=grupos.Carrera and alumno.Control="+control);
                    if (resul != null) {
                        while (resul.next()) {
                            fila[0] = resul.getString("Nombre");
                            fila[1] = resul.getString("ApellidoP");
                            fila[2] = resul.getString("nombreCarrera");
                            fila[3] = resul.getString("Turno");
                            fila[4] = resul.getInt("Grupo");
                            fila[5] = resul.getString("periodo");

                        }
                    }

                }
                lineaEscribir2.add(new Phrase("Almuno: " + fila[0] + " " + fila[1], fuenteContenido));
                lineaEscribir2.setAlignment(Element.ALIGN_MIDDLE);
                lineaEscribir2.add(new Phrase(Chunk.NEWLINE));
                lineaEscribir2.add(new Phrase("Carrera: " + fila[2], fuenteContenido));
                lineaEscribir2.add(new Phrase(Chunk.NEWLINE));
                lineaEscribir2.add(new Phrase("Turno: " + fila[3], fuenteContenido));
                lineaEscribir2.add(new Phrase(Chunk.NEWLINE));
                lineaEscribir2.add(new Phrase("Grupo: " + fila[4], fuenteContenido));
                lineaEscribir2.add(new Phrase(Chunk.NEWLINE));
                lineaEscribir2.add(new Phrase("Periodo: " + fila[5], fuenteContenido));
                lineaEscribir2.add(new Phrase(Chunk.NEWLINE));
                lineaEscribir2.add(new Phrase("Lista de Asistencia: \n", fuenteContenido));
                lineaEscribir2.add(new Phrase(Chunk.NEWLINE));
                documentoPDF.add(lineaEscribir);
                documentoPDF.add(lineaEscribir2);

                PdfPTable tabla = new PdfPTable(5);

                PdfPCell celda1 = new PdfPCell(new Paragraph("Numero",
                        FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Fecha",
                        FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Hora de Entrada",
                        FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Hora de Salida",
                        FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda5 = new PdfPCell(new Paragraph("Hora de Salida",
                        FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLACK)));
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                tabla.addCell(celda5);
                int totalA = 0;
                int totalR = 0;
                int totalJ = 0;
                int totalF = 0;
                int contadorA = 0;
                int contadorF = 0;
                int contadorR = 0;
                int contadorJ = 0;
                Object[] filas = new Object[7];
                if (bd.conectar()) {
                    ResultSet resul = bd.consultas("Select asistencia.HoraE,"
                            + " asistencia.FechaE, asistencia.Permiso, asistencia.HoraS "
                            + "from alumno join asistencia on alumno.Control = asistencia.Id_alumno and alumno.Control="+control+" order by FechaE");
                    if (resul != null) {

                        int con = 0;
                        while (resul.next()) {
                            con++;
                            filas[0] = resul.getString("FechaE");
                            Time horaE = resul.getTime("HoraE");
                            Time horaS = resul.getTime("HoraS");
                            filas[1] = resul.getString("Permiso");
                            tabla.addCell(new Paragraph("" + con));
                            tabla.addCell(new Paragraph("" + filas[0]));
                            tabla.addCell(new Paragraph("" + horaE));
                            tabla.addCell(new Paragraph("" + horaS));
                            if (filas[1].equals("Asistencia")) {
                                contadorA++;
                                tabla.addCell(new Paragraph("A"));
                            }
                            if (filas[1].equals("Retardo")) {
                                contadorR++;
                                tabla.addCell(new Paragraph("R"));
                            }
                            if (filas[1].equals("Justificado")) {
                                contadorJ++;
                               tabla.addCell(new Paragraph("J"));
                            }
                            if (filas[1].equals("Falta")) {
                                contadorF++;
                              tabla.addCell(new Paragraph("F"));
                            }

                            
                            
                        }

                        documentoPDF.add(tabla);
                    }
                }

                bd.desconectar();
                total.setAlignment(Element.ALIGN_CENTER);
                total.add(new Phrase("Total de Asistencias: " + contadorA, fuenteContenido));
                total.add(new Phrase(Chunk.NEWLINE));
                total.add(new Phrase("Total de Justificaciones: " + contadorJ, fuenteContenido));
                total.add(new Phrase(Chunk.NEWLINE));
                total.add(new Phrase("Total de Retardo: " + contadorR, fuenteContenido));
                total.add(new Phrase(Chunk.NEWLINE));
                total.add(new Phrase("Total de Faltas: " + contadorF, fuenteContenido));
                total.add(new Phrase(Chunk.NEWLINE));
                documentoPDF.add(total);
                documentoPDF.close();
            } finally {
                out.close();
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
