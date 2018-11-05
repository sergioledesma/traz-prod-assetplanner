<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Herramienta</h3>
          <?php
            if (strpos($permission,'Add') !== false) {
              echo '<button class="btn btn-block btn-primary" style="width: 100px; margin-top: 10px;" data-toggle="modal" data-target="#modaltarea" id="btnAdd">Agregar</button>';
            }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="deposito" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Acciones</th>
                <th>Codigo</th>
                <th>Descripcion</th>
                <th>Modelo</th>
                <th>Marca</th>
                <th>Deposito</th>
                <th>Estado</th>
              </tr>
            </thead>
            <tbody>
              <?php
                foreach($list as $z)
                {
                  $id=$z['herrId'];
                  echo '<tr id="'.$id.'" class="'.$id.'" >';
                  echo '<td>';
                  if (strpos($permission,'Edit') !== false) {
                      echo '<i class="fa fa-fw fa-pencil text-light-blue" style="cursor: pointer; margin-left: 15px;" title="Editar" data-toggle="modal" data-target="#modaleditar"></i>';
                  }
                  if (strpos($permission,'Del') !== false) {
                      echo '<i class="fa fa-fw fa-times-circle text-light-blue" style="cursor: pointer; margin-left: 15px;"></i>';
                  }
                  echo '</td>';
                  echo '<td>'.$z['herrcodigo'].'</td>';
                  echo '<td>'.$z['herrmarca'].'</td>';
                  echo '<td>'.$z['herrdescrip'].'</td>';
                  echo '<td>'.$z['marcadescrip'].'</td>';
                  echo '<td>'.$z['depositodescrip'].'</td>';
                  echo '<td>'.($z['equip_estad']  == 'AC' ? '<small class="label pull-left bg-green" >Activa</small>' :'<small class="label pull-left bg-blue">Transito</small>').'</td>';
                  echo '</tr>';
                }
              ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>
