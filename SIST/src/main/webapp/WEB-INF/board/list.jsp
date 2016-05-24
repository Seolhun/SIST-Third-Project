<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/board/board.css">
<script type="text/javascript" src="js/board/board.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<title>Insert title here</title>
</head>
<body>
	<nav>
  <ul>
    <li><a href="./login.jsp">Inicio</a></li>
    <li><a href="#">Equipo&#9660</a>
      <ul>
        <li><a href="./AsignarEquipo.jsp">Asgnar Equipo</a></li>
        <li><a href="#">Inventario&#9660</a>
          <ul>
            <li><a href="./historial.jsp">Historial</a></li>
            <li><a href="./Inventario.jsp">Levantar Inventario</a></li>
            <li><a href="./equipo.jsp">Mostrar Inventario</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li id="primer"><a href="./Solicitudes.jsp">Solicitudes</a></li>
    <li id="primer"><a href="./RegistrarUsuario.jsp">Registrar Usuario</a></li>
    <li id="primer"><a href="./logout.jsp">Cerrar Sesion</a></li>
  </ul>
</nav>
<main id="main" class="main">

  <form action="peticiones" method="post" class="form Inventario">
    <input id="tab6" type="radio" name="tabs" checked>
    <label id="tabmp" for="tab6">Mant. Preventivo</label>
    <input id="tab7" type="radio" name="tabs">
    <label id="asign-hist" for="tab7">Mant. Correctivo</label>
    <input class="eliminar" id="tab8" type="submit" value="Guardar" class="eliminar" name="cpu" style="display: none;" />
    <label id="tab61" for="tab8" style="display: none;">Guardar</label>
    <section id="content6">
      <table>
        <thead>
          <tr>
            <input name="no_imp" id="no_imp" type="text" style="display: none;">
            <th>Codigo</th>
            <th>Observacion</th>
            <th>Area</th>
            <th>CPU</th>
            <th>Monitor</th>
            <th>Impresora</th>
            <th>Regulador</th>
            <th>Otro</th>
            <th>Mantenimiento</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>ALM1</td>
            <td>prueba 2 </td>
            <td></td>
            <td>159</td>
            <td></td>
            <td></td>
            <td></td>
            <td>Almacen</td>
            <td>18/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ALM1' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
          <tr>
            <td>ACLI2</td>
            <td>prueba 3</td>
            <td></td>
            <td></td>
            <td>123</td>
            <td></td>
            <td></td>
            <td>Archivo clinico</td>
            <td>18/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ACLI2' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
          <tr>
            <td>ADMI1</td>
            <td>prueba 4</td>
            <td></td>
            <td></td>
            <td></td>
            <td>002</td>
            <td></td>
            <td>Admision</td>
            <td>18/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ADMI1' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
          <tr>
            <td>ASEP1</td>
            <td>prueba 5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>12</td>
            <td>Aula SEP</td>
            <td>18/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ASEP1' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
          <tr>
            <td>ALM2</td>
            <td>prueba 6</td>
            <td>001</td>
            <td></td>
            <td>22</td>
            <td></td>
            <td>noserie</td>
            <td>Almacen</td>
            <td>18/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ALM2' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
          <tr>
            <td>ALM3</td>
            <td>asd</td>
            <td>005</td>
            <td></td>
            <td>21</td>
            <td></td>
            <td></td>
            <td>Almacen</td>
            <td>18/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ALM3' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='18/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
          <tr>
            <td>ACLI1</td>
            <td>prueba 1</td>
            <td>004</td>
            <td>20</td>
            <td></td>
            <td>013</td>
            <td></td>
            <td>Archivo clinico</td>
            <td>19/11/2016</td>
            <td class='modeli'>
              <form action="peticiones" method="post" class="form Inventario"><input name='man_prev' id='man_prev' type='text' value='ACLI1' style='display:none;'><input name='fecha_man' id='fecha_man' type='text' value='19/11/2016' style='display:none;'><input class='eliminar' name='bot_man_prev' type='submit' id='bot_man_prev'
                  value='Realizado' style='height: 30px; width:auto;' onclick='mod(this)'></form>
            </td>
          </tr>
        </tbody>
      </table>
    </section>
    <section id="content7">
      <input id="tab1" type="radio" name="subtabs" checked>
      <label id="tab11" for="tab1" style="height: 30px; padding-top: 5px;">Impresoras</label>
      <input id="tab2" type="radio" name="subtabs">
      <label id="tab21" for="tab2" style="height: 30px; padding-top: 5px;">CPUs</label>
      <input id="tab3" type="radio" name="subtabs">
      <label id="tab31" for="tab3" style="height: 30px; padding-top: 5px;">Monitores</label>
      <input id="tab4" type="radio" name="subtabs">
      <label id="tab41" for="tab4" style="height: 30px; padding-top: 5px;">Reguladores</label>
      <input id="tab5" type="radio" name="subtabs">
      <label id="tab51" for="tab5" style="height: 30px; padding-top: 5px;">Otros</label>
      <input class="eliminar" id="tab7" type="submit" value="Guardar" class="eliminar" name="cpu" style="display: none;" />
      <label id="tab61" for="tab7" style="display: none;">Guardar</label>
      <section id="content1">
        <table>
          <thead>
            <tr><input name="no_imp" id="no_imp" type="text" style="display: none;">
              <th>Marca</th>
              <th>No. Serie</th>
              <th>Ubicacion</th>
              <th>Observaciones</th>
              <th>Propietario</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Intel</td>
              <td>004</td>
              <td>Archivo clinico</td>
              <td><textarea rows="3" cols="50" name="comment" style="background:" form="usrform">Enter text here...</textarea></td>
              <td>154</td>
            </tr>
            <tr>
              <td>Intel</td>
              <td>005</td>
              <td>Almacen</td>
              <td></td>
              <td>154</td>
            </tr>
            <tr>
              <td>Intel</td>
              <td>001</td>
              <td>Almacen</td>
              <td></td>
              <td>154</td>
            </tr>
          </tbody>
        </table>
      </section>
      <section id="content2">
        <table>
          <thead>
            <tr><input name="no_cpu" id="no_cpu" type="text" style="display: none;">
              <th>Marca</th>
              <th>No. Serie</th>
              <th>Ubicacion</th>
              <th>Observaciones</th>
              <th>Propietario</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Dell</td>
              <td>123</td>
              <td>Archivo clinico</td>
              <td>asdasdasd</td>
              <td>Axtel</td>
            </tr>
            <tr>
              <td>Dell</td>
              <td>21</td>
              <td>Almacen</td>
              <td></td>
              <td>Axtel</td>
            </tr>
            <tr>
              <td>xerox</td>
              <td>22</td>
              <td>Almacen</td>
              <td></td>
              <td>SSA</td>
            </tr>
          </tbody>
        </table>
      </section>
      <section id="content3">
        <table>
          <thead>
            <tr><input name="no_mon" id="no_mon" type="text" style="display: none;">
              <th>Marca</th>
              <th>No. Serie</th>
              <th>Ubicacion</th>
              <th>Observaciones</th>
              <th>Propietario</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Philips</td>
              <td>159</td>
              <td>Almacen</td>
              <td>plasma con base negra</td>
              <td>SSA</td>
            </tr>
            <tr>
              <td>marca</td>
              <td>20</td>
              <td>Archivo clinico</td>
              <td>observaciones</td>
              <td>NADRO</td>
            </tr>
          </tbody>
        </table>
      </section>
      <section id="content4">
        <table>
          <thead>
            <tr><input name="no_reg" id="no_reg" type="text" style="display: none;">
              <th>Marca</th>
              <th>No. Serie</th>
              <th>Ubicacion</th>
              <th>Observaciones</th>
              <th>Propietario</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Spectra</td>
              <td>002</td>
              <td>Admision</td>
              <td></td>
              <td>HGLM</td>
            </tr>
            <tr>
              <td>Spectra</td>
              <td>013</td>
              <td>Archivo clinico</td>
              <td></td>
              <td>HGLM</td>
            </tr>
          </tbody>
        </table>
      </section>
      <section id="content5">
        <table>
          <thead>
            <tr><input name="no_otro" id="no_otro" type="text" style="display: none;">
              <th>Marca</th>
              <th>No. Serie</th>
              <th>Ubicacion</th>
              <th>Tipo</th>
              <th>Observaciones</th>
              <th>Propietario</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>marca</td>
              <td>noserie</td>
              <td>Almacen</td>
              <td>obs</td>
              <td>esp</td>
              <td>Axtel</td>
            </tr>
            <tr>
              <td>marca</td>
              <td>12</td>
              <td>Aula SEP</td>
              <td>obs</td>
              <td>esp</td>
              <td>Axtel</td>
            </tr>
          </tbody>
        </table>
      </section>
    </section>
  </form>
</main>
</body>
</html>