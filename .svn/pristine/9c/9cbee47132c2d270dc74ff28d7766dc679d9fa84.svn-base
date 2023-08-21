<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main content START -->
<div class="col-lg-8 col-xl-9">


<div class="tab">
  <ul class="tabnav">
    <li><a href="#tab01">탭1</a></li>
    <li><a href="#tab02">탭2</a></li>
    <li><a href="#tab03">탭3</a></li>
   <li><a href="#tab03">탭34</a></li>
<li><a href="#tab03">탭5</a></li>
  </ul>
  <div class="tabcontent">
    <div id="tab01">
      <div class="subtab">
        <ul class="subtabnav">
          <li><a href="#subtab01">서브탭1</a></li>
          <li><a href="#subtab02">서브탭2</a></li>
          <li><a href="#subtab03">서브탭3</a></li>
          <li><a href="#subtab04">서브탭4</a></li>
          <li><a href="#subtab05">서브탭5</a></li>
        </ul>
        <div class="subtabcontent">
          <div id="subtab01">서브탭1의 내용</div>
          <div id="subtab02">서브탭2의 내용</div>
          <div id="subtab03">서브탭3의 내용</div>
          <div id="subtab04">서브탭4의 내용</div>
          <div id="subtab05">서브탭5의 내용</div>
        </div>
      </div><!--subtab-->
    </div><!--tab01-->
    
    <div id="tab02">탭2의 내용
<div class="subtab">
        <ul class="subtabnav">
          <li><a href="#subtab06">서브탭1</a></li>
          <li><a href="#subtab07">서브탭2</a></li>
          <li><a href="#subtab08">서브탭3</a></li>
          <li><a href="#subtab09">서브탭4</a></li>
          <li><a href="#subtab10">서브탭5</a></li>
        </ul>
        <div class="subtabcontent">
          <div id="subtab06">서브탭1의 내용</div>
          <div id="subtab07">서브탭2의 내용</div>
          <div id="subtab08">서브탭3의 내용</div>
          <div id="subtab09">서브탭4의 내용</div>
          <div id="subtab10">서브탭5의 내용</div>
        </div>
      </div><!--subtab-->
    </div><!--tab02-->
    
    
        <div id="tab03">탭2의 내용
<div class="subtab">
        <ul class="subtabnav">
          <li><a href="#subtab11">서브탭1</a></li>
          <li><a href="#subtab12">서브탭2</a></li>
          <li><a href="#subtab13">서브탭3</a></li>
          <li><a href="#subtab14">서브탭4</a></li>
          <li><a href="#subtab15">서브탭5</a></li>
        </ul>
        <div class="subtabcontent">
          <div id="subtab11">서브탭1의 내용</div>
          <div id="subtab12">서브탭2의 내용</div>
          <div id="subtab13">서브탭3의 내용</div>
          <div id="subtab14">서브탭4의 내용</div>
          <div id="subtab15">서브탭5의 내용</div>
        </div>
      </div><!--subtab-->
    </div><!--tab02-->
</div>

    

</div>
<script type="text/javascript">
$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	  });

</script>

<style>
html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}

/*tab css*/
.tab{float:left; width:600px; height:290px;}
.tabnav{font-size:0; width:600px; border:1px solid #ddd;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#7ea21e;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#7ea21e; }
.tabcontent{padding: 20px; height:244px; border:1px solid #ddd; border-top:none;}
</style>
