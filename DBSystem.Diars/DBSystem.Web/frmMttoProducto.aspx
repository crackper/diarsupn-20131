<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMttoProducto.aspx.cs" Inherits="DBSystem.Web.frmMttoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="fvProducto" runat="server" DataSourceID="odsProducto" 
        DefaultMode="Insert">
        <EditItemTemplate>
            Id:
            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            CategoriaId:
            <asp:TextBox ID="CategoriaIdTextBox" runat="server" 
                Text='<%# Bind("CategoriaId") %>' />
            <br />
            Codigo:
            <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Descripcion:
            <asp:TextBox ID="DescripcionTextBox" runat="server" 
                Text='<%# Bind("Descripcion") %>' />
            <br />
            Precio:
            <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
            <br />
            Stock:
            <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock") %>' />
            <br />
            Foto:
            <asp:TextBox ID="FotoTextBox" runat="server" Text='<%# Bind("Foto") %>' />
            <br />
            Descontinuado:
            <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                Checked='<%# Bind("Descontinuado") %>' />
            <br />
            Categoria:
            <asp:TextBox ID="CategoriaTextBox" runat="server" 
                Text='<%# Bind("Categoria") %>' />
            <br />
            DetallePedidoes:
            <asp:TextBox ID="DetallePedidoesTextBox" runat="server" 
                Text='<%# Bind("DetallePedidoes") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Id:
            <asp:TextBox ID="IdTextBox" runat="server" ReadOnly="True" Text="0" />
            <br />
            CategoriaId:
            <asp:TextBox ID="CategoriaIdTextBox" runat="server" 
                Text='<%# Bind("CategoriaId") %>' />
            <br />
            Codigo:
            <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Descripcion:
            <asp:TextBox ID="DescripcionTextBox" runat="server" 
                Text='<%# Bind("Descripcion") %>' />
            <br />
            Precio:
            <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
            <br />
            Stock:
            <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock") %>' />
            <br />
            Descontinuado:
            <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                Checked='<%# Bind("Descontinuado") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            CategoriaId:
            <asp:Label ID="CategoriaIdLabel" runat="server" 
                Text='<%# Bind("CategoriaId") %>' />
            <br />
            Codigo:
            <asp:Label ID="CodigoLabel" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Descripcion:
            <asp:Label ID="DescripcionLabel" runat="server" 
                Text='<%# Bind("Descripcion") %>' />
            <br />
            Precio:
            <asp:Label ID="PrecioLabel" runat="server" Text='<%# Bind("Precio") %>' />
            <br />
            Stock:
            <asp:Label ID="StockLabel" runat="server" Text='<%# Bind("Stock") %>' />
            <br />
            Foto:
            <asp:Label ID="FotoLabel" runat="server" Text='<%# Bind("Foto") %>' />
            <br />
            Descontinuado:
            <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                Checked='<%# Bind("Descontinuado") %>' Enabled="false" />
            <br />
            Categoria:
            <asp:Label ID="CategoriaLabel" runat="server" Text='<%# Bind("Categoria") %>' />
            <br />
            DetallePedidoes:
            <asp:Label ID="DetallePedidoesLabel" runat="server" 
                Text='<%# Bind("DetallePedidoes") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="odsProducto" runat="server" 
        DataObjectTypeName="DBSystem.Entities.Producto" DeleteMethod="RemoveProducto" 
        InsertMethod="AddProducto" onobjectcreating="odsProducto_ObjectCreating" 
        SelectMethod="GetFromProductoById" TypeName="DBSystem.BusinessLogic.ProductoBL" 
        UpdateMethod="UpdateProducto">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="idProducto" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    Id:
            <asp:TextBox ID="IdTextBox" runat="server" ReadOnly="True" Text="0" />
            <br />
            CategoriaId:
            <asp:TextBox ID="CategoriaIdTextBox" runat="server" 
                Text='<%# Bind("CategoriaId") %>' />
            <br />
            Codigo:
            <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Descripcion:
            <asp:TextBox ID="DescripcionTextBox" runat="server" 
                Text='<%# Bind("Descripcion") %>' />
            <br />
            Precio:
            <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
            <br />
            Stock:
            <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock") %>' />
            <br />
            Descontinuado:
            <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                Checked='<%# Bind("Descontinuado") %>' />
            <br />
</asp:Content>
