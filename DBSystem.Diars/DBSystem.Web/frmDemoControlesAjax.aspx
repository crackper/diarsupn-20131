<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmDemoControlesAjax.aspx.cs" Inherits="DBSystem.Web.frmDemoControlesAjax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <label class="bold">Fecha:</label>
<asp:TextBox ID="txtFecha" runat="server" />
    <ajaxToolkit:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtFecha">
    </ajaxToolkit:CalendarExtender>
    <br />
    <asp:TextBox ID="taEditor" runat="server" TextMode="MultiLine" 
    Columns="100" Rows="100" Height="600px" Width="400px" />
<ajaxToolkit:HtmlEditorExtender ID="taEditor_HtmlEditorExtender" runat="server" 
    Enabled="True" TargetControlID="taEditor" EnableSanitization="False">
</ajaxToolkit:HtmlEditorExtender>
</asp:Content>
