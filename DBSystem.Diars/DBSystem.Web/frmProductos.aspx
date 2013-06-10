<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmProductos.aspx.cs" Inherits="DBSystem.Web.frmProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>Busqueda</legend>
        <b>Criterio:</b>
        <asp:TextBox ID="txtCriterio" runat="server" />
        <asp:Button ID="btnBuscar" Text="Buscar" runat="server"/>
    </fieldset>

    <asp:GridView ID="gvProductos" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
        DataSourceID="odsProducto" AllowPaging="True" PageSize="15" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" />
            <asp:BoundField DataField="Categoria.Descripcion" HeaderText="Categoria" 
                SortExpression="CategoriaId" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                SortExpression="Codigo" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" 
                SortExpression="Descripcion" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" 
                SortExpression="Precio" />
            <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
            <asp:CheckBoxField DataField="Descontinuado" HeaderText="Descontinuado" 
                SortExpression="Descontinuado" />
            <asp:HyperLinkField DataNavigateUrlFields="Id" 
                DataNavigateUrlFormatString="frmMttoProducto.aspx?idProducto={0}&amp;acc=update" 
                HeaderText="Editar" Text="Editar" />
           <asp:HyperLinkField DataNavigateUrlFields="Id" 
                DataNavigateUrlFormatString="frmMttoProducto.aspx?idProducto={0}&amp;acc=delete" 
                HeaderText="Eliminar" Text="Eliminar"/>
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
    <asp:ObjectDataSource ID="odsProducto" runat="server" 
        SelectMethod="GetFromProductoByCriterio" 
        TypeName="DBSystem.BusinessLogic.ProductoBL" 
        onobjectcreating="odsProducto_ObjectCreating">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCriterio" Name="criterio" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
