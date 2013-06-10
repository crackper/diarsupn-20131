<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DBSystem.Web._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <b>Criterio:</b>
    <asp:TextBox ID="txtCriterio" runat="server" />
    <asp:Button ID="btnBuscar" Text="Buscar" runat="server" 
        onclick="btnBuscar_Click" />
    <br />
    <asp:GridView ID="gvProductos" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:TemplateField HeaderText="Categoria">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Categoria.Descripcion") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                SortExpression="Codigo" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" 
                SortExpression="Descripcion" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" 
                SortExpression="Precio" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            <asp:CheckBoxField DataField="Descontinuado" HeaderText="Descontinuado" 
                SortExpression="Descontinuado" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>