var ed="";
$(document).ready(function(event) {

  // Editar
  $(".fa-pencil").click(function (e) { 
    //console.log ("entre");
    var idh = $(this).parent('td').parent('tr').attr('id');
    //console.log("ID de herramienta es ");
    //console.log(idh);
    // alert(idh);
    ed=idh;
    $.ajax({
      type: 'GET',
      data: { idh:idh},
      url: 'index.php/Herramienta/getpencil', //index.php/
      success: function(data){
        //console.log("Estoy editando");
        //console.log(data);
        //console.log(data[0]['modid']);             
        datos={
          'codigode':data[0]['herrcodigo'],
          'descripcionde':data[0]['herrdescrip'],
          'modid':data[0]['modid'],
          'depositoid':data[0]['depositoId'],
          'marcade':data[0]['herrmarca'], 
          'descrip': data[0]['depositodescrip'],
          'descripmarca' : data[0]['marcadescrip'],
          'descripdepo' : data[0]['depositodescrip'],
        };
        completarEdit(datos);
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  });

  // Eliminar
  $(".fa-times-circle").click(function (e) { 
    //console.log("Esto eliminando"); 
    var id_herr = $(this).parent('td').parent('tr').attr('id');
    //console.log(id_herr);
    
    $.ajax({
      type: 'POST',
      data: { id_herr: id_herr},
      url: 'index.php/Herramienta/baja_herramienta', //index.php/
      success: function(data){
        //var data = jQuery.parseJSON( data );
        //console.log(data);
        //$(tr).remove();
        alert("HERRAMIENTA Eliminado");
        regresa();
      },
      error: function(result){
        console.log(result);
      },
      dataType: 'json'
    });
  });

  // Datatables
  $('#deposito').DataTable({
    "aLengthMenu": [ 10, 25, 50, 100 ],
    "columnDefs": [ {
      "targets": [ 0 ], 
      "searchable": false
    },
    {
      "targets": [ 0 ], 
      "orderable": false
    } ],
    "order": [[1, "asc"]],
  });

});

traer_deposito();
traer_modelo();

function traer_deposito(){
  $('#depo').html('');
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Herramienta/getdeposito', 
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#depo').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['depositodescrip'];
        var opcion  = "<option value='"+data[i]['depositoId']+"'>" +nombre+ "</option>" ; 
        $('#depo').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}

function traer_deposito2(){
  $('#depode').html('');
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Herramienta/getdeposito',
    success: function(data){
      $('#depode').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['depositodescrip'];
        var opcion  = "<option value='"+data[i]['depositoId']+"'>" +nombre+ "</option>" ; 
        $('#depode').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}

function traer_modelo(){
  $('#modelo').html(''); 
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Herramienta/getmodelo', 
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#modelo').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['marcadescrip'];
        var opcion  = "<option value='"+data[i]['marcaid']+"'>" +nombre+ "</option>" ; 
        $('#modelo').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}

function traer_modelo2(){
  $('#modelode').html(); 
  $.ajax({
    type: 'POST',
    data: { },
    url: 'index.php/Herramienta/getmodelo', 
    success: function(data){
      var opcion  = "<option value='-1'>Seleccione...</option>" ; 
      $('#modelode').append(opcion); 
      for(var i=0; i < data.length ; i++) 
      {    
        var nombre = data[i]['marcadescrip'];
        var opcion  = "<option value='"+data[i]['marcaid']+"'>" +nombre+ "</option>" ; 
        $('#modelode').append(opcion); 
      }
    },
    error: function(result){
      console.log(result);
    },
    dataType: 'json'
  });
}

function completarEdit(datos){
  $('#errorDe').hide();
  $('#errorExisteDe').hide();
  //console.log("datos que llegaron");
  //console.log(datos);
  $('#codigode').val(datos['codigode']);
  $('#marcade').val(datos['marcade']);
  $('#descripcionde').val(datos['descripcionde']);
  //$('select#modelode').val(datos['descripmarca']);
  //$('select#depode').val(datos['descripdepo']);
  traer_deposito2();
  $('select#depode').append($('<option />', { value: datos['depositoid'],text: datos['descripdepo']}));
  edito=datos['descripdepo'];
  // $('select#depode').append($('<option />', { value: datos['depositoid'], text: datos['descripdepo'] }));                
  $('select#modelode').append($('<option />', {value: datos['modid'], text: datos['descripmarca']}));
  traer_modelo2();
}
  
function guardareditar(){
  //console.log("Estoy editando");
  //console.log("El id de herramienta  es:"); 
  //console.log(ed);
    
  var cod     = $('#codigode').val();
  var descrip = $('#descripcionde').val();
  var mod     = $('#modelode').val();
  var mar     = $('#marcade').val();
  var dep     = $('#depode').val();

  var parametros = {
    'herrcodigo'  : cod,
    'herrdescrip' : descrip,
    'herrmarca'   : mar,
    'modid'       : mod,
    'depositoId'  : dep    
  };                                            
  //console.log(parametros);
  var hayError = false; 
  $('#errorDe').hide();

  if($('#codigode').val() == '')
  {
    hayError = true;
  }
  if($('#descripcionde').val() == '')
  {
    hayError = true;
  }
  if($('#marcade').val() == '')
  {
    hayError = true;
  }
  if($('#modelode').val() == '-1')
  {
    hayError = true;
  }
  if($('#depode').val() == '-1')
  {
    hayError = true;
  }

  if(hayError == true){
    $('#errorDe').fadeIn('slow');     
    return;
  }

  $.ajax({
    type:"POST",
    url: "index.php/Herramienta/edit_herramienta",
    data:{parametros:parametros, ed:ed},
    success: function(data){
      //console.log("data: "+data);
      $('#modaleditar').modal('hide');
      regresa();    
    },
    error: function(result){
      console.error("Error al editar herramienta");
      console.table(result);
    },
  });
}

function guardar(){
 
  var descripcion = $('#descripcion').val();
  var codigo      = $('#codigo').val();
  var modelo      = $('#modelo').val();
  var marca       = $('#marca').val();
  var deposito    = $('#depo').val();
  var parametros  = {
                      'herrcodigo': codigo,
                      'herrdescrip': descripcion,
                      'herrmarca': marca,
                      'modid': modelo,
                      'depositoId': deposito,
                      'equip_estad' :'AC' 
                    };                                              
 
  var hayError = false; 
  $('#error').hide();
  $('#errorExiste').hide();

  if($('#codigo').val() == '')
  {
    hayError = true;
  }
  if($('#descripcion').val() == '')
  {
    hayError = true;
  }
  if($('#marca').val() == '')
  {
    hayError = true;
  }
  if($('#modelo').val() == '-1')
  {
    hayError = true;
  }
  if($('#depo').val() == '-1')
  {
    hayError = true;
  }

  if(hayError == true){
    $('#error').fadeIn('slow');     
    return;
  }                               
  
  $.ajax({
    data:{parametros:parametros},
    // dataType: 'json',
    type:"POST",
    url: "index.php/Herramienta/agregar_herramienta", 
    success: function(data){
      //console.log("data: "+data);
      if(data=="existe") {
        $('#errorExiste').show();
      } else {
        $('#modaltarea').modal('hide');
        regresa();
      }
    },
    error: function(result){
        console.error("Error al agregar herramientas");
        console.table(result);
    },
  });
}

function regresa(){
  //WaitingOpen();
  //$('#modaldeposito').empty();
  //$('#modaleditar').empty(); 
  //$('#content').empty();
  $("#content").load("<?php echo base_url(); ?>index.php/Herramienta/index/<?php echo $permission; ?>");
  WaitingClose();
}
</script>


<!-- Modal alta de Herramienta-->
<div class="modal" id="modaltarea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-plus-square text-light-blue"></span> Agregar Herramienta</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="error" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorExiste" style="display: none">
              La herramienta que intenta Agregar ya existe!
            </div>
          </div>
        </div>
        <div class="row" >
          <div class="col-xs-12">
            <div class="form-group">
              <label for="">Codigo <strong style="color: #dd4b39">*</strong>:</label>
              <input type="text" id="codigo" name="codigo" class="form-control" placeholder="Ingrese Codigo...">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="">Descripcion <strong style="color: #dd4b39">*</strong>:</label>
              <input type="text" id="descripcion" name="descripcion" class="form-control" placeholder="Ingrese Descripcion...">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="">Modelo <strong style="color: #dd4b39">*</strong>:</label>
              <input type="text" id="marca" name="marca" class="form-control" placeholder="Ingrese Modelo...">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="">Marca <strong style="color: #dd4b39">*</strong>:</label>
              <select type="text" id="modelo" name="modelo" class="form-control" ></select>
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="">Deposito <strong style="color: #dd4b39">*</strong>:</label>
              <select type="text" id="depo" name="depo" class="form-control" ></select>
            </div>
          </div>                
        </div>
      </div>  <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave" onclick="guardar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal -->
<!-- / Modal -->


<!-- Modal editar-->
<div class="modal" id="modaleditar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"  id="myModalLabel"><span id="modalAction" class="fa fa-fw fa-pencil text-light-blue"></span> Editar Herramienta</h4>
      </div> <!-- /.modal-header  -->

      <div class="modal-body" id="modalBodyArticle">
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorDe" style="display: none">
              <h4><i class="icon fa fa-ban"></i> Error!</h4>
              Revise que todos los campos esten completos
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <div class="alert alert-danger alert-dismissable" id="errorExisteDe" style="display: none">
              La herramienta que intenta Agregar ya existe!
            </div>
          </div>
        </div>
        <div class="row" >
          <div class="col-xs-12">
            <div class="form-group">
              <label for="codigode">Codigo <strong style="color: #dd4b39">*</strong>:</label>
              <input type="text" id="codigode" name="codigode" class="form-control" placeholder="Ingrese Codigo...">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="descripcionde">Descripción <strong style="color: #dd4b39">*</strong>:</label>
              <input type="text" id="descripcionde" name="descripcionde" class="form-control" placeholder="Ingrese Descripcion...">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="marcade">Modelo <strong style="color: #dd4b39">*</strong>:</label>
              <input type="text" id="marcade" name="marcade" class="form-control" placeholder="Ingrese Marca...">
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="modelode">Marca <strong style="color: #dd4b39">*</strong>:</label>
              <select type="text" id="modelode" name="modelode" class="form-control" ></select>
            </div>
          </div>

          <div class="col-xs-12">
            <div class="form-group">
              <label for="depode">Deposito <strong style="color: #dd4b39">*</strong>:</label>
              <select type="text" id="depode" name="depode" class="form-control" ></select>
            </div>
          </div>   
        </div>
      </div>  <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="guardareditar()" >Guardar</button>
      </div>  <!-- /.modal footer -->

    </div> <!-- /.modal-content -->
  </div>  <!-- /.modal-dialog modal-lg -->
</div>  <!-- /.modal -->
<!-- / Modal -->