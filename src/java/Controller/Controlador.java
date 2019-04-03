
package Controller;


import Entidad.Persona;
import config.Conexion;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Controlador {
    
    /*Variables Globales */
    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    private int id;
    private List datos;
    
    
    /**
     * Metodo para ingresar al index,}
     * y mostrar lista de personas
     * @return 
     */
    @RequestMapping("index.htm")
    public ModelAndView listar(){
     String sql = "select * from persona";   
     datos = this.jdbcTemplate.queryForList(sql);  
     mav.addObject("lista",datos);
     mav.setViewName("index");
     return mav;  
    }
    
    /******************** INGRESO DE DATOS ***************************/
    /*
    * Metodo el cual 
    * redirecciona a pagina Agegar (JSP)
    */
    @RequestMapping(value = "agregar.htm", method = RequestMethod.GET)
    public ModelAndView Agregar(){
        mav.addObject(new Persona());
        mav.setViewName("agregar");
        return mav;  
    }
    /**
     * Metodo que al presionar Boton Agregar en pagina Agregar, 
     * inserta la persona con sus datos, en base de datos.
     * @return 
     */
    @RequestMapping(value = "agregar.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Persona p){
        String sql = "insert into persona (nombre,correo,edad) values (?,?,?)";
        this.jdbcTemplate.update(sql,p.getNombre(),p.getCorreo(),p.getEdad());
        return new ModelAndView("redirect:/index.htm");  
    }
    
    /******************** EDICCION DE DATOS ***************************/
   
    /**
     * Metodo el presionar Boton Editar Obtener y
     * envia los datos de la persoana 
     * selecionada desde lista al formulario edicion
     * @param request 
     * @return 
     */ 
    @RequestMapping(value = "editar.htm", method = RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request){
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select * from persona where id =" + id;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("editar");
        return mav;  
    }
    
    /**
     * Metodo el presionar Boton Actualizar en formulario Editar 
     * modifica datos en base datos y los pinta en index
     * @param request 
     * @return 
     */ 
    @RequestMapping(value = "editar.htm", method = RequestMethod.POST)
    public ModelAndView Editar(Persona p){
         String sql = "update persona set nombre = ?, correo = ?, edad = ? where id = "+id;
         this.jdbcTemplate.update(sql,p.getNombre(),p.getCorreo(),p.getEdad());
         return new ModelAndView("redirect:/index.htm");  
    }
    
    
    @RequestMapping("eliminar.htm")
    public ModelAndView Eliminar(HttpServletRequest request){
         id = Integer.parseInt(request.getParameter("id"));
         String sql = "delete from persona where id = "+id;
         this.jdbcTemplate.update(sql);
         return new ModelAndView("redirect:/index.htm");  
    }
    
    

}
