<!DOCTYPE html>
<html>
 <head>
  <script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>
  <script src="texteditor.js"></script>
 </head>
 <body>
  <div id="content" style="margin-top:10px;height:70%;text-align:center;">
   <h2><u>Simple Text Editor Created Using jQuery</u></h2>
   <div class="ze ie"></div>
   <style>
   .font-bold.bold{font-weight:bold;}.italic{font-style:italic;}.selected{background-color: orange;}#openpb{margin:15px;}
   </style>
   <button type="button" class="g-button g-button-submit" id='stext'>Text</button>&nbsp;&nbsp;&nbsp;&nbsp;
   <button type="button" class="g-button g-button-submit" id='shtml'>HTML</button>
   <div id="controls" style="margin-bottom: 10px;">
    <a id="bold" style="color:black;display: inline-block;" class="font-bold">
     <button type="button">B</button>
    </a>&nbsp;&nbsp;&nbsp;
    <a id="italic" style="color:black !important;display: inline-block;"class="italic">
     <button type="button">I</button>
    </a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a id="link" class="link" style="display: inline-block;">
     <button type="button">Link</button>
    </a>&nbsp;&nbsp;&nbsp;&nbsp;
    <select id="fonts" class="g-button">
     <option value="Normal">Normal</option>
     <option value="Arial">Arial</option>
     <option value="Comic Sans MS">Comic Sans MS</option>
     <option value="Courier New">Courier New</option>
     <option value="Monotype Corsiva">Monotype</option>
     <option value="Tahoma New">Tahoma</option>
     <option value="Times">Times</option>
     <option value="Trebuchet New">Trebuchet</option>
     <option value="Ubuntu">Ubuntu</option>
    </select>
   </div>
   <iframe frameborder="0" id="textEditor" style="width:500px; height:80px;border:2px solid #CCC;border-radius:20px;overflow:auto;"></iframe>
   <textarea name="text" id='text' style="border-radius:20px;overflow:auto;display:none;padding-left: 10px;" rows="6" cols="53"></textarea>
  </div>
<!-- http://www.subinsb.com/2012/10/text-editor-using-javascript-jquery.html -->
 </body>
</html>
