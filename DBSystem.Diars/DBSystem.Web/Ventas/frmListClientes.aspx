<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmListClientes.aspx.cs" Inherits="DBSystem.Web.Ventas.frmListClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
    <legend>Buscar Clientes</legend>
    <label for="txtCiterio">Criterio:</label>
    <asp:TextBox ID="txtCriterio" runat="server" />
    <asp:Button ID="btnBuscar" Text="Buscar" runat="server" />
</fieldset>
    <asp:UpdatePanel ID="upClientes" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" 
                DataSourceID="odsClientes" >
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:BoundField DataField="rucDni" HeaderText="rucDni" 
                        SortExpression="rucDni" />
                    <asp:BoundField DataField="razonSocial" HeaderText="razonSocial" 
                        SortExpression="razonSocial" />
                    <asp:BoundField DataField="direccion" HeaderText="direccion" 
                        SortExpression="direccion" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsClientes" runat="server" 
                onobjectcreating="odsClientes_ObjectCreating" 
                SelectMethod="GetFromClienteByCriterio" 
                TypeName="DBSystem.BusinessLogic.ClienteBL">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCriterio" Name="criterio" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
        <Triggers>            
            <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
        </Triggers>       
    </asp:UpdatePanel>
</asp:Content>
