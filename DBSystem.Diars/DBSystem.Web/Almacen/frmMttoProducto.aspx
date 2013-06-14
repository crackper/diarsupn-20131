<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMttoProducto.aspx.cs" Inherits="DBSystem.Web.frmMttoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="fvProducto" runat="server" DataSourceID="odsProducto" 
        DefaultMode="Insert">
        <EditItemTemplate>
            <div class="forms columnar">
                <ul>
                <li>
                    <label class="bold" >Id:</label>
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                </li>
                <li>
                    <label class="bold">Cagegoria:</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" DataSourceID="odsCategorias" 
                    DataTextField="descripcion" DataValueField="id" 
                    SelectedValue='<%# Bind("CategoriaId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsCategorias" runat="server" 
                        onobjectcreating="odsCategorias_ObjectCreating" 
                        SelectMethod="GetAllFromCategoria" 
                        TypeName="DBSystem.BusinessLogic.CategoriaBL"></asp:ObjectDataSource>
                </li>
                <li>
                    <label class="bold">Codigo:</label>
                    <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
                </li>
                <li>
                    <label class="bold">Descripcion:</label>
                    <asp:TextBox ID="DescripcionTextBox" runat="server" 
                    Text='<%# Bind("Descripcion") %>' />
                </li>
                <li>
                    <label class="bold">Precio:</label>
                    <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
                </li>
                <li>
                    <label class="bold">Stock:</label>
                    <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock") %>' />
                </li>
                <li>
                    <label class="bold">Descontinuado:</label>
                    <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                        Checked='<%# Bind("Descontinuado") %>' />
                </li>
                <li class="push">
                     <asp:LinkButton CssClass="btn btn-round" ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton CssClass="btn btn-round" ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </li>
            </ul>
            </div>          
        </EditItemTemplate>
        <InsertItemTemplate>
            
            <div class="forms columnar">
                <ul>
                <li>
                    <label class="bold" >Id:</label>
                    <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                </li>
                <li>
                    <label class="bold">Cagegoria:</label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" DataSourceID="odsCategorias" 
                    DataTextField="descripcion" DataValueField="id" 
                    SelectedValue='<%# Bind("CategoriaId") %>'>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="odsCategorias" runat="server" 
                        onobjectcreating="odsCategorias_ObjectCreating" 
                        SelectMethod="GetAllFromCategoria" 
                        TypeName="DBSystem.BusinessLogic.CategoriaBL"></asp:ObjectDataSource>
                </li>
                <li>
                    <label class="bold">Codigo:</label>
                    <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
                    <asp:RequiredFieldValidator ID="rfVCodigo" runat="server" 
                        ErrorMessage="El codigo es Requerido" ControlToValidate="CodigoTextBox" 
                        CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <ajaxToolkit:ValidatorCalloutExtender ID="rfVCodigo_ValidatorCalloutExtender" 
                        runat="server" Enabled="True" TargetControlID="rfVCodigo">
                    </ajaxToolkit:ValidatorCalloutExtender>
                </li>
                <li>
                    <label class="bold">Descripcion:</label>
                    <asp:TextBox ID="DescripcionTextBox" runat="server" 
                    Text='<%# Bind("Descripcion") %>' />
                </li>
                <li>
                    <label class="bold">Precio:</label>
                    <asp:TextBox ID="PrecioTextBox" runat="server" Text='<%# Bind("Precio") %>' />
                </li>
                <li>
                    <label class="bold">Stock:</label>
                    <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock") %>' />
                </li>
                <li>
                    <label class="bold">Descontinuado:</label>
                    <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                        Checked='<%# Bind("Descontinuado") %>' />
                </li>
                <li class="push">
                     <asp:LinkButton CssClass="btn btn-round" ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton CssClass="btn btn-round" ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </li>
            </ul>
            </div>

            
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
            Descontinuado:
            <asp:CheckBox ID="DescontinuadoCheckBox" runat="server" 
                Checked='<%# Bind("Descontinuado") %>' Enabled="false" />
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
</asp:Content>
