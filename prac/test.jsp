<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=MS932"%>
<%@ page import="jp.co.jdevices.wms.pda.web.struts.forms.Pdn201Form" %>
<%@ page import="jp.co.jdevices.wms.pda.web.util.WebKeys"%>
<%@ page import="jp.co.jdevices.wms.pda.services.blo.qroc.QrocSuper"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ include file="/jsp/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-31j">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK rel="stylesheet" href="jsp/css/standardPbu.css" type="text/css">
<title>Insert title here</title>
</head>
<SCRIPT language="JavaScript" src="jsp/script/standard.js"></SCRIPT>
<SCRIPT language="JavaScript">


/* Kwon Yuseong 2018 10 01 */
/* Kwon Yuseong 2018 10 02 */
/* Kwon Yuseong 2018 10 04 */


	// onLoad時処理
	function pageLoad() {
		var form = document.Pdn201Form;
		//KeyNoにフォーカスを当てる
		//form.keyno.focus();
	}

    // 検索ボタンクリック時
    function search_click() {
    	var form=document.Pdn201Form;
    	disabledButton(form);
        form.formaction.value="<%=Pdn201Form.ACTION_SEARCH%>";
        form.target="_self";
        form.submit();
    }

    // クリアボタンクリック時
    // ※初期状態にする為、"init"を呼出す
    function clear_click() {
        var form=document.Pdn201Form;
    	disabledButton(form);
        form.formaction.value="clear";
        form.target="_self";
        form.submit();
    }

	// Excel
	function excel_click() {
		var form = document.Pdn201Form;
//		disabledButton(form);
		form.formaction.value = "excel";
		form.target = "_self";
		form.submit();
	}

    // 戻るボタンクリック時
    function back_click() {
        var form=document.Pdn201Form;
    	disabledButton(form);
        form.formaction.value="back";
        form.target="_self";

        form.submit();
    }

	// 操作ログ画面を開く
	/*function openSubwindow() {
		var form=document.Pdn201Form;
		var keyno = form.hiddenkeyno.value;
		form.formaction.value="init";

		// 操作ログ画面を閉じる
		if (win2 != null) {
			if (win2 || win2.opened) {
				win2.close();
			}
		}

		var link = 'pdt999sub.do?keyno=' + keyno;
		win2 = window.open(link, "操作ログ", "width=1024,height=580,scrollbars=yes");

	}*/

    //

	//登録ページへ移動
	function insertgoto_click() {
		var form = document.Pdn201Form;
//		disabledButton(form);
		form.formaction.value = "insertgoto";
		form.target = "_self";
		form.submit();
	}
	//削除ページへ移動
	function deletegoto_click() {
		var form = document.Pdn201Form;
//		disabledButton(form);
		form.formaction.value = "deletegoto";
		form.target = "_self";
		form.submit();
	}

	//ページリスト
	function pageList_click() {
		var form = document.Pdn201Form;
		disabledButton(form);
		form.formaction.value = "<%=Pdn201Form.ACTION_PAGENATE%>";
		form.target = "_self";
		form.submit();
	}

</SCRIPT>
</HEAD>
<BODY class="MainBody" onLoad="pageLoad()">
<html:form action="/pdn201.do" styleId="formArea" method="post">
<html:hidden property="formaction"/>


<!--
##################
# Header
################## -->
<TABLE class="TableHead">
    <!-- ログイン情報 -->
    <TR>
        <TD>
            <A HREF="pdc001.do">ﾛｸﾞｱｳﾄ</A>
        </TD>
		<TD class="Td0">
			<bean:write name="<%= WebKeys.SES_COMMON_PARAM_KEY %>" property="factoryName"/>　
			<bean:write name="<%= WebKeys.SES_COMMON_PARAM_KEY %>" property="userName"/>
		</TD>
    </TR>
    <!-- タイトル -->
    <TR>
        <TD class="Td1" colspan="2">PBU管理画面</TD>
    </TR>
