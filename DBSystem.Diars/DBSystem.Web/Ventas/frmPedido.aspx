<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPedido.aspx.cs" Inherits="DBSystem.Web.Ventas.frmPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:UpdatePanel ID="upCliente"  runat="server">
        <ContentTemplate>            
            <fieldset>
                <legend>Cliente</legend>
                <label class="bold" >Ruc/DNI</label>
                <asp:TextBox ID="txtRucDNI" runat="server" /> 
                <asp:Button ID="btnBuscarCliente" CssClass="btn" Text="..." runat="server" 
                    onclick="btnBuscarCliente_Click" />
                <br />
                <label class="bold" >Razón Social</label>
                <asp:TextBox ID="txtRazonSocial" runat="server" Width="300px" /><br />
                <label class="bold" >Dirección</label>
                <asp:TextBox ID="txtDireccion" Width="200px" runat="server" />
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBuscarCliente" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="udpProductos" runat="server">
        <ContentTemplate>
            <fieldset>
                <legend>Productos</legend>
                <label class="bold">Criterio</label>
                <asp:TextBox ID="txtCriterio" Width="200px" runat="server" />
                <asp:Button ID="btnBuscarProducto" CssClass="btn" Text="Buscar" runat="server" />
                &nbsp;<asp:GridView ID="gvProductos" runat="server" DataSourceID="odsProductos" 
                    AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="Id" ForeColor="#333333" GridLines="None" PageSize="3" 
                    onrowcommand="gvProductos_RowCommand" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Categoria.Descripcion" HeaderText="Categoria" 
                            SortExpression="Categoria" />
                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                            SortExpression="Codigo" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" 
                            SortExpression="Descripcion" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" 
                            SortExpression="Precio" />
                        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                        <asp:CheckBoxField DataField="Descontinuado" HeaderText="Descontinuado" 
                            SortExpression="Descontinuado" />
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <asp:Button ID="bntAdd" CssClass="btn" CommandName="AddDetalle" CommandArgument='<%# Eval("Id") %>'  runat="server" Text="Agregar" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:ObjectDataSource ID="odsProductos" runat="server" 
                    onobjectcreating="odsProductos_ObjectCreating" 
                    SelectMethod="GetFromProductoByCriterio" 
                    TypeName="DBSystem.BusinessLogic.ProductoBL">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtCriterio" Name="criterio" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnBuscarProducto" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="udpDetalle" runat="server">
        <ContentTemplate>
            <fieldset>
                <legend>Detalle Pedido</legend>
                <asp:GridView ID="gvDetallePedido" runat="server" AutoGenerateColumns="False" > 
                    <Columns>
                        <asp:BoundField DataField="Producto.Codigo" HeaderText="Codigo" />
                        <asp:BoundField DataField="Producto.Descripcion" HeaderText="Descripción" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCantidad" runat="server" Text="<%# Bind('cantidad') %>" 
                                    Width="50px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPrecio" runat="server" Text="<%# Bind('precio') %>" 
                                    Width="50px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Monto">
                            <ItemTemplate>
                                <asp:Label ID="lblMonto" runat="server" Text="<%# Bind('monto') %>"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones">
                            
                            <ItemTemplate>
                                <asp:Button ID="btnQuitar" runat="server" 
                                    CommandArgument="Eval('productoId')" 
                                    CommandName="QuitarDetalle" 
                                    CssClass="btn" Text="Quitar" />
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvProductos" EventName="RowCommand" />
        </Triggers>
    </asp:UpdatePanel>
       
     
    
</asp:Content>