</TABLE>

<!--
##################
# Main
###################
 -->
<DIV>
<!--
$$$$$$$$$$$$$$$$$$$
$  検索条件
$$$$$$$$$$$$$$$$$$$
-->

	<TABLE class="TableMain" style="margin-top:2px;width:1000px;">
		<TR>
			<TD class="Td2disp" style="width:100px;" title="pbucd">PBUCD</TD>
			<TD class="Td3" style="width:200px;" title=<bean:write name="Pdn201Form" property="pbucd" />>
				 <html:text property="pbucd" size="40" maxlength="20" styleClass="Text0"/>
			</TD>
			<TD class="Td2disp" style="width:100px;" title="品名">品名</TD>
			<TD class="Td3" style="width:200px;" title=<bean:write name="Pdn201Form" property="productname" />>
				<html:text property="productname" size="40" maxlength="40" styleClass="Text0"/>
			</TD>
			<TD class="Td3" style="width:100px;" rowspan="2" >
				<input type="button" name="search" value="検索" onclick="search_click();" class="Button0">
			</TD>

		</TR>
		<TR>
			<TD class="Td2disp" style="width:100px;" title="PBU">PBU</TD>
			<TD class="Td3" style="width:200px;" title=<bean:write name="Pdn201Form" property="pbu" />>
				<html:text property="pbu" size="40" maxlength="40" styleClass="Text0"/>
			</TD>
			<TD class="Td2disp" style="width:100px;" title="適用拠点">適用拠点</TD>
			<TD class="Td3" style="width:200px;" title=<bean:write name="Pdn201Form" property="sitecode" />>

				<html:select name="Pdn201Form" property="sitecodeAllList" >
                    <html:optionsCollection property="sitecodeAllList" />
                </html:select>

                <!--  empty -->
			</TD>
		</TR>
		<TR>
			<TD class="Td3" style="width:100px;" ></TD>
			<TD class="Td3" style="width:100px;" ></TD>

			<TD class="Td2disp" style="width:100px;" title="表示項目数">表示項目数</TD>
			<TD class="Td3" style="width:100px;" title=<bean:write name="Pdn201Form" property="sitecode" />>
				<select name="maxDispl"  class="Select_full">
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
				</select>
			</TD>
		</TR>
	</TABLE>

<!--
$$$$$$$$$$$$$$$$$$$
$  検索対象
$$$$$$$$$$$$$$$$$$$
 -->



<!--
$$$$$$$$$$$$$$$$$$$
$  選択項目の品名、備考の情報
$$$$$$$$$$$$$$$$$$$
-->
	<TABLE class="TableMain" style="width:500px;">
		<TR>
			<TD class="Td2disp" style="width:250px;">品名</TD>
			<TD class="Td2disp" style="width:250px;" >備考</TD>
		</TR>
		<TR>
			<TD class="Td2" style="width:250px;"></TD>
			<TD class="Td3" style="width:250px;"></TD>
		</TR>
	</TABLE>

<!--
$$$$$$$$$$$$$$$$$$$
$  検索結果
$$$$$$$$$$$$$$$$$$$
-->

<BR>
<DIV class = "scrl2">
	<TABLE  border="1" style="font-size:16px;">
		  <TR bgcolor=#CCCCCC>
		  	<TD style="WIDTH: 40px; TEXT-ALIGN: left" nowrap>
			  NO
			</TD>
			<TD style="WIDTH: 100px; TEXT-ALIGN: left" nowrap>
			  PBUCD
			</TD>
			<TD style="WIDTH: 100px; TEXT-ALIGN: left" nowrap>
			  PBU
			</TD>
			<TD style="WIDTH: 50px; TEXT-ALIGN: center" nowrap>
			  拠点
			</TD>
			<TD style="WIDTH: 225px; TEXT-ALIGN: center" nowrap>
			  品名
			</TD>
			<TD style="WIDTH: 425px; TEXT-ALIGN: center" nowrap>
			  備考
			</TD>
		  </TR>
	</TABLE>

		<%-- <logic:notEmpty name="Pdn201Form" property="filterdResultList">--%>
		<%--<logic:iterate id="dspLst" indexId="i" name="Pdn201Form" property="filterdResultList">--%>
		<logic:notEmpty name="Pdn201Form" property="searchResultList">

				<logic:iterate id="dspLst" indexId="i" name="Pdn201Form" property="searchResultList">
				<TABLE  border="1" style="font-size:16px;"  style="width:920px;">
					<TR>
						<TD class="Td2" style="WIDTH: 40px;" nowrap >
							<bean:write name="i" />
						</TD>
						<TD class="Td2" style="WIDTH: 100px;" nowrap >
							 <bean:write name="dspLst" property="pbucd_e"/>
						</TD>
						<TD class="Td2" style="WIDTH: 100px;" nowrap>
 							<bean:write name="dspLst" property="pbu_e"/></TD>
						<TD class="Td2" style="WIDTH: 50px;" nowrap>
							<bean:write name="dspLst" property="sitecode_e"/>
						</TD>
						<TD class="Td2" style="WIDTH: 225px;" nowrap>
							<bean:write name="dspLst" property="productname_e"/>
						</TD>
						<TD class="Td2" style="WIDTH: 425px;" nowrap>
							<bean:write name="dspLst" property="remarks_e"/>
						</TD>
					</TR>
				</TABLE>
			</logic:iterate>
		</logic:notEmpty>
	</DIV><!--scrollableBox End  -->
<!--
$$$$$$$$$$$$$$$$$$$
$  PAGELIST
$$$$$$$$$$$$$$$$$$$
-->
	<logic:notEmpty name="Pdn201Form" property="filterdResultList">
		<DIV>
			<logic:iterate id="dspLst" indexId="i" name="Pdn201Form" property="">

				<bean:write name="dspLst" property="remarks_e"/>
			</logic:iterate>
		</DIV>
	</logic:notEmpty>
	<!--  <center><pre>	(( (<b>1</b> 2 3 4 5 6 7 8 9)) )</pre></center>-->
</DIV><!--Main div End class srcl2   -->

<!--
##################
# Footter
##################
-->
<DIV>
	<TABLE class="TableFoot">
		<!-- 画面に伴うボタン制御 -->
		<TR>
			<TD width="20%">
				<html:button value="(登録)" property="insert" styleClass="Button0" onclick="insertgoto_click();" />
			</TD>
			<TD width="20%">
					<html:button value="Excel" property="btnDownload" styleClass="Button0" onclick="excel_click();" />
			</TD>
			<TD width="20%">
				<html:button value="削除（かり）" property="btnDownload" styleClass="Button0" onclick="excel_click();" />
			</TD>
			<TD width="20%">
				<html:button value="ｸﾘｱ" property="clear" styleClass="Button0" onclick="clear_click();" />
		    </TD>
			<TD width="20%">
				<html:button value="戻る" property="back" styleClass="Button0" onclick="back_click();" />
		    </TD>
		</TR>
		<!-- メッセージ表示領域  -->
		<TR>
			<TD colspan="4">
			<!-- blue 正常 -->
				<logic:equal name="msgKbn" value="0">
					<div class="Msg0"><bean:write name="msg" scope="request"/></div>
				</logic:equal>
			<!-- orange  warrning -->
				<logic:equal name="msgKbn" value="1">
					<div class="Msg1"><bean:write name="msg" scope="request"/></div>
				</logic:equal>
			<!-- red  error -->
				<logic:equal name="msgKbn" value="2">
					<div class="Msg2"><bean:write name="msg" scope="request"/></div>
				</logic:equal>
			</TD>
		</TR>
	</TABLE>
</DIV>
</html:form>
</BODY>
</html>
